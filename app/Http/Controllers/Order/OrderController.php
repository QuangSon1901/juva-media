<?php

namespace App\Http\Controllers\Order;

use App\Http\Controllers\Controller;
use App\Mail\NewOrder;
use App\Models\Cart;
use App\Models\CartProduct;
use App\Models\CartProductPhotography;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\OrderProductPhotography;
use App\Models\Product;
use App\Models\User;
use Carbon\Exceptions\Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;


class OrderController extends Controller
{
    public function order(Request $request) {
        if(Auth::check()){
            $cart = Cart::where('user_id', Auth::user()->id)->first();
            $products = CartProduct::where('cart_id', $cart->id)->get();
    
            $order = Order::create([
                'name' => $request->get('name'),
                'phone' => $request->get('phone'),
                'email' => $request->get('email'),
                'address' => $request->get('address'),
                'user_id' => Auth::user()->id,
                'status' => 0,
            ]);
    
            foreach ($products as $product) {
                $orderProduct = OrderProduct::create([
                    'order_id' => $order->id,
                    'product_id' => $product->product->id
                ]);
    
                foreach ($product->cart_product_photography as $photo) {
                    OrderProductPhotography::create([
                        'quantity' => $photo->quantity,
                        'order_product_id' => $orderProduct->id,
                        'product_photography_id' => $photo->product_photography_id
                    ]);
                }
            }
            // $product = Product::Where('id', $orderProduct->product_id)
            Mail::to($request->get('email'))->send(new NewOrder($order, $orderProduct));
            CartProduct::where('cart_id', $cart->id)->delete();
    
            return [
                'status' => 200,
                'message' => 'Đặt hàng thành công!'
            ];
        } else{
            $cart = $request->get('cart');
            $user = User::where('role', 0)->first();
            $order = Order::create([
                'name' => $request->get('name'),
                'phone' => $request->get('phone'),
                'email' => $request->get('email'),
                'address' => $request->get('address'),
                'user_id' => $user->id,
                'status' => 0,
            ]);
    
            foreach ($cart as $product) {
                $orderProduct = OrderProduct::create([
                    'order_id' => $order->id,
                    'product_id' => $product['product_id']
                ]);
    
                foreach ($product['photos'] as $photo) {
                    OrderProductPhotography::create([
                        'quantity' => $photo['quantity'],
                        'order_product_id' => $orderProduct->id,
                        'product_photography_id' => $photo['id']
                    ]);
                }
            }
            // $product = Product::Where('id', $orderProduct->product_id)
            Mail::to($request->get('email'))->send(new NewOrder($order, $orderProduct));
    
            return [
                'status' => 200,
                'message' => 'Đặt hàng thành công!',
                'isAuth' => Auth::check()
            ];
        }
        
    }
}
