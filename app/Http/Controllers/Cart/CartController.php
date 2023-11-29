<?php

namespace App\Http\Controllers\Cart;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartProduct;
use App\Models\CartProductPhotography;
use App\Models\Product;
use App\Models\ProductPhotography;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Session;

class CartController extends Controller
{
    public function index()
    {
        $breadcrumbs = [
            [
                'title' => 'Giỏ hàng',
                'url' => '/gio-hang'
            ]
        ];
        if (Auth::check()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();

            return view('cart.index', compact('breadcrumbs', 'cart_quantity'));
        } else {
            $cart_quantity = 0;
            return view('cart.index', compact('breadcrumbs', 'cart_quantity'));
        }
    }
    public function getItemsCart(Request $request)
    {
        if (Auth::check()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $get_data_cart = CartProduct::where('cart_id', $cart->id)->get();

            $data_cart = [
                "data" => [],
                "total" => 0
            ];
            foreach ($get_data_cart as $product) {
                $total_product = 0;
                $list = [];
                foreach ($product->cart_product_photography as $photo) {
                    $total_product += $photo->quantity * $photo->product_photography->price;
                    $list[] = [
                        "photography_id" => $photo->id,
                        "photography_image" => $photo->product_photography->image,
                        "photography_title" => $photo->product_photography->photography->title,
                        "photography_price_unit" => $this->numberFormat($photo->product_photography->price),
                        "photography_price_total" => $this->numberFormat($photo->product_photography->price * $photo->quantity),
                        "price" => $photo->product_photography->price,
                        "quantity" => $photo->quantity,
                    ];
                }

                $data_cart['data'][] = [
                    "product_id" => $product->product->id,
                    "product_name" => $product->product->name,
                    "product_image" => explode(' ', $product->product->image)[0],
                    "product_total" => $this->numberFormat($total_product),
                    "list" => $list
                ];

                $data_cart['total'] += $total_product;
            }
            $data_cart['total'] = $this->numberFormat($data_cart['total']);

            $cart_quantity = CartProduct::where('cart_id', $cart->id)->count();
            return [
                'status' => 200,
                'data'  => $data_cart,
                'cart_quantity' => $cart_quantity
            ];
        } else {
            //Display cart without login
            $cartData = $request->get('cart');
            $get_data_cart = $cartData;
            $data_cart = [
                "data" => [],
                "total" => 0
            ];
            foreach ($get_data_cart as $product) {
                $productDetail = Product::find($product['product_id']);
                $total_product = 0;
                $list = [];
                foreach ($product['photos'] as $photo) {
                    $photoDetails = ProductPhotography::find($photo['id']);
                    $total_product += $photo['quantity'] * $photo['price'];
                    $list[] = [
                        "photography_id" => $photo['id'],
                        "photography_image" => $photoDetails->image,
                        "photography_title" => $photoDetails->photography->title,
                        "photography_price_unit" => $this->numberFormat($photo['price']),
                        "photography_price_total" => $this->numberFormat($photo['price'] * $photo['quantity']),
                        "price" => $photo['price'],
                        "quantity" => $photo['quantity'],
                    ];
                }

                $data_cart['data'][] = [
                    "product_id" => $product['product_id'],
                    "product_name" => $productDetail->name,
                    "product_image" => explode(' ', $productDetail->image)[0],
                    "product_total" => $this->numberFormat($total_product),
                    "list" => $list
                ];

                $data_cart['total'] += $total_product;
            }
            $data_cart['total'] = $this->numberFormat($data_cart['total']);

            return [
                'status' => 200,
                'data'  => $data_cart,
            ];
        }
    }
    public function addToCart(Request $request)
    {
        $product_id = $request->get('product_id');
        $data_photo_selected = $request->get('data_photo_selected');
        if (Auth::check()) {
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $check_cart_product = CartProduct::where('cart_id', $cart->id)->where('product_id', $product_id)->first();
            if (!$check_cart_product) {
                $check_cart_product = CartProduct::create([
                    'cart_id' => $cart->id,
                    'product_id' => $product_id
                ]);
            }

            foreach ($data_photo_selected as $photo) {
                $check_photo = CartProductPhotography::where('cart_product_id', $check_cart_product->id)->where('product_photography_id', $photo['id'])->first();
                if ($check_photo) {
                    $check_photo->update([
                        'quantity' => $check_photo->quantity + $photo['quantity']
                    ]);
                } else {
                    CartProductPhotography::create([
                        'cart_product_id' => $check_cart_product->id,
                        'product_photography_id' => $photo['id'],
                        'quantity' => $photo['quantity']
                    ]);
                }
            }

            return [
                "status" => 200,
                "message" => "Thêm vào giỏ hàng thành công!",
                "quantity_cart" => CartProduct::count()
            ];
        } else {
            // Thêm vào giỏ hàng khi chưa đăng nhập
            $cart =  [];

            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            $found = false;
            foreach ($cart as &$cartItem) {
                if ($cartItem['product_id'] == $product_id) {
                    // Sản phẩm đã có trong giỏ hàng, cập nhật số lượng
                    $found = true;
                    foreach ($data_photo_selected as $photo) {
                        $photoId = $photo['id'];
                        $quantity = $photo['quantity'];
                        $price = $photo['price'];
                        $foundPhoto = false;

                        // Kiểm tra xem ảnh đã có trong giỏ hàng chưa
                        foreach ($cartItem['photos'] as &$cartPhoto) {
                            if ($cartPhoto['id'] == $photoId) {
                                // Ảnh đã có trong giỏ hàng, cập nhật số lượng
                                $cartPhoto['price'] = $price;
                                $cartPhoto['quantity'] += $quantity;
                                $foundPhoto = true;
                                break;
                            }
                        }

                        // Nếu ảnh chưa có trong giỏ hàng, thêm mới
                        if (!$foundPhoto) {
                            $cartItem['photos'][] = [
                                'id' => $photoId,
                                'price' => $price,
                                'quantity' => $quantity,
                            ];
                        }
                    }
                    break;
                }
            }

            // Nếu sản phẩm chưa có trong giỏ hàng, thêm mới
            if (!$found) {
                $cart[] = [
                    'product_id' => $product_id,
                    'photos' => $data_photo_selected,
                ];
            }

            return response([
                "status" => 200,
                "message" => "Thêm vào giỏ hàng thành công! ",
                "isAuth" => Auth::check(),
                'cart' => $cart,
                "quantity_cart" => count($cart),
            ]);
        }
    }

    public function removeProduct(Request $request)
    {
        $cart = Cart::where('user_id', Auth::user()->id)->first();
        $product_id = $request->get('product_id');
        $deleted = CartProduct::where('cart_id', $cart->id)->where('product_id', $product_id)->delete();
        if ($deleted) {
            return [
                "status" => 200
            ];
        }

        return [
            "status" => 500
        ];
    }

    public function updateQuantity(Request $request)
    {
        if (Auth::check()) {
            $photography_id = $request->get('photography_id');
            $quantity = $request->get('quantity');

            if ((int) $quantity > 0) {
                CartProductPhotography::where('id', $photography_id)->update([
                    'quantity' => $quantity
                ]);

                return [
                    "status" => 200,
                    'quantity' => $quantity
                ];
            } else if ((int) $quantity <= 0) {
                $check = CartProductPhotography::where('id', $photography_id)->first();
                $cart_product_id = $check->cart_products->id;

                $check->delete();

                $get_cart_product = CartProduct::where('id', $cart_product_id)->first();
                if ($get_cart_product->cart_product_photography->count() <= 0) {
                    $get_cart_product->delete();
                }

                return [
                    "status" => 200,
                    'quantity' => $quantity
                ];
            }

            return [
                "status" => 500
            ];
        }
    }
}
