<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<link rel="stylesheet" href="/css/styleadmin.css">
<link rel="stylesheet" href="/css/bootstrapadmin.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand logo-image" href="/admin"><img
				src="/image/logo.svg" alt="alternative"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="/admin">Trang
							chủ <span class="sr-only">(current)</span>
					</a></li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Danh mục quản lý </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/admin/quanly/sanpham">Quản
								lý sản phẩm</a> <a class="dropdown-item" href="#"></a> <a
								class="dropdown-item" href="/admin/quanly/nguoidung">Quản
								lý người dùng</a> <a class="dropdown-item" href="#"></a> <a
								class="dropdown-item" href="/admin/quanly/thanhtoan">Quản
								lý thanh toán</a> <a class="dropdown-item" href="#"></a> <a
								class="dropdown-item" href="/admin/quanly/hoadon">Quản lý
								hóa đơn</a> <a class="dropdown-item" href="#"></a> <a
								class="dropdown-item" href="/admin/quanly/giohang">Quản lý
								giỏ hàng</a>
						</div></li> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Tổng hợp thống kê </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/admin/thongke/sanpham">Thống
								kê sản phẩm</a> <a class="dropdown-item" href="#"></a> <a
								class="dropdown-item" href="/admin/thongke/doanhthu">Thống
								kê doanh thu</a>
						</div></li>
				</ul>
				<div class="my-2 my-lg-0">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item dropdown active"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Admin </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Thông tin tài khoản</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Đăng xuất</a>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<header> </header>

	<article class="container">
		<div class="row my-4 col-md-12 justify-content-center">
			<form class="form-inline">
				<div class="form-group col-md-3">
					<label class="text-right"><strong>Tìm kiếm:</strong></label>
				</div>
				<div class="form-group col-md-7">
					<input type="text" class="form-control"
						placeholder="Nhập tên sách để tìm">
				</div>
				<div class="form-group col-2 ">
					<button type="submit" class="btn btn-success">Tìm</button>
				</div>
			</form>
		</div>

		<div class="row">
			<h2>Danh sách sản phẩm hiện có trên shop</h2>
		</div>

		<div class="row">
			<table class="table table-hover mt-2 mb-5">
				<thead class="thead-dark">
					<tr>
						<th>STT</th>
						<th>Tên sách</th>
						<th>Giá</th>
						<th>Ngày nhập</th>
						<th>Quản lý</th>
					</tr>
				</thead>
				<tbody class="bg-light">
					<tr>
						<td>1</td>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
						<td><a href="/Quanlysanpham.html">Chi tiết</a></td>
					</tr>
					<tr>
						<td>2</td>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
						<td><a href="/Quanlysanpham.html">Chi tiết</a></td>
					</tr>
					<tr>
						<td>3</td>
						<td>Larry</td>
						<td>the Bird</td>
						<td>@twitter</td>
						<td><a href="/Quanlysanpham.html">Chi tiết</a></td>
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


	<script src="/js/jqueryadmin.min.js"></script>
	<script src="/js/bootstrapadmin.min.js"></script>
</body>

</html>