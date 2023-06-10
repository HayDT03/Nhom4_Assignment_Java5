<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<article class="container">
	<div class="row col-md-12 justify-content-center my-4">
		<h2>Quản lý hóa đơn</h2>
	</div>
	<div class="row justify-content-center">
		<form class="form col-md-7 p-5" style="border: 1px solid black;"
			method="post">
			<div class="form-group">
				<label>Mã hóa đơn:</label> <input type="text" class="form-control">
			</div>
			<div class="form-group">
				<label>Tài khoản mua:</label> <input type="text"
					class="form-control">
			</div>
			<div class="form-group">
				<label>Tổng tiền:</label> <input type="text" class="form-control">
			</div>

			<div class="form-group">
				<label>Ngày lập:</label> <input type="date" class="form-control">
			</div>

			<div class="form-group">
				<label>Trạng thái:</label>
				<div class="row">
					<div class="form-check ml-4">
						<input class="form-check-input" type="radio" value="option1"
							name="exampleRadios"> <label class="form-check-label">
							Đã thanh toán </label>
					</div>

					<div class="form-check ml-3">
						<input class="form-check-input" type="radio" value="option2"
							name="exampleRadios"> <label class="form-check-label">
							Chưa thanh toán </label>
					</div>
				</div>
			</div>

			<div class="row col-md-12 ">
				<button formaction="/admin/manage/bill/edit/${product.id}" type="submit" class="btn btn-warning mx-3"
					style="border-radius: 20px;">Cập nhật</button>
				<button formaction="/admin/manage/bill/reset" type="submit" class="btn btn-primary"
					style="border-radius: 20px;">Làm mới</button>
			</div>
		</form>
	</div>
	<div class="row my-4 col-md-12 justify-content-center">
		<form class="form-inline">
			<div class="form-group col-md-3">
				<label class="text-right"><strong>Tìm kiếm:</strong></label>
			</div>
			<div class="form-group col-md-7">
				<input type="text" class="form-control"
					placeholder="Nhập người dùng để tìm">
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
					<th>Mã hóa đơn</th>
					<th>Người dùng</th>
					<th>Giá</th>
					<th>Ngày lập</th>
					<th>Trạng thái</th>
					<th></th>
				</tr>
			</thead>
			<tbody class="bg-light">
				<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.id}</td>
						<td>${item.user.id}</td>
						<td>${item.total}</td>
						<td>${item.date}</td>
						<td>${item.status }</td>
						<td>
							<a href="/admin/manage/bill/${item.id}">Sửa</a>|
							<a href="/admin/manage/bill/remove/${item.id}">Xóa</a>
						</td>
					</tr>
				</c:forEach>
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