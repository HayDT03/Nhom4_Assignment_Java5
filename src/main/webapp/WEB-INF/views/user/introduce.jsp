<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giới thiệu</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<style>
body {
    margin: 0px;
    padding: 0px;
    background-color: white;
}

.navbar {
    background: black !important;
    backdrop-filter: blur(10px) saturate(125%);
    -webkit-backdrop-filter: blur(10px) saturate(125%);
    color: white !important;
}

.mg p>a {
    text-decoration: none;
    color: rgb(226, 226, 226);
}

.mg a:hover {
    color: aqua
}

ul>a {
    text-decoration: none;
}

ul>a>li:hover {
    background-color: rgb(228, 248, 248);
}

.wrapper {
    text-align: center;
}

.a {
    position: absolute;
    top: 50%;
}

.menu a{
    color: white;
    margin-left: 20px;
}

.menu ul>li>a{
    color: white;
}
.menu .dropdown li a{
    color: black;
    margin-left: 0px;
}
.left-button {
    float: right;
  }
</style>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
        <div class="container-fluid menu">
            <a class="navbar-brand" href="#">Trang chủ</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Giới thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sách</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Liên hệ</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Yêu thích</a>
                  </li>
                  <li class="nav-item navbar-righ">
                    <a class="nav-link" href="#"><i class="bi bi-cart"></i> Giỏ hàng</a>
                  </li>
                   <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Tài khoản
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Đăng nhập</a></li>
                            <li><a class="dropdown-item" href="#">Đăng ký</a></li>
                            <li><a class="dropdown-item" href="#">Quên mật khẩu</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex " role="search" style="margin-left: 300px;">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

    <img src="book.webp" alt="" width="100%" height="300px">

    <main>
        <div class="container mt-4">
            <h1 class="text-center">GIỚI THIỆU</h1>
            <div class="col-11 container">
                <hr>
                <p>
                    Sở hữu một website bán sách trực tuyến là hướng đi đúng đắn vì nó tạo ra được tính ưu việt, vượt
                    trội
                    hơn so cách mua, bán hàng trực tiếp tại các cửa hàng, nhà sách. Hơn nữa, cơ hội để những cuốn sách
                    của
                    bạn tiếp cận với khách hàng ngày một lớn.

                    Nhờ vào internet phát triển nên người tiêu dùng có thể dễ dàng mua sách online, chỉ cần ngồi ở nhà
                    sử
                    dụng máy tính kết nối internet là có thể mua sách yêu thích của mình. Vì vậy, việc tiếp cận khách
                    hàng
                    sẽ diễn ra dễ dàng thông qua website bán sách.
                </p>
                <p>
                    – Thiết kế trang web bán sách để phục vụ đa dạng nhu cầu mua sách của người tiêu dùng. Website bán
                    sách
                    trực tuyến giống như một cửa hàng bán sách mở cửa 24/24 để đón tiếp khách hàng. Các sản phẩm mới
                    phải
                    được cập nhật liên tục, khách hàng sẽ tìm được những cuốn sách mà họ thích.
                </p>
                <p>
                    – Qua công cụ thống kế đánh giá, bạn có thể biết được có bao nhiêu khách hàng đã ghé thăm và mua
                    sách
                    trên website của bạn. Những cuốn sách thuộc thể loại nào được ưa chuộng nhiều nhất.
                </p>
                <p>
                    – Chào bán sản phẩm chưa nhập hàng với hình thức order, bạn sẽ biết được lượng nhu cầu của khách
                    hàng để
                    có thể tính toán số lượng sách trước khi nhập hàng.
                </p>
                <p>
                    – Một tính năng quan trọng khác của việc thiết kế website bán sách trực tuyến đó chính là tính năng
                    hiển
                    thị giao diện di động. Trên thực tế thì số lượng người truy cập website mua hàng bằng điện thoại
                    thông
                    minh, máy tính bảng, chiếm tỉ lệ cao hơn rất nhiều so với người dùng laptop, máy tính bàn. Vì vậy
                    việc
                    thiết kế website bán sách có giao diện di động chính là cách làm tăng trải nghiệm người dùng. Góp
                    phần
                    nâng cao hiệu quả của website vào trong việc kinh doanh.
                </p>

                <p>
                    Mua sắm trực tuyến, bạn được:
                    <br>
                    >> Giảm giá hơn 95% sách Tiếng Việt lên đến 25%. Xem thêm Ưu đãi cho Khách hàng
                    <br>
                    >> Tích lũy BBxu để có thể mua hàng 0 đồng!
                    <br>
                    >> Tận hưởng các chương trình ưu đãi, khuyến mãi lớn hàng tháng
                    <br>
                    >> Giao hàng trong vòng 48h tại TP.HCM
                    <br>
                    >> Miễn phí vận chuyển. Tìm hiểu thêm Phương thức Vận chuyển
                    <br>
                    >> Đổi - trả hàng miễn phí trong vòng 7 ngày.
                    <br>
                    >> Thanh toán an toàn, tiện lợi: Trả tiền khi nhận hàng (COD), Chuyển khoản & Internet banking, Ví
                    điện tử, Chuyển tiền qua bưu điện.
                    <br>
                    >> Dịch vụ hậu mãi chu đáo, tận tình. Bạn cần tư vấn sản phẩm, hoặc gặp khó khăn khi đặt hàng? Gọi
                    ngay cho chúng tôi 0933 109 009 để được trợ giúp.
                </p>
            </div>


        </div>
    </main>
    <br>
    <br>
    <footer class="text-muted py-5" style="background-color: black; color: rgb(226, 226, 226);">
        <div class="container-fluid row" style="color: white;">
            <div class="col-12 col-lg-4" style="margin-left: 50px">
                <h3>Liên hệ</h3>
                <p><i class="bi bi-telephone"></i> Hotline : 0948342514</p>
                <p><i class="bi bi-shop"></i> Địa chỉ : Ninh Kiều - Cần Thơ</p>
                <p><i class="bi bi-clock-history"></i> Giờ làm việc : 7h - 22h, T2 - T7</p>
                <p><i class="bi bi-envelope"></i> Email : thinhcaibat06@gmail.com</p>
            </div>
            <div class="col-12 col-lg-3 mg" style="margin-left: 45px;">
                <h3>Mạng xã hội</h3>
                <p><i class="bi bi-facebook"></i> <a href="#">Facebook</a></p>
                <p><i class="bi bi-instagram"></i> <a href="#">Instagram</a></p>
                <p><i class="bi bi-github"></i> <a href="#"> Github</a></p>
                <p><i class="bi bi-youtube"></i> <a href="#">Youtube</a></p>
            </div>
            <div class="col-12 col-lg-4">
                <h3>Giới thiệu</h3>
                <iframe width="100%" height="170" src="https://www.youtube.com/embed/UJg1w9pbNvo"
                    title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen=""></iframe>
            </div>
        </div>
    </footer>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>