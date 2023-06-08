<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý người dùng</title>
  <link rel="stylesheet" href="/css/styleadmin.css">
    <link rel="stylesheet" href="/css/bootstrapadmin.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand logo-image" href="/admin"><img src="/image/logo.svg" alt="alternative"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/admin">Trang chủ <span class="sr-only">(current)</span></a>
                    </li>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Danh mục quản lý
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/admin/quanly/sanpham">Quản lý sản phẩm</a>
                            <a class="dropdown-item" href="#"></a>
                            <a class="dropdown-item" href="/admin/quanly/nguoidung">Quản lý người dùng</a>
                            <a class="dropdown-item" href="#"></a>
                            <a class="dropdown-item" href="/admin/quanly/thanhtoan">Quản lý thanh toán</a>
                            <a class="dropdown-item" href="#"></a>
                            <a class="dropdown-item" href="/admin/quanly/hoadon">Quản lý hóa đơn</a>
                            <a class="dropdown-item" href="#"></a>
                            <a class="dropdown-item" href="/admin/quanly/giohang">Quản lý giỏ hàng</a>
                        </div>
                    </li>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Tổng hợp thống kê
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/admin/thongke/sanpham">Thống kê sản phẩm</a>
                            <a class="dropdown-item" href="#"></a>
                            <a class="dropdown-item" href="/admin/thongke/doanhthu">Thống kê doanh thu</a>
                        </div>
                    </li>
                </ul>
                <div class="my-2 my-lg-0">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown active">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Admin
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Thông tin tài khoản</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Đăng xuất</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <header>
    </header>

    <article class="container">
        <div class="row col-md-12 justify-content-center my-4">
            <h2>Quản lý người dùng</h2>
        </div>
        <div class="row justify-content-center">
            <form class="form col-md-7 p-5" style="border: 1px solid black;">
                <div class="form-group">
                    <label>Họ tên người dùng:</label>
                    <input type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>Tài khoản</label>
                    <input type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>Ngày sinh</label>
                    <input type="date" class="form-control">
                </div>
                <div class="form-group">
                    <label>Giới tính:</label>
                    <div class="row">
                        <div class="form-check ml-4">
                            <input class="form-check-input" type="radio" value="option1" name="exampleRadios">
                            <label class="form-check-label">
                                Nam
                            </label>
                        </div>

                        <div class="form-check ml-3">
                            <input class="form-check-input" type="radio" value="option2" name="exampleRadios">
                            <label class="form-check-label">
                                Nữ
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Quyền:</label>
                    <div class="row">
                        <div class="form-check ml-4">
                            <input class="form-check-input" type="radio" value="option1" name="exampleRadios1">
                            <label class="form-check-label">
                                Quản trị
                            </label>
                        </div>

                        <div class="form-check ml-3">
                            <input class="form-check-input" type="radio" value="option2" name="exampleRadios1">
                            <label class="form-check-label">
                                Người dùng
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Trạng thái tài khoản:</label>
                    <div class="row">
                        <div class="form-check ml-4">
                            <input class="form-check-input" type="radio" value="option1" name="exampleRadios1">
                            <label class="form-check-label">
                                Đang hoạt động
                            </label>
                        </div>
                        <div class="form-check ml-3">
                            <input class="form-check-input" type="radio" value="option2" name="exampleRadios1">
                            <label class="form-check-label">
                                Bị khóa
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" class="form-control">
                </div>
                <div class="form-group">
                    <label>Số điện thoại</label>
                    <input type="text" class="form-control">
                </div>

                <div class="form-group">
                    <label>Địa chỉ</label>
                    <input type="text" class="form-control">
                </div>

                <div class="row col-md-12 ">
                    <button type="submit" class="btn btn-warning mx-3" style="border-radius: 20px;">Cập nhật</button>
                    <button type="submit" class="btn btn-primary" style="border-radius: 20px;">Làm mới</button>
                </div>
            </form>
        </div>
        <div class="row my-4 col-md-12 justify-content-center">
            <form class="form-inline">
                <div class="form-group col-md-3">
                    <label class="text-right"><strong>Tìm kiếm:</strong></label>
                </div>
                <div class="form-group col-md-7">
                    <input type="text" class="form-control" placeholder="Nhập tên người dùng để tìm">
                </div>
                <div class="form-group col-2 ">
                    <button type="submit" class="btn btn-success">Tìm</button>
                </div>
            </form>
        </div>
        <div class="row">
            <table class="table table-hover mt-2 mb-5">
                <thead class="thead-dark">
                    <tr>
                        <th>Họ tên</th>
                        <th>Tài khoản</th>
                        <th>Giới tính</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                        <th>Trạng thái</th>
                        <th>Quyền</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="bg-light">
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>10000</td>
                        <td>ádad</td>
                        <td></td>
                        <td><a href="/Quanlysanpham.html">Sửa|Xóa</a></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>10000</td>
                        <td>ádad</td>
                        <td></td>
                        <td><a href="/Quanlysanpham.html">Sửa|Xóa</a></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>10000</td>
                        <td>ádad</td>
                        <td></td>
                        <td><a href="/Quanlysanpham.html">Sửa|Xóa</a></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>10000</td>
                        <td>ádad</td>
                        <td></td>
                        <td><a href="/Quanlysanpham.html">Sửa|Xóa</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="row col-md-12 justify-content-center mb-4">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">&lt;&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>

                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;&gt;</a></li>
                </ul>
            </nav>
        </div>
    </article>

    <footer class="text-muted py-5" style="background-color: rgb(61, 59, 59); color: rgb(226, 226, 226);">
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

    <script src="/js/jqueryadmin.min.js"></script>
    <script src="/js/bootstrapadmin.min.js"></script>
</body>

</html>