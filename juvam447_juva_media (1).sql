-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th2 02, 2024 lúc 02:48 PM
-- Phiên bản máy phục vụ: 8.0.36
-- Phiên bản PHP: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `juvam447_juva_media`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `level` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `status`, `image`, `url`, `level`, `created_at`, `updated_at`) VALUES
(5, 1, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1704076832/zwddenjxceclgsenhuze.png', 'https://juvamedia.vn/san-pham/ao-thun-flatlay', 0, '2023-12-11 13:45:46', '2023-12-31 19:40:37'),
(6, 1, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545903/fa275yhvqobctpmfehhx.jpg', 'https://juvamedia.vn/san-pham/ao-thun-tay-dai-phoi', 1, '2023-12-14 09:25:08', '2024-01-29 02:09:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL,
  `slug` text NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '11',
  `topic_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `description`, `content`, `slug`, `user_id`, `topic_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bật mí cách chụp ảnh sản phẩm đẹp bằng điện thoại chuyên nghiệp', 'Cách chụp ảnh sản phẩm đẹp bằng điện thoại là cả một nghệ thuật. Bài viết này sẽ chia sẻ tới bạn các loại điện thoại có thể sử dụng để chụp ảnh, phương pháp thiết lập phông nền, kỹ thuật cùng nhiều típ chụp chuyên nghiệp và xử lý hậu kỳ khác.', '<p>Thay v&igrave; phải tốn k&eacute;m đầu tư một m&aacute;y ảnh chuy&ecirc;n nghiệp, sao bạn kh&ocirc;ng t&igrave;m đến những chiếc smartphone, vừa để li&ecirc;n lạc v&agrave; chụp ảnh sản phẩm, chi ph&iacute; lại tiết kiệm hơn nhiều nhỉ. Những c&aacute;ch chụp ảnh bằng điện thoại đẹp Sapo tổng hợp chia sẻ b&ecirc;n dưới chắc chắn sẽ gi&uacute;p &iacute;ch cho bạn rất nhiều.</p>\n\n<p><img alt=\"Tìm hiểu cách chụp ảnh sản phẩm đẹp bằng điện thoại\" src=\"https://blog.dktcdn.net/files/cach-chup-anh-san-pham-bang-dien-thoai-dep-19.jpg\" /></p>\n\n<p>T&igrave;m hiểu c&aacute;ch chụp ảnh sản phẩm đẹp bằng điện thoại. (Ảnh: Sưu tầm Internet)</p>\n\n<h2><strong>1. Lựa chọn điện thoại chụp ảnh ph&ugrave; hợp</strong></h2>\n\n<p>T&igrave;m hiểu c&aacute;c c&aacute;ch chụp ảnh sản phẩm đẹp bằng điện thoại kh&ocirc;ng thể bỏ qua yếu tố đầu ti&ecirc;n - chọn thiết bị chụp h&igrave;nh ph&ugrave; hợp. Hệ điều h&agrave;nh IOS, Android đều c&oacute; những d&ograve;ng m&aacute;y được nh&agrave; sản xuất ch&uacute; trọng đến t&iacute;nh năng chụp ảnh chuy&ecirc;n nghiệp. T&ugrave;y theo t&iacute;nh chất sản phẩm kinh doanh, t&agrave;i ch&iacute;nh cho ph&eacute;p m&agrave; bạn c&oacute; thể lựa chọn đầu tư một chiếc điện thoại hợp l&yacute;. Tuy nhi&ecirc;n, để c&oacute; những bức ảnh sản phẩm thu h&uacute;t nhất, bạn n&ecirc;n đầu tư chiếc điện thoại c&oacute; camera tối thiểu từ 8-12 megapixel k&egrave;m theo một số t&iacute;nh năng cơ bản như lấy n&eacute;t, c&acirc;n bằng s&aacute;ng tốt để hạn chế thấp nhất c&aacute;c lỗi như nh&ograve;e, vỡ n&eacute;t hay thiếu s&aacute;ng,&hellip;</p>\n\n<p>Một số si&ecirc;u phẩm điện thoại đẹp l&yacute; tưởng để chụp ảnh sản phẩm c&oacute; thể kể tới l&agrave; c&aacute;c d&ograve;ng Iphone v&agrave; Samsung S, Note&hellip;</p>\n\n<h2><strong>2. C&aacute;ch chụp ảnh sản phẩm đẹp bằng điện thoại - Giữ ống k&iacute;nh camera sạch</strong></h2>\n\n<p>Kiếm được chiếc điện thoại chụp ảnh đẹp, h&atilde;y nhớ giữ g&igrave;n n&oacute; cẩn thận. V&igrave; bạn c&ograve;n d&ugrave;ng để li&ecirc;n lạc, chơi game hay nghe nhạc,&hellip; Ống k&iacute;nh camera thường nằm mặt sau n&ecirc;n v&acirc;n tay, bụi bẩn, nước,&hellip; rất dễ b&aacute;m v&agrave;o che khuất, hoặc l&agrave;m mờ ảnh. Do đ&oacute;, trước khi bắt đầu chụp, h&atilde;y kiểm tra camera, d&ugrave;ng b&ocirc;ng tăm hoặc vải mềm lau nhẹ nh&agrave;ng đảm bảo ống k&iacute;nh được sạch sẽ.</p>\n\n<h2><strong>3. Chụp ảnh bằng smartphone trong điều kiện &aacute;nh s&aacute;ng tốt</strong></h2>\n\n<p>Chụp ảnh bằng điện thoại kh&ocirc;ng dễ như m&aacute;y ảnh, bởi vậy h&atilde;y chuẩn bị đủ &aacute;nh s&aacute;ng để c&oacute; được bức h&igrave;nh sắc n&eacute;t nhất. C&oacute; 2 nguồn s&aacute;ng l&agrave; nh&acirc;n tạo (đ&egrave;n điện) v&agrave; tự nhi&ecirc;n(mặt trời). Để c&oacute; được những tấm h&igrave;nh ưng &yacute; nhất kh&ocirc;ng kh&oacute; chỉ cần bạn lưu &yacute; những ghi nhớ sau.</p>\n\n<p><img alt=\"Đảm bảo điều kiện ánh sáng khi chụp ảnh sản phẩm bằng điện thoại\" src=\"https://blog.dktcdn.net/files/cach-chup-anh-san-pham-bang-dien-thoai-dep-20.jpg\" /></p>\n\n<p>Đảm bảo điều kiện &aacute;nh s&aacute;ng khi chụp ảnh sản phẩm bằng điện thoại. (Ảnh: Sưu tầm Internet)</p>\n\n<ul>\n	<li><strong>Canh giờ &ldquo;v&agrave;ng&rdquo;:&nbsp;</strong>&Aacute;nh s&aacute;ng mặt trời tự nhi&ecirc;n sẽ cho bạn nước ảnh tuyệt nhất. Khoảng từ 8-10h s&aacute;ng v&agrave; 3- 5h chiều- khi đ&oacute; nắng kh&ocirc;ng qu&aacute; ch&oacute;i v&agrave; gắt đ&iacute;ch thị l&agrave; 2 thời điểm chụp ảnh l&yacute; tưởng nhất.</li>\n	<li><strong>N&oacute;i kh&ocirc;ng với chụp ngược s&aacute;ng:</strong>&nbsp;Chụp ngược s&aacute;ng kh&ocirc;ng lột tả được sản phẩm r&otilde; r&agrave;ng, nước ảnh lại cực xấu nữa. Bởi vậy, nếu nguồn s&aacute;ng nằm ph&iacute;a sau sản phẩm th&igrave; tuyệt đối kh&ocirc;ng chụp.</li>\n	<li><strong>Thiếu &aacute;nh s&aacute;ng- kh&ocirc;ng chụp:</strong>&nbsp;Kh&ocirc;ng gian thiếu s&aacute;ng cũng kh&ocirc;ng thực hiện, v&igrave; ảnh sẽ rất tối kh&ocirc;ng thể n&agrave;o nh&igrave;n r&otilde; được.</li>\n	<li><strong>Đo độ s&aacute;ng tr&ecirc;n sản phẩm:</strong>&nbsp;Khi chụp, h&atilde;y nhớ chạm tay v&agrave;o m&agrave;n h&igrave;nh tại vị tr&iacute; của sản phẩm cần s&aacute;ng hay tối, chức năng đo độ s&aacute;ng vật thể tự động của điện thoại sẽ gi&uacute;p bạn ho&agrave;n th&agrave;nh.</li>\n	<li><strong>Đừng qu&ecirc;n &aacute;nh s&aacute;ng nh&acirc;n tạo:</strong>&nbsp;Trường hợp chụp buổi tối hoặc m&ocirc;i trường thiếu s&aacute;ng, h&atilde;y tận dụng đ&egrave;n điện để đảm bảo c&oacute; được bức h&igrave;nh s&aacute;ng n&eacute;t đ&uacute;ng &yacute;.</li>\n</ul>\n\n<h2><strong>4. Lựa chọn ph&ocirc;ng nền ph&ugrave; hợp khi chụp ảnh bằng smartphone</strong></h2>\n\n<p>Ph&ocirc;ng nền chụp ảnh sản phẩm hay c&ograve;n gọi l&agrave; Background (bối cảnh) được hiểu như nền trang tr&iacute;, l&agrave;m nổi bật sản phẩm của bạn hơn. Phải l&agrave;m g&igrave; để c&oacute; một bối cảnh đẹp?</p>\n\n<p><img alt=\"Lựa chọn phông nền chụp ảnh sản phẩm phù hợp\" src=\"https://blog.dktcdn.net/files/cach-chup-anh-san-pham-bang-dien-thoai-dep-21.jpg\" /></p>\n\n<p>Lựa chọn ph&ocirc;ng nền chụp ảnh sản phẩm ph&ugrave; hợp. (Ảnh Sưu tầm Internet)</p>\n\n<ul>\n	<li><strong>Sử dụng studio box/foldio:</strong>&nbsp;Nếu bạn kinh doanh những mặt h&agrave;ng c&oacute; k&iacute;ch thước nhỏ như k&iacute;nh mắt, đồng hồ, trang sức,&hellip; th&igrave; đ&acirc;y l&agrave; đạo cụ bạn cần c&oacute;.</li>\n	<li>Chọn m&agrave;u nền đống nhất: Đừng ngại thử những gam m&agrave;u n&oacute;ng, tương phản để tạo hiệu ứng gi&uacute;p sản phẩm của m&igrave;nh nổi bật hơn như v&agrave;ng - xanh lam hay đen - trắng,..</li>\n	<li><strong>Ph&ocirc;ng nền chụp ảnh sản phẩm n&ecirc;n để tự nhi&ecirc;n:</strong>&nbsp;Chọn ph&ocirc;ng nền nh&acirc;n tạo qu&aacute; tạo cảm gi&aacute;c &ldquo;ảo&rdquo; kh&ocirc;ng thật, một background tự nhi&ecirc;n như đường phố, h&agrave;ng c&acirc;y,&hellip; sẽ cho ta bức ảnh &ldquo;thực hơn&rdquo; rất nhiều. Chọn v&agrave; trang tr&iacute; ph&ocirc;ng nền chỉ n&ecirc;n dừng lại ở mức đủ để l&agrave;m nổi bật sản phẩm, nếu cầu k&yacute; qu&aacute; lại v&ocirc; t&igrave;nh hạ thấp sản phẩm, nhiều chi tiết qu&aacute; lại khiến kh&aacute;ch h&agrave;ng rối mắt, kh&ocirc;ng hiểu dụ &yacute; của bạn l&agrave; g&igrave;.</li>\n</ul>\n\n<p>Chẳng hạn như bạn chụp ảnh sản phẩm quần &aacute;o, h&atilde;y chọn kh&ocirc;ng gian rộng, sinh động như đường phố sẽ thu được kết quả tốt hơn. C&ograve;n nếu chụp ảnh sản phẩm trang sức, để tr&aacute;nh đơn điệu, h&atilde;y treo ch&uacute;ng l&ecirc;n gi&aacute;, sử dụng c&aacute;c nguy&ecirc;n liệu trang tr&iacute; để bức ảnh thu h&uacute;t hơn</p>\n\n<h2><strong>5. C&aacute;ch chụp ảnh sản phẩm đẹp bằng điện thoại - Đảm bảo bố cục hợp l&yacute;</strong></h2>\n\n<p>Ch&uacute;ng ta kh&ocirc;ng phải l&agrave; c&aacute;c nhiếp ảnh gia chuy&ecirc;n nghiệp, bởi vậy kh&ocirc;ng thể ngay lập tức lựa được bố cục chuẩn ngay khi cầm điện thoại l&ecirc;n được. Để chọn được bố cục l&agrave;m nổi bật sản phẩm nhất, h&atilde;y nằm l&ograve;ng 4 quy tắc sau:</p>\n\n<p><img alt=\"Bố cục đảm bảo ảnh chụp sản phẩm hoàn hảo\" src=\"https://blog.dktcdn.net/files/cach-chup-anh-san-pham-bang-dien-thoai-dep-22.jpg\" /></p>\n\n<p>Bố cục đảm bảo ảnh chụp sản phẩm ho&agrave;n hảo. (Ảnh: Sưu tầm Internet)</p>\n\n<ul>\n	<li>Chọn vị tr&iacute; đặt sản phẩm của m&igrave;nh thật nổi bật</li>\n	<li>Trong một khung h&igrave;nh chỉ để tối đa 5 vật thể</li>\n	<li>Nắm vững &ldquo;Nguy&ecirc;n tắc tỷ lệ v&agrave;ng 1/3&rdquo;</li>\n	<li>Để c&oacute; bức ảnh ưng &yacute; phải lưu &yacute; nguy&ecirc;n tắc &ldquo;Bố cục tu&acirc;n theo S&aacute;ng tạo&rdquo;</li>\n</ul>\n\n<p>&ldquo;Nguy&ecirc;n tắc tỷ lệ v&agrave;ng 1/3&rdquo;: Mỗi một khung ảnh được hai cặp đường thẳng ngang v&agrave; dọc cắt ra l&agrave;m 9 phần khoảng c&aacute;ch đều nhau. Hầu hết c&aacute;c d&ograve;ng smartphone hiện nay đều t&iacute;ch hợp t&iacute;nh năng n&agrave;y.</p>\n\n<p>Chiếu theo nguy&ecirc;n tắc n&agrave;y th&igrave; bạn n&ecirc;n đặt chủ thể ở điểm giao giữa 4 đường thẳng sẽ tạo điểm nhấn hơn l&agrave; đặt giữa khung h&igrave;nh, mặc d&ugrave; tăng độ tập trung nhưng lại kh&ocirc;ng g&acirc;y ấn tượng cho người xem.</p>\n\n<p>Khi đ&atilde; quen với 3 quy tắc đầu ti&ecirc;n, tiếp theo việc bạn c&oacute; thu về những tấm h&igrave;nh quảng c&aacute;o b&aacute;n h&agrave;ng hiệu quả hay kh&ocirc;ng phải c&ograve;n tr&ocirc;ng chờ ở &oacute;c s&aacute;ng tạo của bạn.</p>\n\n<p>&nbsp;</p>\n\n<p><img alt=\"Thiết kế website các ngành nghề\" src=\"https://blog.dktcdn.net/files/thiet-ke-website-sapo-web-gif.gif\" /></p>\n\n<p><strong>Thiết kế website c&aacute;c ng&agrave;nh nghề!</strong></p>\n\n<p>Bạn đ&atilde; c&oacute; website online chưa? Quảng b&aacute; th&ocirc;ng tin, sản phẩm cho hơn&nbsp;150 triệu kh&aacute;ch h&agrave;ng v&agrave;&nbsp;th&uacute;c đẩy gấp đ&ocirc;i doanh số nhờ&nbsp;<a href=\"https://www.sapo.vn/thiet-ke-website.html?utm_campaign=cpn:blog_ref-plm:&amp;utm_source=blog&amp;utm_medium=ref_box_web&amp;utm_content=fm:text_link-km:-sz:&amp;utm_term=&amp;campaign=blog_ref_web\" target=\"_blank\">thiết kế website&nbsp;</a>&nbsp;Sapo Web&nbsp;ngay n&agrave;o!&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<h2><strong>6. T&igrave;m kiếm g&oacute;c chụp sản phẩm ph&ugrave; hợp</strong></h2>\n\n<p>C&aacute;ch chụp ảnh sản phẩm đẹp bằng điện thoại bạn n&ecirc;n ch&uacute; &yacute; tiếp theo l&agrave; t&igrave;m kiếm g&oacute;c chụp sản phẩm ph&ugrave; hợp. Mẹo dễ d&agrave;ng c&oacute; được g&oacute;c ảnh thần th&aacute;nh nhất đ&oacute; l&agrave; di chuyển kh&ocirc;ng ngừng cơ thể v&agrave; tay cầm m&aacute;y. Đừng nghĩ chụp ảnh sản phẩm bằng điện thoại sẽ bị hạn chế s&aacute;ng tạo, c&oacute; kh&aacute; nhiều g&oacute;c chụp để bạn chọn:</p>\n\n<p><img alt=\"Tìm kiếm góc chụp sản phẩm phù hợp.\" src=\"https://blog.dktcdn.net/files/cach-chup-anh-san-pham-bang-dien-thoai-dep-23.jpg\" /></p>\n\n<p>T&igrave;m kiếm g&oacute;c chụp sản phẩm ph&ugrave; hợp. (Ảnh: Sưu tầm Internet)</p>\n\n<ul>\n	<li><strong>G&oacute;c ngang mắt cơ bản:</strong>&nbsp;G&oacute;c n&agrave;y thường được &aacute;p dụng nhiều nhất v&igrave; c&oacute; thể khiến người xem tập trung cao nhất v&agrave;o vật thể ch&iacute;nh.</li>\n	<li><strong>G&oacute;c chụp tổng thể từ cao xuống hoặc từ dưới l&ecirc;n:</strong>&nbsp;Chụp theo hai g&oacute;c n&agrave;y nhằm mục đ&iacute;ch gi&uacute;p kh&aacute;ch h&agrave;ng dễ d&agrave;ng ph&aacute;n đo&aacute;n được phom d&aacute;ng, m&agrave;u sắc,&hellip; về sản phẩm hơn. Những bạn n&agrave;o c&oacute; &yacute; định kinh doanh quần &aacute;o th&igrave; n&ecirc;n &aacute;p dụng hai g&oacute;c chụp n&agrave;y nh&eacute;!</li>\n	<li><strong>G&oacute;c chụp ch&eacute;o độc đ&aacute;o</strong>: G&oacute;c chụp mang t&iacute;nh ngẫu nhi&ecirc;n nhưng đem đến hiệu ứng chiều s&acirc;u cực ổn, kh&aacute;ch h&agrave;ng c&oacute; th&ecirc;m c&aacute;i nh&igrave;n to&agrave;n diện về sản phẩm của bạn. Nếu bạn kinh doanh trang sức, phụ kiện thời trang th&igrave; đ&acirc;y đ&iacute;ch thị l&agrave; g&oacute;c chụp &ldquo;nằm l&ograve;ng&rdquo; d&agrave;nh cho bạn.</li>\n	<li><strong>Chụp cận cảnh (macro):</strong>&nbsp;Mọi chi tiết đặc biệt, tinh xảo nhất của sản phẩm sẽ được lột tả hết nhờ g&oacute;c chụp n&agrave;y, người mua cũng sẽ th&ecirc;m tin tưởng v&agrave;o bạn hơn. Nếu chẳng may chiếc dế cưng của bạn kh&ocirc;ng hỗ trợ t&iacute;nh năng n&agrave;y, đừng lo, chỉ cần đầu tư một ống k&iacute;nh rời gắn v&agrave;o camera trước l&agrave; c&oacute; thể thoải m&aacute;i chụp macro. Chế độ chụp n&agrave;y rất ph&ugrave; hợp với những shop kinh doanh đồng hồ, trang sức v&agrave; c&aacute;c mặt h&agrave;ng chế t&aacute;c, chạm trổ, th&ecirc;u th&ugrave;a cầu kỳ, nhiều chi tiết nhỏ.</li>\n</ul>\n\n<p>H&atilde;y chịu kh&oacute; t&igrave;m ra c&aacute;c g&oacute;c chụp mới để tăng sự độc đ&aacute;o cho h&igrave;nh ảnh sản phẩm. Bởi mỗi g&oacute;c chụp sẽ đem đến cho người xem một cảm nhận kh&aacute;c nhau, họ sẽ kh&ocirc;ng cảm thấy nh&agrave;m ch&aacute;n m&agrave; thực sự bị cuốn h&uacute;t, t&ograve; m&ograve; muốn biết sản phẩm đ&oacute; thực hư như thế n&agrave;o.</p>\n\n<h2><strong>7. C&aacute;ch chụp ảnh sản phẩm đẹp bằng điện thoại - Đừng qu&ecirc;n lấy n&eacute;t v&agrave; cầm chắc m&aacute;y</strong></h2>\n\n<p>Lấy n&eacute;t bằng camera điện thoại qu&aacute; dễ, chỉ cần chạm ng&oacute;n tay v&agrave;o vị tr&iacute; vật thể tr&ecirc;n m&agrave;n h&igrave;nh thiết bị l&agrave; ok, bấm chụp l&agrave; xong. Tuy nhi&ecirc;n, vấn đề lại ở việc bạn c&oacute; cầm chắc smartphone trong l&uacute;c t&aacute;c nghiệp hay kh&ocirc;ng mới đ&aacute;ng để b&agrave;n.</p>\n\n<p>Nếu tay bạn rung, hoặc động t&aacute;c di chuyển kh&ocirc;ng dứt kho&aacute;t trong khi chụp sẽ kh&ocirc;ng thể n&agrave;o thu được bức ảnh r&otilde; n&eacute;t, h&igrave;nh ảnh sẽ bị mờ rất kh&oacute; coi. V&igrave; c&aacute;c d&ograve;ng smartphone hiện đều c&oacute; khối lượng kh&aacute; nhẹ, mỏng n&ecirc;n việc cầm chắc thực sự rất kh&oacute;.</p>\n\n<p><img alt=\"Lấy nét và giữ máy ảnh chắc chắn đảm bảo ảnh chụp sản phẩm đẹp\" src=\"https://blog.dktcdn.net/files/cach-chup-anh-san-pham-bang-dien-thoai-dep-24.jpg\" /></p>\n\n<p>Lấy n&eacute;t v&agrave; giữ m&aacute;y ảnh chắc chắn đảm bảo ảnh chụp sản phẩm đẹp. (Ảnh: Sưu tầm Internet)</p>\n\n<p>V&agrave; d&ugrave; nhược điểm n&agrave;y đ&atilde; được c&aacute;c h&agrave;ng khắc phục bằng c&aacute;ch t&iacute;ch hợp t&iacute;nh năng chống rung quang học, nhưng t&iacute;nh năng n&agrave;y chỉ đạt hiệu quả với rung khi đi t&agrave;u, xe,&hellip;m&agrave; th&ocirc;i. Vậy, để việc cầm m&aacute;y chụp ảnh kh&ocirc;ng c&ograve;n l&agrave; mối lo ngại, bạn h&atilde;y nhớ:</p>\n\n<ul>\n	<li>Nắm chắc điện thoại, bấm chụp v&agrave; giữ m&aacute;y khoảng v&agrave;i gi&acirc;y</li>\n	<li>Đặt chụp hẹn giờ để hạn chế rung tay</li>\n</ul>\n\n<p>Nếu c&oacute; thể h&atilde;y đầu tư một chiếc ch&acirc;n m&aacute;y ảnh (tripod ) để đặt điện thoại l&agrave; c&aacute;ch giải quyết tối ưu nhất cho trường hợp rung m&aacute;y. Một tripod c&oacute; gi&aacute; dao động từ 300.000 đến 500.000đ gi&uacute;p giữ thăng bằng, cố định thiết bị mang lại cho bạn khung h&igrave;nh như &yacute;. Đ&acirc;y l&agrave; một trong những c&aacute;ch chụp ảnh sản phẩm đẹp bằng điện thoại kh&ocirc;ng phải ai cũng biết.</p>\n\n<p>Khi đ&atilde; chuẩn bị mọi thứ ổn thỏa l&agrave; l&uacute;c bạn chỉ cần bấm chụp rồi lưu lại l&agrave; ok. Một ch&uacute; &yacute; nhỏ đ&oacute; l&agrave; bạn n&ecirc;n chụp nhiều c&ugrave;ng l&uacute;c để c&oacute; thể dễ d&agrave;ng lựa được những g&oacute;c chụp sản phẩm đẹp nhất.</p>\n\n<blockquote>\n<p>Nếu bạn c&oacute; một chiếc m&aacute;y ảnh, l&agrave;m thế n&agrave;o để chụp ảnh sản phẩm đẹp v&agrave; chuy&ecirc;n nghiệp?</p>\n\n<p>Xem ngay&nbsp;<em><a href=\"https://www.sapo.vn/blog/huong-dan-chup-anh-san-pham/\" target=\"_blank\">C&aacute;ch chụp ảnh sản phẩm si&ecirc;u đẹp bằng m&aacute;y ảnh</a></em>.</p>\n</blockquote>\n\n<h2><strong>8. Học c&aacute;ch sử dụng c&aacute;c phần mềm chỉnh sửa ảnh</strong></h2>\n\n<p>Một c&aacute;ch chụp h&igrave;nh sản phẩm đẹp bằng điện thoại kh&ocirc;ng thể kh&ocirc;ng nhắc đến l&agrave; xử l&yacute; hậu kỳ với c&aacute;c phần mềm chỉnh sửa ảnh. Sau khi chụp ảnh sản phẩm bằng điện thoại, ch&uacute;ng ta cơ bản đ&atilde; c&oacute; được bức h&igrave;nh như &yacute; muốn rồi. Nhưng để đẹp hơn nữa, chuy&ecirc;n nghiệp hơn nữa, th&igrave; cần một bước sau c&ugrave;ng l&agrave; chỉnh sửa ảnh sản phẩm sau chụp.</p>\n\n<p>Tất cả c&aacute;c mẫu smartphone đều được c&agrave;i sẵn những ứng dụng chỉnh sửa ảnh, tuy nhi&ecirc;n hiệu quả n&oacute; mang lại chưa cao, chưa đủ để tạo n&ecirc;n những bức h&igrave;nh chuy&ecirc;n nghiệp để kinh doanh.</p>\n\n<p><img alt=\"Các phần mềm chỉnh sửa ảnh giúp ảnh chụp sản phẩm của bạn đẹp hơn\" src=\"https://blog.dktcdn.net/files/cach-chup-anh-san-pham-bang-dien-thoai-dep-25.jpg\" /></p>\n\n<p>C&aacute;c phần mềm chỉnh sửa ảnh gi&uacute;p ảnh chụp sản phẩm của bạn đẹp hơn. (Ảnh: Sưu tầm Internet)</p>\n\n<p>H&atilde;y truy cập Apple Store nếu bạn d&ugrave;ng Iphone, Google Play nếu bạn d&ugrave;ng điện thoại chạy Android hoặc Windows store nếu bạn d&ugrave;ng Nokia, c&oacute; v&ocirc; v&agrave;n c&aacute;c phần mềm, c&ocirc;ng cụ chỉnh sửa, photoshop từ đơn giản tới phức tạp, miễn ph&iacute; v&agrave; mất ph&iacute; để bạn chọn, h&atilde;y tải về rồi sử dụng.</p>\n\n<p>Để việc chỉnh sửa ảnh bằng điện thoại đạt hiệu quả tối đa nhất, m&aacute;ch bạn một v&agrave;i&nbsp;<a href=\"https://www.sapo.vn/blog/17-cong-cu-chinh-sua-anh-san-pham-online-dep-va-chuyen-nghiep/\" target=\"_blank\">c&ocirc;ng cụ chỉnh sửa ảnh sản phẩm</a>&nbsp;được đ&aacute;nh gi&aacute; cao nhất ph&ugrave; hợp từng hệ điều h&agrave;nh, đ&oacute; l&agrave;:</p>\n\n<ul>\n	<li>Nếu d&ugrave;ng Nokia (hệ điều h&agrave;nh Window Phone): Bạn t&igrave;m v&agrave; tải Nokia Camera, Photo Express hay Fotor,&hellip; sẽ cho bạn c&acirc;u trả lời th&iacute;ch đ&aacute;ng l&agrave; những tấm h&igrave;nh ho&agrave;n hảo nhất.</li>\n	<li>Nếu bạn d&ugrave;ng Iphone hay d&ograve;ng m&aacute;y sử dụng hệ điều h&agrave;nh Android th&igrave; Snapseed VSCOcam, Studio, InstaMag, Moldiv,&hellip; ch&iacute;nh l&agrave; những c&ocirc;ng cụ sẽ kh&ocirc;ng phụ l&ograve;ng mong đợi của bạn.</li>\n	<li>Ngo&agrave;i ra, những ứng dụng như Quick, Phonto, Typic, Bubble Frame, Over, Piclab,&hellip; sẽ gi&uacute;p bạn ch&egrave;n chữ v&agrave;o ảnh nhanh gọn, đơn giản.</li>\n	<li>Hoặc bạn muốn gh&eacute;p nhiều ảnh v&agrave;o một khung? Photo Wonder, Layout của Instagram, &hellip; sẽ gi&uacute;p bạn đạt được mục đ&iacute;ch.</li>\n</ul>\n\n<p>Tr&ecirc;n đ&acirc;y l&agrave; c&aacute;c&nbsp;<strong>c&aacute;ch chụp ảnh sản phẩm đẹp bằng điện thoại</strong>&nbsp;để bạn tham khảo. Hy vọng những th&ocirc;ng tin trong b&agrave;i viết sẽ gi&uacute;p bạn c&oacute; th&ecirc;m nhiều kinh nghiệm hữu &iacute;ch để bắt đầu x&acirc;y dựng bộ ảnh sản phẩm chuy&ecirc;n nghiệp v&agrave; tiết kiệm chi ph&iacute; đầu tư. Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng v&agrave; đừng qu&ecirc;n đ&oacute;n đọc c&aacute;c b&agrave;i chia sẻ tiếp theo từ Sapo nh&eacute;!</p>\n\n<p>C&oacute; một h&igrave;nh ảnh sản phẩm đẹp th&ocirc;i chưa đủ, để đăng ảnh l&ecirc;n&nbsp;<a href=\"https://www.sapo.vn/thiet-ke-website-ban-hang.html\" target=\"_blank\">website b&aacute;n h&agrave;ng</a>&nbsp;cho tối ưu, bạn tuyệt đối kh&ocirc;ng được bỏ qua những lưu &yacute; sau nh&eacute;!</p>', 'bat-mi-cach-chup-anh-san-pham-dep-bang-dien-thoai-chuyen-nghiep', 11, 1, 1, '2024-01-29 01:48:19', '2024-01-29 01:48:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 11, '2024-01-29 01:39:24', '2024-01-29 01:39:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_products`
--

CREATE TABLE `cart_products` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_product_photography`
--

CREATE TABLE `cart_product_photography` (
  `id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `cart_product_id` bigint UNSIGNED NOT NULL,
  `product_photography_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_product_photography`
--

CREATE TABLE `order_product_photography` (
  `id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `order_product_id` bigint UNSIGNED NOT NULL,
  `product_photography_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `photography`
--

CREATE TABLE `photography` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `photography`
--

INSERT INTO `photography` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(6, 'Góc Trước', '', '2023-12-07 02:35:02', '2023-12-07 02:35:02'),
(7, 'Góc sau', '', '2023-12-11 06:21:01', '2023-12-11 06:21:01'),
(8, 'Mặt trước', '', '2023-12-12 19:33:14', '2023-12-12 19:33:14'),
(9, 'Mặt sau', '', '2023-12-12 19:33:31', '2023-12-12 19:33:31'),
(10, 'Cận cổ', '', '2023-12-12 19:34:58', '2023-12-12 19:34:58'),
(11, 'Chất vải', '', '2023-12-12 19:35:15', '2023-12-12 19:35:15'),
(12, 'Tag sườn', '', '2023-12-12 19:37:19', '2023-12-12 19:37:19'),
(13, 'Logo', '', '2023-12-12 19:37:29', '2023-12-12 19:37:29'),
(14, 'Chụp với hộp', '', '2023-12-12 19:37:52', '2023-12-12 19:37:52'),
(15, 'Tay áo', '', '2023-12-12 19:38:12', '2023-12-12 19:38:12'),
(16, 'Cận hình in', '', '2023-12-12 19:38:23', '2023-12-12 19:38:23'),
(17, 'Lưng quần', '', '2023-12-13 19:23:22', '2023-12-13 19:23:22'),
(18, 'Túi', '', '2023-12-13 19:23:28', '2023-12-13 19:23:28'),
(19, 'Ống quần', '', '2023-12-13 19:23:33', '2023-12-13 19:23:33'),
(20, 'Khóa kéo', '', '2023-12-13 22:38:47', '2023-12-13 22:38:47'),
(21, 'Túi trong', '', '2023-12-13 22:39:22', '2023-12-13 22:39:22'),
(22, 'Chi tiết', '', '2023-12-13 22:39:34', '2023-12-13 22:39:34'),
(23, 'Phân loại màu 1', '', '2023-12-13 22:40:19', '2023-12-13 22:40:19'),
(24, 'Phân loại màu 2', '', '2023-12-13 22:40:25', '2023-12-13 22:40:25'),
(25, 'Góc khác', '', '2023-12-13 22:40:45', '2023-12-13 22:40:45'),
(26, 'Túi sau', '', '2023-12-13 22:44:45', '2023-12-13 22:44:45'),
(27, 'Sáng tạo', '', '2023-12-13 22:45:28', '2023-12-13 22:45:28'),
(28, 'Góc nghiêng', '', '2023-12-13 23:38:57', '2023-12-13 23:38:57'),
(29, 'Mở ví', '', '2023-12-13 23:39:37', '2023-12-13 23:39:37'),
(30, 'Đựng thẻ', '', '2023-12-13 23:39:47', '2023-12-13 23:39:47'),
(31, 'Mặt trong', '', '2023-12-13 23:45:37', '2023-12-13 23:45:37'),
(32, 'Góc bên hông', '', '2023-12-13 23:46:54', '2023-12-13 23:46:54'),
(33, 'Phân loại các màu', '', '2023-12-13 23:47:30', '2023-12-13 23:47:30'),
(34, 'Phân loại màu 3', '', '2023-12-13 23:48:01', '2023-12-13 23:48:01'),
(35, 'Chống nước', '', '2023-12-13 23:54:20', '2023-12-13 23:54:20'),
(36, 'Đựng đồ', '', '2023-12-13 23:54:44', '2023-12-13 23:54:44'),
(37, 'Phân loại size', '', '2023-12-13 23:55:13', '2023-12-13 23:55:13'),
(38, 'dựng đứng', '', '2023-12-14 00:38:39', '2023-12-14 00:38:39'),
(39, 'Đeo tay', '', '2023-12-14 00:44:10', '2023-12-14 00:44:10'),
(40, 'Concept 1', '', '2023-12-14 00:44:23', '2023-12-14 00:44:23'),
(41, 'Concept 1', '', '2023-12-14 00:52:22', '2023-12-14 00:52:22'),
(42, 'Concept 2', '', '2023-12-14 00:52:38', '2023-12-14 00:52:38'),
(43, 'Concept 3', '', '2023-12-14 00:52:44', '2023-12-14 00:52:44'),
(44, 'Concept 4', '', '2023-12-14 00:52:53', '2023-12-14 00:52:53'),
(45, 'Concept 5', '', '2023-12-14 00:53:00', '2023-12-14 00:53:00'),
(46, 'Bố cục 1', '', '2023-12-14 00:53:43', '2023-12-14 00:53:43'),
(47, 'Bố cục 2', '', '2023-12-14 00:53:52', '2023-12-14 00:53:52'),
(48, 'Bố cục 3', '', '2023-12-14 00:53:56', '2023-12-14 00:53:56'),
(49, 'Bố cục 4', '', '2023-12-14 00:54:03', '2023-12-14 00:54:03'),
(50, 'Bố cục 5', '', '2023-12-14 00:54:59', '2023-12-14 00:54:59'),
(51, 'Bố cục 6', '', '2023-12-14 00:55:10', '2023-12-14 00:55:10'),
(52, 'Tay áo', '', '2023-12-14 01:39:06', '2023-12-14 01:39:06'),
(53, 'Các bộ phận', '', '2023-12-14 02:07:55', '2023-12-14 02:07:55'),
(54, 'Lắp Ipad', '', '2023-12-14 02:08:13', '2023-12-14 02:08:13'),
(55, 'Bẽ cong', '', '2023-12-14 02:44:14', '2023-12-14 02:44:14'),
(56, 'Sử dụng', '', '2023-12-14 02:44:36', '2023-12-14 02:44:36'),
(57, 'Chức năng', '', '2023-12-14 03:09:36', '2023-12-14 03:09:36'),
(58, 'Sản phẩm 1', '', '2023-12-16 08:25:01', '2023-12-16 08:25:01'),
(59, 'Sản phẩm 2', '', '2023-12-16 08:25:12', '2023-12-16 08:25:12'),
(60, 'Sản phẩm 3', '', '2023-12-16 08:25:21', '2023-12-16 08:25:21'),
(61, 'Sản phẩm 4', '', '2023-12-16 08:25:30', '2023-12-16 08:25:30'),
(62, 'Sản phẩm 5', '', '2023-12-16 08:25:37', '2023-12-16 08:25:37'),
(63, 'Sản phẩm 6', '', '2023-12-16 08:36:36', '2023-12-16 08:36:36'),
(64, 'Sản phẩm 7', '', '2023-12-16 08:36:45', '2023-12-16 08:36:45'),
(65, 'Sản phẩm 8', '', '2023-12-16 08:36:51', '2023-12-16 08:36:51'),
(66, 'Sản phẩm 9', '', '2023-12-16 08:36:59', '2023-12-16 08:36:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `slug` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `service_category_id` bigint UNSIGNED NOT NULL,
  `product_category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `price`, `slug`, `service_category_id`, `product_category_id`, `created_at`, `updated_at`) VALUES
(36, 'Áo thun Unisex', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435012/vcfk6zqqsfebltkwzsb2.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435062/hbs5vt67n9xjuinwmsd5.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435024/oyerb85abg1pzymhjsth.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435022/yvfh4ez0b6b2obkoxifc.jpg', 45000, 'ao-thun-flatlay', 27, 8, '2023-12-12 19:38:40', '2023-12-12 19:50:34'),
(37, 'Áo sơ mi tay dài', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>Đối với những &aacute;o c&oacute; họa tiết phức tạp, caro, đường kẽ th&igrave; chi ph&iacute; + 20k/tấm ạ.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702436043/dv6yik1116qkxwrbdotj.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702436133/qa5f78ydmxq62or1plqx.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702436065/coql7p8kpqfbdt18haxm.jpg', 60000, 'ao-so-mi-tay-dai', 28, 8, '2023-12-12 19:55:41', '2023-12-12 19:56:55'),
(38, 'Quần short', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702520667/r0qcd8ti8eemaxfg9f8e.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702520671/biywrocd02qiseqobxyp.jpg', 45000, 'quan-short', 29, 9, '2023-12-13 19:25:14', '2023-12-14 01:59:22'),
(39, 'Áo khoác bomber', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532466/elzokxv4dgurzhs2weqv.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532478/eammuqzdods2qynhppm3.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532478/cmwifczt2nxu5usln8fm.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532478/hvc3lfebkefyvebmcjww.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532476/icm4endqcqb0iiyqzy3t.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532473/ojb9zp0pzeex3kwbozku.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532473/p3xlgullmgrx8d2topjx.jpg', 60000, 'ao-khoac-bomber', 31, 8, '2023-12-13 22:41:26', '2023-12-13 22:41:26'),
(40, 'Quần jean nam', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532863/gytu1uwgxlrd7ll1zfvp.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532821/k8uledhiozxcljae04eg.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532818/iw3y2r1rlsahb8gtgspx.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532811/jni31thkbrnchs2mi3oj.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532802/evhslkvvdiw1y3dyzu6f.jpg', 60000, 'quan-jean-nam', 32, 9, '2023-12-13 22:47:44', '2023-12-13 22:47:44'),
(41, 'Quần lửng', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702533338/t1zo7ggshdnezmqxktsu.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702533370/m2oynrpb0ydhjozrqh2m.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702533369/tx6kzfwlyiegzgze4dih.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702533345/fmazvqizaixrwpmwbfkr.jpg', 60000, 'quan-lung', 29, 9, '2023-12-13 22:58:42', '2023-12-13 22:58:42'),
(42, 'Ví dài', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536051/k44aaxsrpbgci8otybzy.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536075/mhlusfwrnuibke4pimm0.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536075/qpmsmny2bbvikzkdedbf.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536072/efuql60exa7f16ujlbxo.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536071/y9tlpvtxv8jpvnmtumny.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536067/dukxbrdu9mkv6fsxogol.jpg', 60000, 'vi-dai', 33, 10, '2023-12-13 23:41:24', '2023-12-13 23:41:24'),
(43, 'Bao da Ipad đầu hươu', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536514/tekqz9lmywmlcuokpxl1.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536536/fhtvucgal5e1vi3pdyte.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536535/ycztomptx8jusibqha3e.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536535/oe8ybfx4fn63tprmqh11.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536532/twjl3eotlakw3wr0ywun.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536520/hrl6wfam7lltdayo1qkp.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536519/xgjst1lg6n8ofextyup0.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536518/v3qoiqzjrjyq22l27exa.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536517/x2qgp2cwi2ybvdrvcwau.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536517/rfl3yefvmihkoi5nrdkl.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536516/afzjliwo7lazzppacphy.jpg', 60000, 'bao-da-ipad-dau-huou', 34, 10, '2023-12-13 23:49:10', '2023-12-13 23:49:10'),
(44, 'Túi chồng sốc Laptop', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536962/cpfgnxbovu8ckgaytcag.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702537067/rheejhg8wqepu8h1jcff.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702537059/v7f6qzcmkcxirehxscnp.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536970/hgwpoddmtgiiommspoj1.jpg', 60000, 'tui-chong-soc-laptop', 34, 11, '2023-12-13 23:56:48', '2023-12-13 23:58:07'),
(45, 'Ví da nam', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539574/zip4pd3somkzkdve4tqo.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539604/rr4tapfbyff8g8o7xkwg.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539603/jvd9qfuk9elmvmzgpgs1.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539599/ewjlebwbtagjdfksgapr.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539597/mjmcdizavzk4xuwgzhqi.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539596/cbydu2taoovnv6cmuw1q.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539580/nmpyptrvennx7doaefhu.jpg', 60000, 'vi-da-nam', 33, 10, '2023-12-14 00:40:28', '2023-12-14 00:40:28'),
(46, 'Đồng hồ nam', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539897/iqhf7w3zwof9eseyw4z1.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539917/svap3tm5vhkxakdmjn5p.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539917/wjepsd5jl0hzppvojjwk.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539911/mbkgso6wlw34a96ovtea.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539908/hdxvhlcrfxevn2bkahei.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539901/v5vqfplxy70hg4lij3ox.jpg', 150000, 'dong-ho-nam', 33, 10, '2023-12-14 00:45:25', '2023-12-14 00:45:25'),
(47, 'Xà phòng Handmade', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540554/mkj2hunwf8wao6ys0ktz.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540581/lj9ulbgi4pbe3pcwxxsn.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540577/rdjx2psihoeqxs1kkrbu.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540574/e5ewyl24fwgysdxldxri.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540568/hh0azfjrgcslrhxhmnfq.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540559/ev4dk7gphlxeenv3kypr.jpg', 150000, 'xa-phong-handmade', 35, 12, '2023-12-14 00:56:29', '2023-12-14 00:56:29'),
(48, 'Yến sào/chưng', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540805/df8wpqdivuzhjxajcblu.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540836/s7ovbvbfqpdub2jindym.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540831/g9bbakdgyusltyagpzsd.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540830/dgjr0doouuhoidte5ziw.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540830/jepjbn1kgylpde0dm71i.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540824/xs7wcaqghttf5dndlc1n.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540824/shsuorsrmtyyiu6b8rdf.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540819/ezfpdhjsyvjrnvbwziej.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540820/dh9tjas1qqcckhmddl09.jpg', 100000, 'yen-sao-chung', 35, 12, '2023-12-14 01:01:57', '2023-12-14 01:01:57'),
(49, 'Nước tẩy trang', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541073/b1dkxtfi9ncbwlwrfou1.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541083/ahhtvwvkbwoyn5xw0z1j.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541080/ku3ercigg9tqe1r1l89k.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541078/mnch4kce4cem0dfsucgx.jpg', 100000, 'nuoc-tay-trang', 35, 12, '2023-12-14 01:05:54', '2023-12-14 01:05:54'),
(50, 'Son môi', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541264/uyi47pq1lsrpvvrkk09m.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541277/klu2hswvsgxgzilrkugs.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541277/ukb8sdfewqe5fuultrgd.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541276/gtdama47sr9pn4zhjojq.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541274/gh4xewfwdtnlyxzusfel.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541273/wxhq5ejzzozishnal29u.jpg', 100000, 'son-moi', 35, 12, '2023-12-14 01:08:04', '2023-12-14 01:08:04'),
(51, 'Nước hoa', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541416/ttzcggbchywccgz6fjvk.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541444/aduooqsthwooapidvtlb.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541443/m6uep1g45ndvwppng1sv.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541420/li6kg3iqda2edtrpzdxd.jpg', 100000, 'nuoc-hoa', 35, 12, '2023-12-14 01:11:27', '2023-12-14 01:11:27'),
(52, 'Vòng trầm hương', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541747/aliflxlw2zms784v7jsh.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541774/lcfbjuvoocy6aomgghai.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541771/sgpvkzvspzlhu9jttiie.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541739/xiqzgfeeionbpdhgxlqq.jpg', 80000, 'vong-tram-huong', 35, 12, '2023-12-14 01:18:12', '2023-12-14 01:18:12'),
(53, 'Tinh dầu Gừng', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702542007/hgpoyq1iog0ylvfaspym.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702542011/q5wsdmvt6dkumhs7oqph.jpg', 300000, 'tinh-dau-gung', 35, 12, '2023-12-14 01:20:17', '2023-12-14 01:20:17'),
(54, 'Áo thun len nam', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702543198/lvmpqrpyrexrmfffcoew.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702543230/pgybelurfphhmnfo05j6.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702543228/xybq9iwwszej3f9t26aw.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702543207/pfh4stdujmmybneffmjm.jpg', 45000, 'ao-thun-len-nam', 27, 8, '2023-12-14 01:40:58', '2023-12-14 01:40:58'),
(55, 'Ví canva nam', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544069/apig90ec2qf82n811cku.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544139/y8o3c04vtxkd3lccbl67.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544136/lkpk5edr3thc4qstr67b.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544134/jb5mgqu7asl5lm23m7ad.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544132/ogvd5le7ablo7efuyw0e.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544129/yo8of6uqiu6sqscwsjsc.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544124/rfhj6ujukaccpc3ozwqk.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544123/ponleytd9bam1ry1roul.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544103/im0tm33bs3g6wwu6oyqp.jpg', 60000, 'vi-canva-nam', 33, 10, '2023-12-14 01:56:19', '2023-12-14 01:56:19'),
(56, 'Bao da Ipad B1', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544965/wzs6ylqnethdn39utjul.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545023/lck4xq8r6jfey3saz9wb.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545023/yrb9f2m0zz8vjjroahoc.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545020/znjazuvf61egayk7uovm.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545019/dqvormm0zobnef2lyxu3.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545019/vuvagwbqse2jgpwj2q97.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545016/myyom1gqzjsblezs16ie.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545014/k5n9l2nwjkuxmy6m1aob.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545013/sortjwvkzgk2mxfoyqgd.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545009/rsenhrymmpygbqtqeslb.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702545007/t9cjut5ebpjdkptg4wdf.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544990/glgxbsa2htk7qtaeffs4.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544977/xpooec1oyqaomitasyuz.jpg', 60000, 'bao-da-ipad-b1', 34, 11, '2023-12-14 02:10:53', '2023-12-14 02:10:53'),
(57, 'Bao nhựa Macbook', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547165/echlf7gtu4dnrfwfpw8k.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547180/r2vtuofrtxvnqi8fwizp.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547180/u7y8e7xhbwufquydcuou.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547180/hfuvs7yd0ipfys2ktr72.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547180/oyadcbuvgfh9nkelvmzg.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547180/bb1nygoxeabjr6lt6ydu.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547179/usn9oyv1i0t0euqpsnjh.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547179/qgccmpe79tkiwr2ocfsf.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547179/tgj0y07xahgxkdggwzdn.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547179/qh0ngxzxlzltjtphapct.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547179/n53ij0dwuzbj73ohiqzp.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547178/jd0c1macwqllxojrxczk.jpg', 80000, 'bao-nhua-macbook', 34, 11, '2023-12-14 02:46:25', '2023-12-14 02:46:25'),
(58, 'Giá đỡ Macbook', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547798/wznisofcdvz1hladf5lv.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547824/n7xp8midpnq1unpg9ig6.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547823/gbau2a9yfugxxsj7mxmf.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547822/w20rxg6pb9uozmagr36j.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547821/rdaptgufkv68hspoy1yn.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547821/q3oeazc9urymcalxklls.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547821/meiayjfayukrh3zlg4z9.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547817/iemyzab7zjimsbsqo3mc.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547813/jgfnllmqmt9kzbdpxqty.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547809/es5d9sqxdy8vlu3uncv7.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547805/alx2wuom3fjhwbyrhym8.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547804/mz7rrqtppmmwxt0rqnry.jpg', 80000, 'gia-do-macbook', 34, 12, '2023-12-14 02:57:54', '2023-12-14 02:57:54'),
(59, 'Bao da đầu hươu', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548087/mifikganwvvzsb2l6ywg.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548107/movi12qjbdbyse3ez7ca.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548106/rvumy2xzaooxiskdvjd4.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548106/vosbuckkmz12i93osntk.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548104/vnoagkkdb6i7ot6n2opa.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548102/iuotodhcejaberzorvsc.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548091/ubhcpzizgfwhomb3lwo1.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548088/kscsi5owkzcazee2ce0r.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548086/y1yhprg6ycdmmuvzqpgz.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548086/tut3gnbkvujv7bgaoh4o.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548085/r0ayglqczeh8rh85iizm.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548084/oao4xqismidjyfvc8nhz.jpg', 60000, 'bao-da-dau-huou', 34, 12, '2023-12-14 03:02:48', '2023-12-14 03:02:48'),
(60, 'Bao da trong suốt', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548691/wtgnr5dvnwluysmdpbvk.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548691/loqrael6micv8qafuhx0.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548684/lrlogxagbablco8rwkgs.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548684/vwoc757hhmdwfwedipmw.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548683/ndwbpegm2922a57j2y6m.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548681/xq2hqgnfgwmivjk8ohq9.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548681/mimckq8c7kh9kf3xkbmd.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548679/cytnuvlbpdofcjxduxil.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548679/krloz2xoxp7oekuhf663.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548673/sqwow94nnhe7vtn8lc1a.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548668/jrreufob0gofeiryluba.jpg', 80000, 'bao-da-trong-suot', 34, 11, '2023-12-14 03:13:01', '2023-12-14 03:13:01'),
(61, '1 sản phẩm chụp 1 tấm', '<p>Mỗi sản phẩm chỉ chụp một tấm duy nhất b&ecirc;n Juva t&iacute;nh gi&aacute; 60k/tấm ạ nhận tối thiểu 6 tấm một lần chụp.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740488/d5cylnvgjq7ygyynjq1o.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740445/zgjdlu2o55nvwjgdpjrq.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740442/mqheox1ehgal6uymvul0.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740443/gf3hiqc6wdrc5oe6plvu.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740442/mb91ap2z77uhnpnep2uq.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740438/m6vud4zwpqjxvowgxqrw.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740431/hcfkcylxmtnelh4dlgry.jpg', 60000, '1-san-pham-chup-1-tam', 27, 8, '2023-12-16 08:28:14', '2023-12-16 08:28:14'),
(62, 'Áo thun tay lỡ form rộng, over size', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740736/yto2o0tum7damo4ma04u.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740853/xm5tsidy4jnza1w2gyki.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740850/szbxvdg7v5k2i3kpymr0.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740848/n3hbsf7dzmpgaj1arov0.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740845/wjiiwaq3tqofnjie2out.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740760/efvzq7arzdrqcfl7fgoa.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740754/lzogcnpgsrexv234cvhx.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740747/bjsktfcwskj8fljemh9b.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740745/ddr0rnlysdaha2hgdvcn.jpg', 45000, 'ao-thun-tay-lo-form-rong-over-size', 27, 8, '2023-12-16 08:33:02', '2023-12-16 08:34:18'),
(63, 'Áo thun nam ngắn tay, chụp ảnh sản phẩm', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741106/xwowkicofxca2pwcx1of.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741133/crasbippsbggjsaufxiz.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741133/lt5dzl5ssdqsxo4s4whg.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741133/ebvob1p10p7t6uxaadbm.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741133/vljdpfuajklnvfvznkcs.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741132/ujenykmiyygcpv1fh4br.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741132/twcjajgqbb12b5k2qxuc.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741132/cnojbft8gbdafhwfeg6d.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741131/onyvvohuzz8ka2lou5im.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741131/uasuifw52mzn1y3mfycf.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741116/vxmt2mdytyhfqlqbgabn.jpg', 60000, 'ao-thun-nam-ngan-tay-chup-anh-san-pham', 27, 8, '2023-12-16 08:39:06', '2023-12-16 08:39:06'),
(64, 'Váy trẻ em', '<p>Chụp ảnh sản phẩm v&aacute;y em b&eacute;</p>\n\n<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741463/bvniqjbjlpbydtpdvhbt.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741486/dmg3akahb5bqo2calby6.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741481/xbzhjelttbkrrfjwudad.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741475/ww85a9enbchsqwla24vd.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741467/ldpaaqclgqjjfbq0sihr.jpg', 60000, 'vay-tre-em', 27, 13, '2023-12-16 08:49:03', '2023-12-16 08:49:03'),
(65, 'Áo thun OVERSIZE MONOS', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882619/zroeu04bsekepinkgrep.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882633/ixq6r3igde6zallrvagz.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882632/meukr8yaorubmhqpjrvb.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882632/devursesw0uobggr9srm.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882630/n8elf5tmg5tqa7xfzx5u.jpg', 45000, 'ao-thun-oversize-monos', 27, 8, '2023-12-17 23:57:19', '2023-12-17 23:57:19'),
(66, 'Áo thun tay dài', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883016/orcwdtvhwbwgejf9rm6m.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883049/gogjspay3unzifbnxe4b.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883045/e6iqdiqpiqn9mg0dil9f.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883044/hdaotmnirkuyz7xzonkd.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883040/kmwtm99403onutqjukbf.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883038/b6va0h6xlu9fb1nuytlz.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883038/zl9ksgxv1o5bnjsaf07y.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883031/ds7j77jpb8e7bqfwqcfb.jpg', 60000, 'ao-thun-tay-dai', 27, 8, '2023-12-18 00:04:23', '2023-12-18 00:04:23'),
(67, 'Áo thun tay dài phối màu', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883219/lglq82wwxkirpjhtpo1d.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883244/urxlld8u61ntfrqyw6gk.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883235/ebzwno1csn59s15vrsod.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883236/mykht58cxdyen9mr9dzv.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883233/ljrgpt8onnl0g7esqnmj.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883231/fhf5wpmacgmsyyf3yhch.jpg', 60000, 'ao-thun-tay-dai-phoi-mau', 27, 8, '2023-12-18 00:08:05', '2023-12-18 00:08:05'),
(68, 'Áo thun tay lỡ Scensord', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883655/rtlzuwyl0dmcei6k68nm.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883681/yvw297jna5bjtpe7qnec.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883677/liziurwd7q193g4t9byt.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883677/wjqcvdf35fejgwaol5xh.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883675/zyubcaaiixfti0zoex6w.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883668/p0k5pbpitihoctkukbpf.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883668/t521pbvbpe0cuapcpkko.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883667/b4e8yin0vkceepe8agcq.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883659/bh2kg3weqmaunxk8ixv3.jpg', 45000, 'ao-thun-tay-lo-scensord', 27, 8, '2023-12-18 00:16:38', '2023-12-18 00:16:38'),
(69, 'Áo thun nam trên ghế Sofa', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884103/twktzsokmcc5c93b7c1c.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884144/i5aiycxiobybksnyah9t.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884142/lbcxsafsiosrho0jxgbe.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884142/ovsv5kmh3stm1i3v9jtw.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884142/vzhmqntsedhjwjzdyadj.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884140/tqa107lvlctowcwowooa.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884137/s5zotnbt1iriwmzadiuo.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884126/mvltcu6czlckqwz9j0pk.jpg', 60000, 'ao-thun-nam-tren-ghe-sofa', 36, 8, '2023-12-18 00:28:04', '2023-12-18 00:28:04'),
(70, 'Áo thun Bigsize', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884659/utipnwmfjrxiokcut3ag.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884678/tam5x90iz9bgzx0t4r4t.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884673/r366oxxdenguefwflnet.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884672/g2d1dqfsbtnxnrdwlxat.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884666/mtdcy5adkqdxfkndyhqf.jpg', 45000, 'ao-thun-bigsize', 27, 8, '2023-12-18 00:31:47', '2023-12-18 00:31:47'),
(71, 'Hoodie form rộng', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884926/y5xilqcudvbv1edinzgv.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884951/bqyko6jvkfnlplg8ag1j.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884947/cw2sc1dpdmx6luuxnous.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884947/utmr5azxwlxljnwpaseo.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884943/irmrv8t7t7eozlbsknys.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884941/swtnrtdfqk7llgltmzpy.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884936/vem4egxrfwff3tykzgrz.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884936/aaonzuwu3aoc3m2rdnig.jpg', 60000, 'hoodie-form-rong', 31, 8, '2023-12-18 00:36:10', '2023-12-18 00:36:10'),
(72, 'Áo 2 dây nữ', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885362/pskc0gdtizrdw2ntddpi.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885371/raudaz8bzuwtnf0qzgfc.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885370/zpazfcufcebd46t3dcox.jpg', 60000, 'ao-2-day-nu', 27, 8, '2023-12-18 00:42:56', '2023-12-18 00:42:56'),
(73, 'Áo thun 3 lổ nữ', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885433/gowiswimuvjop6htohln.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885439/ojitbcqpn6syzdhgkjro.jpg', 60000, 'ao-thun-3-lo-nu', 27, 8, '2023-12-18 00:44:03', '2023-12-18 00:44:03'),
(74, 'Áo thun treo sào nhiều mẫu', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885728/l4ewp56talpeeo0nuwhj.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885672/c1hrpavytc6iad7tmlml.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885668/ti51nexfskmgleyf20xy.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885667/jnmu4yqtcaivo9vhbyib.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885665/geolwz3ozmglpyok4umo.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885663/d5zkx2ckblbacohmjdf8.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885643/z2t9hrhbpumcv8plz9yp.jpg', 80000, 'ao-thun-treo-sao-nhieu-mau', 36, 8, '2023-12-18 00:48:51', '2023-12-18 00:48:51'),
(75, 'Áo thun 3 lổ nam', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702886137/mf7pxl2r52oo3renvkps.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702886140/fdvva9y6hukt1ghdsdym.jpg', 45000, 'ao-thun-3-lo-nam', 27, 8, '2023-12-18 00:55:58', '2023-12-18 00:55:58'),
(76, 'Túi xách nam', '<p>Đ&acirc;y chỉ l&agrave; c&aacute;c g&oacute;c phổ biến b&ecirc;n Juva thường chụp cho kh&aacute;ch, ngo&agrave;i những g&oacute;c tr&ecirc;n nếu bạn muốn chụp g&oacute;c kh&aacute;c th&igrave; h&atilde;y inbox cho Juva nh&eacute;.</p>\n\n<p>&nbsp;</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702886237/kyej09bvfnsvbqnqq2pw.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1702886241/fhqxus8qnnrdo9eyffp7.jpg', 60000, 'tui-xach-nam', 33, 11, '2023-12-18 00:57:31', '2023-12-18 00:57:31'),
(77, 'Ccách chup ảnh sản phẩm', '<p><strong>C&aacute;ch chụp ảnh sản phẩm đẹp bằng điện thoại</strong>&nbsp;l&agrave; cả một nghệ thuật. B&agrave;i viết n&agrave;y sẽ chia sẻ tới bạn c&aacute;c loại điện thoại c&oacute; thể sử dụng để chụp ảnh, phương ph&aacute;p thiết lập ph&ocirc;ng nền, kỹ thuật c&ugrave;ng nhiều t&iacute;p chụp chuy&ecirc;n nghiệp v&agrave; xử l&yacute; hậu kỳ kh&aacute;c.&nbsp;<br />\nThay v&igrave; phải tốn k&eacute;m đầu tư một m&aacute;y ảnh chuy&ecirc;n nghiệp, sao bạn kh&ocirc;ng t&igrave;m đến những chiếc smartphone, vừa để li&ecirc;n lạc v&agrave; chụp ảnh sản phẩm, chi ph&iacute; lại tiết kiệm hơn nhiều nhỉ. Những c&aacute;ch chụp ảnh bằng điện thoại đẹp Sapo tổng hợp chia sẻ b&ecirc;n dưới chắc chắn sẽ gi&uacute;p &iacute;ch cho bạn rất nhiều.</p>', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1703661856/dxljo8ybqedhvbwkfrsg.jpg https://res.cloudinary.com/drgvvh4sv/image/upload/v1703661900/cqa9oxfzqps9r68g6iaj.jpg', 0, 'ccach-chup-anh-san-pham', 37, 8, '2023-12-27 00:25:06', '2023-12-27 00:25:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(8, 'Áo', '2023-12-07 02:34:49', '2023-12-07 02:34:49'),
(9, 'quần', '2023-12-11 06:20:38', '2023-12-11 06:20:38'),
(10, 'Ví', '2023-12-13 23:37:49', '2023-12-13 23:37:49'),
(11, 'Túi', '2023-12-13 23:51:51', '2023-12-13 23:51:51'),
(12, 'Handmade', '2023-12-14 00:52:07', '2023-12-14 00:52:07'),
(13, 'Váy', '2023-12-16 08:41:29', '2023-12-16 08:41:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_photography`
--

CREATE TABLE `product_photography` (
  `id` bigint UNSIGNED NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `photography_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_photography`
--

INSERT INTO `product_photography` (`id`, `price`, `image`, `product_id`, `photography_id`, `created_at`, `updated_at`) VALUES
(42, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702434887/obbrgzb4dtmhynpa1ypm.jpg', 36, 8, '2023-12-13 02:50:34', '2023-12-13 02:50:34'),
(43, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702434892/yi1wd3eakqznpatxyfdo.jpg', 36, 9, '2023-12-13 02:50:34', '2023-12-13 02:50:34'),
(44, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702434914/mz5orzwbtvohrwf7co75.jpg', 36, 10, '2023-12-13 02:50:34', '2023-12-13 02:50:34'),
(45, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702434932/baqxridi1jqgfs3uqkrk.jpg', 36, 11, '2023-12-13 02:50:34', '2023-12-13 02:50:34'),
(46, 45000, '/images/images/9261177.png', 36, 12, '2023-12-13 02:50:34', '2023-12-13 02:50:34'),
(47, 45000, '/images/images/9261177.png', 36, 13, '2023-12-13 02:50:34', '2023-12-13 02:50:34'),
(48, 45000, '/images/images/9261177.png', 36, 14, '2023-12-13 02:50:34', '2023-12-13 02:50:34'),
(49, 45000, '/images/images/9261177.png', 36, 15, '2023-12-13 02:50:34', '2023-12-13 02:50:34'),
(50, 45000, '/images/images/9261177.png', 36, 16, '2023-12-13 02:50:34', '2023-12-13 02:50:34'),
(60, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435903/fnilk4bfqhlv8fohwibr.jpg', 37, 8, '2023-12-13 02:56:55', '2023-12-13 02:56:55'),
(61, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435906/uaqnusa3fdfu6khnvdob.jpg', 37, 9, '2023-12-13 02:56:55', '2023-12-13 02:56:55'),
(62, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435936/zh6ottukj1lw4ozrogxp.jpg', 37, 10, '2023-12-13 02:56:55', '2023-12-13 02:56:55'),
(63, 60000, 'blob:https://juvamedia.vn/1bb36dc8-be92-46bf-ad92-f8eb56997bb5', 37, 11, '2023-12-13 02:56:55', '2023-12-13 02:56:55'),
(64, 60000, '/images/images/9261177.png', 37, 15, '2023-12-13 02:56:55', '2023-12-13 02:56:55'),
(65, 60000, '/images/images/9261177.png', 37, 13, '2023-12-13 02:56:55', '2023-12-13 02:56:55'),
(66, 60000, '/images/images/9261177.png', 37, 12, '2023-12-13 02:56:55', '2023-12-13 02:56:55'),
(67, 60000, '/images/images/9261177.png', 37, 14, '2023-12-13 02:56:55', '2023-12-13 02:56:55'),
(68, 60000, '/images/images/9261177.png', 37, 16, '2023-12-13 02:56:55', '2023-12-13 02:56:55'),
(85, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532646/s8jy3utw7uvb3vfezdsk.jpg', 40, 8, '2023-12-14 05:47:44', '2023-12-14 05:47:44'),
(86, 60000, '/images/images/9261177.png', 40, 9, '2023-12-14 05:47:44', '2023-12-14 05:47:44'),
(87, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532688/k2po7qohb3erj3xpchsv.jpg', 40, 18, '2023-12-14 05:47:44', '2023-12-14 05:47:44'),
(88, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532721/iq3aezdcltldzcorl4om.jpg', 40, 26, '2023-12-14 05:47:44', '2023-12-14 05:47:44'),
(89, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532729/ohcji6mvdjrxgfoqscza.jpg', 40, 19, '2023-12-14 05:47:44', '2023-12-14 05:47:44'),
(90, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532743/itrrv0utz7tywr1qepqv.jpg', 40, 27, '2023-12-14 05:47:44', '2023-12-14 05:47:44'),
(91, 60000, '/images/images/9261177.png', 40, 11, '2023-12-14 05:47:44', '2023-12-14 05:47:44'),
(92, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532265/a456derxetjqq0ffoeqy.jpg', 39, 8, '2023-12-14 05:48:18', '2023-12-14 05:48:18'),
(93, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532267/utrkygx1jn8kgqmsx5j4.jpg', 39, 9, '2023-12-14 05:48:18', '2023-12-14 05:48:18'),
(94, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532298/vvolja6ig3iuqhyxpkmq.jpg', 39, 10, '2023-12-14 05:48:18', '2023-12-14 05:48:18'),
(95, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532343/h2ql88swqvfzsvzopclh.jpg', 39, 20, '2023-12-14 05:48:18', '2023-12-14 05:48:18'),
(96, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532346/qr9pbuyzc3vpu0vvxll4.jpg', 39, 18, '2023-12-14 05:48:18', '2023-12-14 05:48:18'),
(97, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532384/pg8vwfnyywjsfsjroiso.jpg', 39, 21, '2023-12-14 05:48:18', '2023-12-14 05:48:18'),
(98, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532384/cnknqum0tchouva5obu5.jpg', 39, 22, '2023-12-14 05:48:18', '2023-12-14 05:48:18'),
(99, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532436/gwiln22e1dpvgygeqk6v.jpg', 39, 23, '2023-12-14 05:48:18', '2023-12-14 05:48:18'),
(100, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702532441/hcyjxpp45wjjxi48xmex.jpg', 39, 24, '2023-12-14 05:48:18', '2023-12-14 05:48:18'),
(101, 60000, '/images/images/9261177.png', 39, 25, '2023-12-14 05:48:18', '2023-12-14 05:48:18'),
(102, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702533280/dqyvgihoqylqppfpduvq.jpg', 41, 8, '2023-12-14 05:58:42', '2023-12-14 05:58:42'),
(103, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702533282/jkqak5b4to9kypdxxfzs.jpg', 41, 9, '2023-12-14 05:58:42', '2023-12-14 05:58:42'),
(104, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702533301/jmeft3kvjulfbv87qeea.jpg', 41, 22, '2023-12-14 05:58:42', '2023-12-14 05:58:42'),
(105, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702533311/owtugrtjbfj7fju6pl5t.jpg', 41, 16, '2023-12-14 05:58:42', '2023-12-14 05:58:42'),
(106, 0, '/images/images/9261177.png', 41, 20, '2023-12-14 05:58:42', '2023-12-14 05:58:42'),
(107, 0, '/images/images/9261177.png', 41, 19, '2023-12-14 05:58:42', '2023-12-14 05:58:42'),
(108, 0, '/images/images/9261177.png', 41, 11, '2023-12-14 05:58:42', '2023-12-14 05:58:42'),
(109, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702535907/isv3a263qkhsivcasfzd.jpg', 42, 8, '2023-12-14 06:41:24', '2023-12-14 06:41:24'),
(110, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702535909/k6kyag4rn6sqajhhmhsp.jpg', 42, 9, '2023-12-14 06:41:24', '2023-12-14 06:41:24'),
(111, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702535930/b1beiqs0ztunnuljrisi.jpg', 42, 13, '2023-12-14 06:41:24', '2023-12-14 06:41:24'),
(112, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702535959/gagpexjyqdywyufxhptv.jpg', 42, 28, '2023-12-14 06:41:24', '2023-12-14 06:41:24'),
(113, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536007/zbi934jzumcsidbnh8f4.jpg', 42, 29, '2023-12-14 06:41:24', '2023-12-14 06:41:24'),
(114, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536014/eto9wl0yibirgtprtxpb.jpg', 42, 30, '2023-12-14 06:41:24', '2023-12-14 06:41:24'),
(115, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536028/ofv6cdvhbsdwqufqpsja.jpg', 42, 23, '2023-12-14 06:41:24', '2023-12-14 06:41:24'),
(116, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536038/sva1jqq7namn9aska0zv.jpg', 42, 24, '2023-12-14 06:41:24', '2023-12-14 06:41:24'),
(117, 0, '/images/images/9261177.png', 42, 25, '2023-12-14 06:41:24', '2023-12-14 06:41:24'),
(118, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536286/e4yuxgcjt6qxmzmemu89.jpg', 43, 8, '2023-12-14 06:49:10', '2023-12-14 06:49:10'),
(119, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536284/h24sbo1hvqcupigqhskl.jpg', 43, 9, '2023-12-14 06:49:10', '2023-12-14 06:49:10'),
(120, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536338/ybp8gpvkobhnpub8s7ea.jpg', 43, 22, '2023-12-14 06:49:10', '2023-12-14 06:49:10'),
(121, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536355/yvhujialwwgkbbszihnp.jpg', 43, 31, '2023-12-14 06:49:10', '2023-12-14 06:49:10'),
(122, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536402/bn8rw07v6slfnecj8lvx.jpg', 43, 28, '2023-12-14 06:49:10', '2023-12-14 06:49:10'),
(123, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536427/jugb9ceupd7szkxf2lnd.jpg', 43, 32, '2023-12-14 06:49:10', '2023-12-14 06:49:10'),
(124, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536468/slcg63nofnapgawhkvcs.jpg', 43, 33, '2023-12-14 06:49:10', '2023-12-14 06:49:10'),
(125, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536495/rijbtomt6xtanl0cb8fz.jpg', 43, 23, '2023-12-14 06:49:10', '2023-12-14 06:49:10'),
(126, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536498/xyoeb84gvpwy8g8qqsuk.jpg', 43, 24, '2023-12-14 06:49:10', '2023-12-14 06:49:10'),
(127, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536509/rxzsn6zxlr1ogytoe3wy.jpg', 43, 34, '2023-12-14 06:49:10', '2023-12-14 06:49:10'),
(139, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536784/ttiecaaqxsxpq2hcbkwo.jpg', 44, 8, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(140, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536787/g1feekhkzs4rcjexwcpq.jpg', 44, 9, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(141, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536788/uhojmhjbnotbrbzrduj4.jpg', 44, 31, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(142, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536809/qoonyb512puvs4itdow7.jpg', 44, 28, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(143, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536825/grynuupmj5hilk7dnrt4.jpg', 44, 11, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(144, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536863/yhaorki2fmzfegyqilsp.jpg', 44, 20, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(145, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536883/v8bo1dink1c2wthn5jxf.jpg', 44, 35, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(146, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536906/ibrfz7magutcq1xyvk1z.jpg', 44, 36, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(147, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536937/b9qkfu2fbhkfhwimszpt.jpg', 44, 33, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(148, 60000, 'blob:https://juvamedia.vn/53b8fd09-6faa-411b-910e-3d86289e2670', 44, 37, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(149, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536953/bpgobznwkymoa5qbmtak.jpg', 44, 23, '2023-12-14 06:58:07', '2023-12-14 06:58:07'),
(150, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539496/mnxr6nte9gybj3nqvyhn.jpg', 45, 8, '2023-12-14 07:40:28', '2023-12-14 07:40:28'),
(151, 60000, '/images/images/9261177.png', 45, 9, '2023-12-14 07:40:28', '2023-12-14 07:40:28'),
(152, 60000, '/images/images/9261177.png', 45, 20, '2023-12-14 07:40:28', '2023-12-14 07:40:28'),
(153, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539498/w4k73aqbvvjciifqultw.jpg', 45, 31, '2023-12-14 07:40:28', '2023-12-14 07:40:28'),
(154, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539514/zg9a7knxtwzf7g9pz7kk.jpg', 45, 29, '2023-12-14 07:40:28', '2023-12-14 07:40:28'),
(155, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539510/ih3ugj1n0gksa1znunll.jpg', 45, 30, '2023-12-14 07:40:28', '2023-12-14 07:40:28'),
(156, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539513/drmlrulxgubax6xffbn5.jpg', 45, 28, '2023-12-14 07:40:28', '2023-12-14 07:40:28'),
(157, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539536/nqhvvrehhwdzjhxzu3fi.jpg', 45, 38, '2023-12-14 07:40:28', '2023-12-14 07:40:28'),
(158, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539545/ft0h59n9lsbwpeuvbkhh.jpg', 45, 13, '2023-12-14 07:40:28', '2023-12-14 07:40:28'),
(159, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539779/szhfzab96varhc9b0swd.jpg', 46, 8, '2023-12-14 07:45:25', '2023-12-14 07:45:25'),
(160, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539788/zwzzzt5lx22pz4iutezj.jpg', 46, 32, '2023-12-14 07:45:25', '2023-12-14 07:45:25'),
(161, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539811/mk4uejqtqp100caocnco.jpg', 46, 31, '2023-12-14 07:45:25', '2023-12-14 07:45:25'),
(162, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539846/vx18ayfyxaerezzjwqjf.jpg', 46, 22, '2023-12-14 07:45:25', '2023-12-14 07:45:25'),
(163, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539868/qom03d7of5njfmpzk5gq.jpg', 46, 39, '2023-12-14 07:45:25', '2023-12-14 07:45:25'),
(164, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702539879/q6gaz8jrx1uqf7vrkae7.jpg', 46, 40, '2023-12-14 07:45:25', '2023-12-14 07:45:25'),
(171, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540490/otm29m0oqi9k0wtmitbg.jpg', 47, 46, '2023-12-14 07:56:44', '2023-12-14 07:56:44'),
(172, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540490/s6lxvhyfdsbpazgnvogg.jpg', 47, 47, '2023-12-14 07:56:44', '2023-12-14 07:56:44'),
(173, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540497/ccp6sdy7epmhgmvnuza5.jpg', 47, 48, '2023-12-14 07:56:44', '2023-12-14 07:56:44'),
(174, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540504/bjdkkmujbl6l2bwf2ljx.jpg', 47, 49, '2023-12-14 07:56:44', '2023-12-14 07:56:44'),
(175, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540527/mt07zibgdpqoicywkfeh.jpg', 47, 50, '2023-12-14 07:56:44', '2023-12-14 07:56:44'),
(176, 150000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540530/jjtwxztvgghbkxoanucu.jpg', 47, 51, '2023-12-14 07:56:44', '2023-12-14 07:56:44'),
(177, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540721/dlsysh1io4orfhmrnjqc.jpg', 48, 8, '2023-12-14 08:01:57', '2023-12-14 08:01:57'),
(178, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540738/p1k1bjxfwhzufupkdocj.jpg', 48, 41, '2023-12-14 08:01:57', '2023-12-14 08:01:57'),
(179, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540734/jhssrkzs00ekqynvxcwg.jpg', 48, 42, '2023-12-14 08:01:57', '2023-12-14 08:01:57'),
(180, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540744/boig1bfzdhqsl9hx3hws.jpg', 48, 43, '2023-12-14 08:01:57', '2023-12-14 08:01:57'),
(181, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540764/wcr4dmc34y9cbrvnx0ps.jpg', 48, 44, '2023-12-14 08:01:57', '2023-12-14 08:01:57'),
(182, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540773/exaljuw7wukg03nrkj21.jpg', 48, 45, '2023-12-14 08:01:57', '2023-12-14 08:01:57'),
(186, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541231/ew51vhoviupfcxce3ehi.jpg', 50, 41, '2023-12-14 08:08:04', '2023-12-14 08:08:04'),
(187, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541234/dxpdiszy2w87vim7ns5k.jpg', 50, 42, '2023-12-14 08:08:04', '2023-12-14 08:08:04'),
(188, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541241/ikgiz89cme5j3ocbvhz2.jpg', 50, 43, '2023-12-14 08:08:04', '2023-12-14 08:08:04'),
(189, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541243/yhqbdvan4xvqbsursudh.jpg', 50, 44, '2023-12-14 08:08:04', '2023-12-14 08:08:04'),
(190, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541249/u8sgn5nsv9nj0m906ahj.jpg', 50, 45, '2023-12-14 08:08:04', '2023-12-14 08:08:04'),
(191, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541011/tz2dxvsmgqljfagmqiuj.jpg', 49, 40, '2023-12-14 08:08:17', '2023-12-14 08:08:17'),
(192, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541022/n4bggovqbsmxuhckgp2q.jpg', 49, 42, '2023-12-14 08:08:17', '2023-12-14 08:08:17'),
(193, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541035/wsuzsjurrvopv9wfgzk9.jpg', 49, 43, '2023-12-14 08:08:17', '2023-12-14 08:08:17'),
(194, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541375/xzlt5zulhiup068qbsd1.jpg', 51, 40, '2023-12-14 08:11:27', '2023-12-14 08:11:27'),
(195, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541377/p7uz5z4dv6ax751s9pf7.jpg', 51, 42, '2023-12-14 08:11:27', '2023-12-14 08:11:27'),
(196, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541388/v6c8nm317zojcboxfnul.jpg', 51, 43, '2023-12-14 08:11:27', '2023-12-14 08:11:27'),
(197, 80000, 'blob:https://juvamedia.vn/0ee60cd6-0707-4fba-8c7b-7e9defcab6cd', 52, 46, '2023-12-14 08:18:12', '2023-12-14 08:18:12'),
(198, 80000, 'blob:https://juvamedia.vn/f4f1bfe6-2a33-4c7f-ab13-e9fd56730101', 52, 47, '2023-12-14 08:18:12', '2023-12-14 08:18:12'),
(199, 80000, 'blob:https://juvamedia.vn/1d41082b-6a12-45b6-81e9-ad1e10b60021', 52, 48, '2023-12-14 08:18:12', '2023-12-14 08:18:12'),
(200, 80000, 'blob:https://juvamedia.vn/ce02ce72-4ae5-4d72-a8c0-ac56b6131384', 52, 49, '2023-12-14 08:18:12', '2023-12-14 08:18:12'),
(201, 80000, 'blob:https://juvamedia.vn/a102e6e1-a561-4071-8fdc-5573052bc439', 52, 50, '2023-12-14 08:18:12', '2023-12-14 08:18:12'),
(203, 300000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702541997/krex8kzi3gs0z27n80vb.jpg', 53, 41, '2023-12-14 08:21:11', '2023-12-14 08:21:11'),
(204, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702542143/jwywxtqxcaxch22gsqej.jpg', 54, 8, '2023-12-14 08:40:58', '2023-12-14 08:40:58'),
(205, 45000, '/images/images/9261177.png', 54, 9, '2023-12-14 08:40:58', '2023-12-14 08:40:58'),
(206, 45000, 'blob:https://juvamedia.vn/d840ffe6-d6b3-4400-bc78-0684af467105', 54, 11, '2023-12-14 08:40:58', '2023-12-14 08:40:58'),
(207, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702543152/zzo43gehwh8muqw0sdul.jpg', 54, 10, '2023-12-14 08:40:58', '2023-12-14 08:40:58'),
(208, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702543151/i6tycdost0myoh3t8d71.jpg', 54, 28, '2023-12-14 08:40:58', '2023-12-14 08:40:58'),
(209, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702543170/aplzpsitiepsxyyng3gg.jpg', 54, 52, '2023-12-14 08:40:58', '2023-12-14 08:40:58'),
(210, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702543923/hm2eforykdfjnedx4irj.jpg', 55, 8, '2023-12-14 08:56:19', '2023-12-14 08:56:19'),
(211, 60000, '/images/images/9261177.png', 55, 9, '2023-12-14 08:56:19', '2023-12-14 08:56:19'),
(212, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702543952/om7evn1ri5og7u6rv6g5.jpg', 55, 14, '2023-12-14 08:56:19', '2023-12-14 08:56:19'),
(213, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702543963/apyindepcaleilmcx6gt.jpg', 55, 31, '2023-12-14 08:56:19', '2023-12-14 08:56:19'),
(214, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544012/hipgeyc8wo00zgbv5pqi.jpg', 55, 29, '2023-12-14 08:56:19', '2023-12-14 08:56:19'),
(215, 100000, 'blob:https://juvamedia.vn/f7ff3c5b-db2a-45ff-a0db-656cdade9909', 55, 40, '2023-12-14 08:56:19', '2023-12-14 08:56:19'),
(216, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544045/xsjefhgvrryrqud4um53.jpg', 55, 23, '2023-12-14 08:56:19', '2023-12-14 08:56:19'),
(217, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544048/lnvqgjpyiuqzghqbtluk.jpg', 55, 24, '2023-12-14 08:56:19', '2023-12-14 08:56:19'),
(218, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702520575/fbcspjfeoqw5jm2ivyym.jpg', 38, 8, '2023-12-14 08:59:22', '2023-12-14 08:59:22'),
(219, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702520582/ob4sddmki469xbrje0pa.jpg', 38, 9, '2023-12-14 08:59:22', '2023-12-14 08:59:22'),
(220, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702520605/exaycdwijrer7j8znly7.jpg', 38, 11, '2023-12-14 08:59:22', '2023-12-14 08:59:22'),
(221, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702520641/haz94vmlluzfxpdfrh8a.jpg', 38, 17, '2023-12-14 08:59:22', '2023-12-14 08:59:22'),
(222, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702520662/kx4tkd5jm45qg0labeng.jpg', 38, 18, '2023-12-14 08:59:22', '2023-12-14 08:59:22'),
(223, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702520654/wwalflp6hptdv4avfdyp.jpg', 38, 19, '2023-12-14 08:59:22', '2023-12-14 08:59:22'),
(224, 10000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544771/vu8nowdye3t5hcuxaxhm.jpg', 56, 33, '2023-12-14 09:10:53', '2023-12-14 09:10:53'),
(225, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544786/bjmw4lfumthbcs2x2uyh.jpg', 56, 8, '2023-12-14 09:10:53', '2023-12-14 09:10:53'),
(226, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544794/rfdhluxws0t90xgynuzu.jpg', 56, 9, '2023-12-14 09:10:53', '2023-12-14 09:10:53'),
(227, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544806/k98d7u8exafiofyn5sny.jpg', 56, 22, '2023-12-14 09:10:53', '2023-12-14 09:10:53'),
(228, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544859/auosnp23swdf0p66rpi7.jpg', 56, 28, '2023-12-14 09:10:53', '2023-12-14 09:10:53'),
(229, 100000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544871/vclozwdszcilug4nbvpi.jpg', 56, 42, '2023-12-14 09:10:53', '2023-12-14 09:10:53'),
(230, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544903/eedkwyfqefdmw6zgp4se.jpg', 56, 53, '2023-12-14 09:10:53', '2023-12-14 09:10:53'),
(231, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544909/qrfezdvj87roynu6fnk3.jpg', 56, 54, '2023-12-14 09:10:53', '2023-12-14 09:10:53'),
(232, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544927/tc7ledxgch2h3mzpicgu.jpg', 56, 23, '2023-12-14 09:10:53', '2023-12-14 09:10:53'),
(233, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702544930/xqwbjdvexn1r14v9rsrm.jpg', 56, 24, '2023-12-14 09:10:53', '2023-12-14 09:10:53'),
(242, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547010/caxde2oaxzy3ojfjrxl0.jpg', 57, 8, '2023-12-14 09:46:40', '2023-12-14 09:46:40'),
(243, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547021/rhngetwqzickjrmtmysh.jpg', 57, 9, '2023-12-14 09:46:40', '2023-12-14 09:46:40'),
(244, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547032/fbkfzqbn2uok6lddaz5n.jpg', 57, 38, '2023-12-14 09:46:40', '2023-12-14 09:46:40'),
(245, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547065/lzy0r8t68nhc5vklsa6q.jpg', 57, 55, '2023-12-14 09:46:40', '2023-12-14 09:46:40'),
(246, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547093/rfmddeg3einmjr8bdi1y.jpg', 57, 56, '2023-12-14 09:46:40', '2023-12-14 09:46:40'),
(247, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547119/ayexz43om03xvffqkl6s.jpg', 57, 28, '2023-12-14 09:46:40', '2023-12-14 09:46:40'),
(248, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547126/cikxpztynoxm6bvgmck7.jpg', 57, 27, '2023-12-14 09:46:40', '2023-12-14 09:46:40'),
(249, 80000, '/images/images/9261177.png', 57, 25, '2023-12-14 09:46:40', '2023-12-14 09:46:40'),
(250, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547638/x1cdjuzzvv3in2bfwbia.jpg', 58, 8, '2023-12-14 09:57:54', '2023-12-14 09:57:54'),
(251, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547652/tteullv8ht1kjrbcmn9u.jpg', 58, 28, '2023-12-14 09:57:54', '2023-12-14 09:57:54'),
(252, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547670/lkqvfsy7f5tt1yevbydt.jpg', 58, 22, '2023-12-14 09:57:54', '2023-12-14 09:57:54'),
(253, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547685/ebggrwrdf2owwokbz4nt.jpg', 58, 31, '2023-12-14 09:57:54', '2023-12-14 09:57:54'),
(254, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547700/fmrl77oivuvz8ho26ach.jpg', 58, 27, '2023-12-14 09:57:54', '2023-12-14 09:57:54'),
(255, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547719/imr6q84mk5iztubvq24b.jpg', 58, 56, '2023-12-14 09:57:54', '2023-12-14 09:57:54'),
(256, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547727/llknae0uuf30khdz4gt8.jpg', 58, 32, '2023-12-14 09:57:54', '2023-12-14 09:57:54'),
(257, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547747/cpcihj0zrx84geoljdki.jpg', 58, 23, '2023-12-14 09:57:54', '2023-12-14 09:57:54'),
(258, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547964/vcnt1hgiklwyfmagssfi.jpg', 59, 41, '2023-12-14 10:02:48', '2023-12-14 10:02:48'),
(259, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547981/tmpd2xisnzgv95dxxbfd.jpg', 59, 8, '2023-12-14 10:02:48', '2023-12-14 10:02:48'),
(260, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702547993/ynoynt0ircxjngbpacug.jpg', 59, 9, '2023-12-14 10:02:48', '2023-12-14 10:02:48'),
(261, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548011/zgiznv6t1q6ujwad9fjk.jpg', 59, 31, '2023-12-14 10:02:48', '2023-12-14 10:02:48'),
(262, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548022/k53gnw29p27f88ise6sp.jpg', 59, 28, '2023-12-14 10:02:48', '2023-12-14 10:02:48'),
(263, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548034/a8rucf9eqq48omegaq3j.jpg', 59, 32, '2023-12-14 10:02:48', '2023-12-14 10:02:48'),
(264, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548076/tdysenhg51didqbck1hs.jpg', 59, 22, '2023-12-14 10:02:48', '2023-12-14 10:02:48'),
(265, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548393/mhnhdlb4dj7xxwgkztea.jpg', 60, 28, '2023-12-14 10:13:01', '2023-12-14 10:13:01'),
(266, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548407/ulxgouhkcvdbwb5iy1jf.jpg', 60, 9, '2023-12-14 10:13:01', '2023-12-14 10:13:01'),
(267, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548424/opleoeixzgawwntcufcb.jpg', 60, 56, '2023-12-14 10:13:01', '2023-12-14 10:13:01'),
(268, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548516/dte5jx4vhljkkcxxp69f.jpg', 60, 8, '2023-12-14 10:13:01', '2023-12-14 10:13:01'),
(269, 80000, 'blob:https://juvamedia.vn/dbfc4a1e-52ea-46d7-884d-743047054f3d', 60, 55, '2023-12-14 10:13:01', '2023-12-14 10:13:01'),
(270, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548653/ty50bn3oewlpeay015lf.jpg', 60, 53, '2023-12-14 10:13:01', '2023-12-14 10:13:01'),
(271, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702548639/obkvfy7srw99edivpcz5.jpg', 60, 57, '2023-12-14 10:13:01', '2023-12-14 10:13:01'),
(272, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740351/vbuprl6nywo9zfziobo8.jpg', 61, 58, '2023-12-16 15:28:14', '2023-12-16 15:28:14'),
(273, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740356/z23bcdgj2b6y8atsm2yi.jpg', 61, 59, '2023-12-16 15:28:14', '2023-12-16 15:28:14'),
(274, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740358/hcddbkewzw1fkj1wwakw.jpg', 61, 60, '2023-12-16 15:28:14', '2023-12-16 15:28:14'),
(275, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740363/h6cr6idrzeunf17ydldy.jpg', 61, 61, '2023-12-16 15:28:14', '2023-12-16 15:28:14'),
(276, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740364/yqreqesib4rg5vkxp3hv.jpg', 61, 62, '2023-12-16 15:28:14', '2023-12-16 15:28:14'),
(287, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740651/aarcgn9zuurgxthexrxo.jpg', 62, 8, '2023-12-16 15:34:18', '2023-12-16 15:34:18'),
(288, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740656/kqtfcskj70uijgonvvzj.jpg', 62, 9, '2023-12-16 15:34:18', '2023-12-16 15:34:18'),
(289, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740661/bw9keyjutxhjj5liacin.jpg', 62, 10, '2023-12-16 15:34:18', '2023-12-16 15:34:18'),
(290, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740666/d3g7ly8cnniqinjpqcji.jpg', 62, 15, '2023-12-16 15:34:18', '2023-12-16 15:34:18'),
(291, 45000, '/images/images/9261177.png', 62, 16, '2023-12-16 15:34:18', '2023-12-16 15:34:18'),
(292, 45000, '/images/images/9261177.png', 62, 11, '2023-12-16 15:34:18', '2023-12-16 15:34:18'),
(293, 45000, '/images/images/9261177.png', 62, 12, '2023-12-16 15:34:18', '2023-12-16 15:34:18'),
(294, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702740835/spaiuokeja6zbjluntrt.jpg', 62, 23, '2023-12-16 15:34:18', '2023-12-16 15:34:18'),
(295, 45000, '/images/images/9261177.png', 62, 28, '2023-12-16 15:34:18', '2023-12-16 15:34:18'),
(296, 45000, '/images/images/9261177.png', 62, 22, '2023-12-16 15:34:18', '2023-12-16 15:34:18'),
(297, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741036/cnztuqm6l3zcmbd1dblf.jpg', 63, 58, '2023-12-16 15:39:06', '2023-12-16 15:39:06'),
(298, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741042/mpmusf99zquguecyepbg.jpg', 63, 59, '2023-12-16 15:39:06', '2023-12-16 15:39:06'),
(299, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741044/isy1gygkm2rldnjntxuf.jpg', 63, 60, '2023-12-16 15:39:06', '2023-12-16 15:39:06'),
(300, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741047/v0aowy3dapz8tm0aqwnz.jpg', 63, 61, '2023-12-16 15:39:06', '2023-12-16 15:39:06'),
(301, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741050/opkzeum2wmbur4lswnw4.jpg', 63, 62, '2023-12-16 15:39:06', '2023-12-16 15:39:06'),
(302, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741053/rovb47z9ygegvb8ln16b.jpg', 63, 63, '2023-12-16 15:39:06', '2023-12-16 15:39:06'),
(303, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741056/sw1h3wll2303ove8vvlw.jpg', 63, 64, '2023-12-16 15:39:06', '2023-12-16 15:39:06'),
(304, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741059/keabrolbputx5fbkqaf2.jpg', 63, 65, '2023-12-16 15:39:06', '2023-12-16 15:39:06'),
(305, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741062/dwchtnpcskwtksbrzdlw.jpg', 63, 66, '2023-12-16 15:39:06', '2023-12-16 15:39:06'),
(306, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741322/brnhgzja6diak5a6dvig.jpg', 64, 8, '2023-12-16 15:49:03', '2023-12-16 15:49:03'),
(307, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741329/ozcagjaqrnjnrn2aqrek.jpg', 64, 9, '2023-12-16 15:49:03', '2023-12-16 15:49:03'),
(308, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741356/oremycip4en23sodskip.jpg', 64, 11, '2023-12-16 15:49:03', '2023-12-16 15:49:03'),
(309, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702741370/qidldf7suqnks7dfnh8d.jpg', 64, 16, '2023-12-16 15:49:03', '2023-12-16 15:49:03'),
(310, 60000, '/images/images/9261177.png', 64, 20, '2023-12-16 15:49:03', '2023-12-16 15:49:03'),
(311, 60000, '/images/images/9261177.png', 64, 28, '2023-12-16 15:49:03', '2023-12-16 15:49:03'),
(312, 60000, '/images/images/9261177.png', 64, 22, '2023-12-16 15:49:03', '2023-12-16 15:49:03'),
(313, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882560/bdfb0fczajs6f7cbcb2d.jpg', 65, 8, '2023-12-18 06:57:19', '2023-12-18 06:57:19'),
(314, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882564/zzoporo6idjfwso1diqs.jpg', 65, 9, '2023-12-18 06:57:19', '2023-12-18 06:57:19'),
(315, 45000, '/images/images/9261177.png', 65, 10, '2023-12-18 06:57:19', '2023-12-18 06:57:19'),
(316, 45000, '/images/images/9261177.png', 65, 11, '2023-12-18 06:57:19', '2023-12-18 06:57:19'),
(317, 45000, '/images/images/9261177.png', 65, 12, '2023-12-18 06:57:19', '2023-12-18 06:57:19'),
(318, 45000, '/images/images/9261177.png', 65, 16, '2023-12-18 06:57:19', '2023-12-18 06:57:19'),
(319, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882589/u1hmtnttlwl214lcdrvf.jpg', 65, 23, '2023-12-18 06:57:19', '2023-12-18 06:57:19'),
(320, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882956/qckmjlm7makp5kdwpo3a.jpg', 66, 8, '2023-12-18 07:04:23', '2023-12-18 07:04:23'),
(321, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882948/wcmrjsljx3q3b199z2mo.jpg', 66, 9, '2023-12-18 07:04:23', '2023-12-18 07:04:23'),
(322, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882983/exvwrbvxblmjhnhvgyvu.jpg', 66, 23, '2023-12-18 07:04:23', '2023-12-18 07:04:23'),
(323, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882985/imdjudyvaq0gvevgkwdv.jpg', 66, 24, '2023-12-18 07:04:23', '2023-12-18 07:04:23'),
(324, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702882997/i5t4uxsrlxrbyubkv9w6.jpg', 66, 13, '2023-12-18 07:04:23', '2023-12-18 07:04:23'),
(325, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883193/qrujnavaldnk46hdf2tv.jpg', 67, 8, '2023-12-18 07:08:05', '2023-12-18 07:08:05'),
(326, 60000, '/images/images/9261177.png', 67, 9, '2023-12-18 07:08:05', '2023-12-18 07:08:05'),
(327, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883199/bw32f40rcrr036r8z7bl.jpg', 67, 23, '2023-12-18 07:08:05', '2023-12-18 07:08:05'),
(328, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883211/znrfxvvwjbgt000dpn8v.jpg', 67, 24, '2023-12-18 07:08:05', '2023-12-18 07:08:05'),
(329, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883211/eehc2aoj59vupgjozyfr.jpg', 67, 22, '2023-12-18 07:08:05', '2023-12-18 07:08:05'),
(330, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883241/c2b4p8otrj7edrjgsnzo.jpg', 67, 15, '2023-12-18 07:08:05', '2023-12-18 07:08:05'),
(331, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883626/tm3fl3ohhwgvonufsags.jpg', 68, 8, '2023-12-18 07:16:38', '2023-12-18 07:16:38'),
(332, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883619/qd5mz29piu6wkxgika3t.jpg', 68, 9, '2023-12-18 07:16:38', '2023-12-18 07:16:38'),
(333, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883630/vbe4moqrb0qvlkunomfc.jpg', 68, 10, '2023-12-18 07:16:38', '2023-12-18 07:16:38'),
(334, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883628/rtvxn6hpywvsx1iktqgy.jpg', 68, 52, '2023-12-18 07:16:38', '2023-12-18 07:16:38'),
(335, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883629/srpgzehkalgfnqcokrp5.jpg', 68, 23, '2023-12-18 07:16:38', '2023-12-18 07:16:38'),
(336, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884060/wylh9orzrxpvzvngww3l.jpg', 69, 8, '2023-12-18 07:28:04', '2023-12-18 07:28:04'),
(337, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884085/wxieuqdm2thmkerihj2a.jpg', 69, 23, '2023-12-18 07:28:04', '2023-12-18 07:28:04'),
(338, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884089/j9fupw2ptpl9d4vaic17.jpg', 69, 24, '2023-12-18 07:28:04', '2023-12-18 07:28:04'),
(339, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884095/wcj92sl4x10hrzrpr5wg.jpg', 69, 34, '2023-12-18 07:28:04', '2023-12-18 07:28:04'),
(340, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884626/vpzr2qgktltv8afawjyh.jpg', 70, 8, '2023-12-18 07:31:47', '2023-12-18 07:31:47'),
(341, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884630/ujjsdc5kf3agkz6aczue.jpg', 70, 9, '2023-12-18 07:31:47', '2023-12-18 07:31:47'),
(342, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884677/hwodukg4myhna6e71juf.jpg', 70, 23, '2023-12-18 07:31:47', '2023-12-18 07:31:47'),
(343, 0, '/images/images/9261177.png', 70, 10, '2023-12-18 07:31:47', '2023-12-18 07:31:47'),
(344, 0, '/images/images/9261177.png', 70, 13, '2023-12-18 07:31:47', '2023-12-18 07:31:47'),
(345, 0, '/images/images/9261177.png', 70, 12, '2023-12-18 07:31:47', '2023-12-18 07:31:47'),
(346, 0, '/images/images/9261177.png', 70, 22, '2023-12-18 07:31:47', '2023-12-18 07:31:47'),
(347, 0, '/images/images/9261177.png', 70, 25, '2023-12-18 07:31:47', '2023-12-18 07:31:47'),
(348, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884850/vobldd3x35i6hbmc3his.jpg', 71, 8, '2023-12-18 07:36:10', '2023-12-18 07:36:10'),
(349, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884868/reyzqjogewkonrvdhphk.jpg', 71, 23, '2023-12-18 07:36:10', '2023-12-18 07:36:10'),
(350, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884873/fihjhlp2w9rtplsv72ep.jpg', 71, 24, '2023-12-18 07:36:10', '2023-12-18 07:36:10'),
(351, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702884872/j7j7d99qiffn671grtug.jpg', 71, 34, '2023-12-18 07:36:10', '2023-12-18 07:36:10'),
(352, 60000, '/images/images/9261177.png', 71, 9, '2023-12-18 07:36:10', '2023-12-18 07:36:10'),
(353, 60000, '/images/images/9261177.png', 71, 11, '2023-12-18 07:36:10', '2023-12-18 07:36:10'),
(354, 60000, '/images/images/9261177.png', 71, 16, '2023-12-18 07:36:10', '2023-12-18 07:36:10'),
(355, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885297/uhdxj39nuxidwgmn8crh.jpg', 72, 8, '2023-12-18 07:42:56', '2023-12-18 07:42:56'),
(356, 0, '/images/images/9261177.png', 72, 9, '2023-12-18 07:42:56', '2023-12-18 07:42:56'),
(357, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885305/uxd1zrtn09f2gqyxonmm.jpg', 72, 23, '2023-12-18 07:42:56', '2023-12-18 07:42:56'),
(358, 0, '/images/images/9261177.png', 72, 28, '2023-12-18 07:42:56', '2023-12-18 07:42:56'),
(359, 0, '/images/images/9261177.png', 72, 10, '2023-12-18 07:42:56', '2023-12-18 07:42:56'),
(360, 0, '/images/images/9261177.png', 72, 22, '2023-12-18 07:42:56', '2023-12-18 07:42:56'),
(361, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885423/z2hqvlblt4nyr1ys8rk3.jpg', 73, 8, '2023-12-18 07:44:03', '2023-12-18 07:44:03'),
(362, 0, '/images/images/9261177.png', 73, 9, '2023-12-18 07:44:03', '2023-12-18 07:44:03'),
(363, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885548/m03lvz8alooq3gtsad80.jpg', 74, 46, '2023-12-18 07:48:51', '2023-12-18 07:48:51'),
(364, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885557/ehbpd6wiuuloa0zzp4b0.jpg', 74, 47, '2023-12-18 07:48:51', '2023-12-18 07:48:51'),
(365, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885565/uxlah1kp3vqadfytgn7c.jpg', 74, 48, '2023-12-18 07:48:51', '2023-12-18 07:48:51'),
(366, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885572/cu6y28gxuaemiju0s0pp.jpg', 74, 43, '2023-12-18 07:48:51', '2023-12-18 07:48:51'),
(367, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885579/gvcu1vcqfkj0kgkh2iyk.jpg', 74, 42, '2023-12-18 07:48:51', '2023-12-18 07:48:51'),
(368, 80000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702885590/i0ebsg48brvxyprh0xon.jpg', 74, 41, '2023-12-18 07:48:51', '2023-12-18 07:48:51'),
(369, 45000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702886109/pzppcs3jecsasc4ybr3q.jpg', 75, 8, '2023-12-18 07:55:58', '2023-12-18 07:55:58'),
(370, 45000, '/images/images/9261177.png', 75, 9, '2023-12-18 07:55:58', '2023-12-18 07:55:58'),
(371, 45000, '/images/images/9261177.png', 75, 22, '2023-12-18 07:55:58', '2023-12-18 07:55:58'),
(372, 45000, '/images/images/9261177.png', 75, 11, '2023-12-18 07:55:58', '2023-12-18 07:55:58'),
(373, 60000, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702886228/wvffnjudbjsnmv4lf81b.jpg', 76, 8, '2023-12-18 07:57:31', '2023-12-18 07:57:31'),
(374, 60000, '/images/images/9261177.png', 76, 26, '2023-12-18 07:57:31', '2023-12-18 07:57:31'),
(375, 60000, '/images/images/9261177.png', 76, 22, '2023-12-18 07:57:31', '2023-12-18 07:57:31'),
(376, 60000, '/images/images/9261177.png', 76, 20, '2023-12-18 07:57:31', '2023-12-18 07:57:31'),
(377, 0, 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1703661890/pectcmx60ynb5joximyo.jpg', 77, 6, '2023-12-27 07:25:06', '2023-12-27 07:25:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(12, 'Chụp Ảnh Nền Trắng', 1, '2023-12-07 02:32:11', '2023-12-07 02:32:28'),
(14, 'Chụp Ảnh Treo Sào', 1, '2023-12-12 18:45:16', '2023-12-12 18:47:06'),
(15, 'Chụp Ảnh Phụ Kiện', 1, '2023-12-12 18:45:40', '2023-12-13 23:35:06'),
(16, 'Chụp Ảnh 3D', 1, '2023-12-12 18:46:13', '2023-12-12 18:47:32'),
(17, 'Quay Video Sản Phẩm', 1, '2023-12-12 18:46:50', '2023-12-12 18:47:45'),
(18, 'Chụp Ảnh Concept', 1, '2023-12-14 00:49:50', '2023-12-14 00:49:52'),
(19, 'Blog', 0, '2023-12-27 00:20:28', '2024-01-29 01:21:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `description`, `image`, `slug`, `service_id`, `created_at`, `updated_at`) VALUES
(27, 'Áo thun', 'Ảnh Flatlay thích hợp với áo nam, oversize, unisex', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702434737/pjxk2k20qtk5yq0virqw.jpg', 'ao-thun', 12, '2023-12-12 19:32:18', '2023-12-12 19:32:18'),
(28, 'Áo Sơ Mi', 'Sơ mi tay dài, tay ngắn, có nón', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435317/osr4tkmpg0o8ouhz96sp.jpg', 'ao-so-mi', 12, '2023-12-12 19:41:58', '2023-12-12 19:41:58'),
(29, 'Quần đùi', 'Quần thể thao, quần ngắn', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435454/hqec0fxf4zckiqnddpnh.jpg', 'quan-dui', 12, '2023-12-12 19:44:14', '2023-12-12 19:44:14'),
(30, 'Áo 3 lổ', 'Áo thể thao, áo tập gym', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435534/xbo7ovrjpzt8de5zc3dc.jpg', 'ao-3-lo', 12, '2023-12-12 19:45:35', '2023-12-12 19:45:35'),
(31, 'Áo khoác', 'Áo khoác dù, jean, bomber, hoodie', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435624/rytmr81yxdlztok6x9eh.jpg', 'ao-khoac', 12, '2023-12-12 19:47:05', '2023-12-12 19:47:05'),
(32, 'Quần dài', 'Quần jean, quần tây, jogger, kaki', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702435686/cc3kdw0homcplayhczmx.jpg', 'quan-dai', 12, '2023-12-12 19:48:07', '2023-12-12 19:48:07'),
(33, 'Ví da', 'Ví dài, ví ngắn', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702535844/oxkesp78vnf5umqtltlq.jpg', 'vi-da', 15, '2023-12-13 23:37:25', '2023-12-13 23:37:25'),
(34, 'Bao da Ipad', 'Bao da Ipad, Iphone', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702536193/eyhskfbsovnk1mwnplyn.jpg', 'bao-da-ipad', 15, '2023-12-13 23:43:13', '2023-12-13 23:43:13'),
(35, 'Concept tùy chỉnh', 'Hàng handmade, thực phẩm chức năng,...', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702540265/tczphrfuxm828u6boqew.jpg', 'concept-tuy-chinh', 18, '2023-12-14 00:51:07', '2023-12-14 00:51:07'),
(36, 'Chụp Ảnh Concept Sofa', 'Chụp trên ghế Sofa', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1702883970/rehyiqd0uob4d4nz8dwv.jpg', 'chup-anh-concept-sofa', 14, '2023-12-18 00:19:32', '2023-12-18 00:19:32'),
(37, 'Chụp ảnh sản phẩm', 'Chia sẽ kinh nghiệm chụp ảnh', 'https://res.cloudinary.com/drgvvh4sv/image/upload/v1703661772/spslftaj58fsphwrcrov.jpg', 'chup-anh-san-pham', 19, '2023-12-27 00:22:52', '2023-12-27 00:22:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `topics`
--

CREATE TABLE `topics` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `slug` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `topics`
--

INSERT INTO `topics` (`id`, `name`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Xu hướng thị trường', 0, 'xu-huong-thi-truong', '2024-01-29 01:30:45', '2024-01-29 01:30:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int NOT NULL DEFAULT '1',
  `last_password_change` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `last_password_change`, `created_at`, `updated_at`) VALUES
(11, 'Juva Media', '0703555544', 'mediajuva@gmail.com', NULL, '$2y$10$BHkwgOCZWDogbf741z5NQe7sp3zYrL4nFWPiVppKtq32z45Fh4xNO', NULL, 0, '2024-02-02 07:46:49', '2024-01-29 01:39:24', '2024-01-29 01:39:24');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Chỉ mục cho bảng `cart_product_photography`
--
ALTER TABLE `cart_product_photography`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_product_photography_ibfk_1` (`cart_product_id`),
  ADD KEY `cart_product_photography_ibfk_2` (`product_photography_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `cart_id` (`order_id`);

--
-- Chỉ mục cho bảng `order_product_photography`
--
ALTER TABLE `order_product_photography`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_photography_id` (`product_photography_id`),
  ADD KEY `cart_product_photography_ibfk_1` (`order_product_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `photography`
--
ALTER TABLE `photography`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_category_id` (`service_category_id`),
  ADD KEY `products_ibfk_1` (`product_category_id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_photography`
--
ALTER TABLE `product_photography`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photography_id` (`photography_id`),
  ADD KEY `product_photography_ibfk_2` (`product_id`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Chỉ mục cho bảng `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `cart_product_photography`
--
ALTER TABLE `cart_product_photography`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `order_product_photography`
--
ALTER TABLE `order_product_photography`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `photography`
--
ALTER TABLE `photography`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `product_photography`
--
ALTER TABLE `product_photography`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `topics`
--
ALTER TABLE `topics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `blogs_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_products_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `cart_product_photography`
--
ALTER TABLE `cart_product_photography`
  ADD CONSTRAINT `cart_product_photography_ibfk_1` FOREIGN KEY (`cart_product_id`) REFERENCES `cart_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_product_photography_ibfk_2` FOREIGN KEY (`product_photography_id`) REFERENCES `product_photography` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `order_product_photography`
--
ALTER TABLE `order_product_photography`
  ADD CONSTRAINT `order_product_photography_ibfk_1` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_product_photography_ibfk_2` FOREIGN KEY (`product_photography_id`) REFERENCES `product_photography` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product_photography`
--
ALTER TABLE `product_photography`
  ADD CONSTRAINT `product_photography_ibfk_1` FOREIGN KEY (`photography_id`) REFERENCES `photography` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_photography_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `service_categories`
--
ALTER TABLE `service_categories`
  ADD CONSTRAINT `service_categories_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
