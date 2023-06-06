<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
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
            <h1 class="text-center">GIỎ HÀNG</h1>
            <hr>
            <!-- San pham MỚI -->
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered text-center"
                        style="vertical-align: middle;border-color: inherit;">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Ảnh sản phẩm</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Đơn giá</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Tổng giá</th>
                                <th scope="col">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td><img src="hinh.jpg" alt="" width="120px" height="120px"></td>
                                <td>TokuDA</td>
                                <td>1900000</td>
                                <td>1</td>
                                <td>1900000</td>
                                <td><a href="#" style="text-decoration: none; color: red;"><i
                                            class="bi bi-trash3-fill"></i> Xóa</a></td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td><img src="hinh.jpg" alt="" width="120px" height="120px"></td>
                                <td>TokuDA</td>
                                <td>1900000</td>
                                <td>1</td>
                                <td>1900000</td>
                                <td><a href="#" style="text-decoration: none; color: red;"><i
                                            class="bi bi-trash3-fill"></i> Xóa</a></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="col-12 row">
                        <div class="col-6">
                            <h5>Tổng tiền: </h5>
                        </div>
                        <div class="col-6">
                            <a href="#" class="btn btn-danger left-button">Thanh toán</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
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