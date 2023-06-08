<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div class="row col-md-12 justify-content-center my-4">
		<h2>Quản lý sản phẩm</h2>
	</div>
	<div class="row justify-content-center">
		<form class="form col-md-7 p-5" style="border: 1px solid black;">
		<div class="col-md-4">
		<img src='<c:url value="templates/image/sanpham/${img}"></c:url>'>
		<div class="form-group">
				<input type="file">
			</div>
		</div>
		<div class="col-md-8">
			<div class="form-group">
				<label>Mã Sách</label> 
				<input type="text" class="form-control" id="id">
			</div>
			<div class="form-group">
				<label>Tên sách</label> 
				<input type="text" class="form-control" id="name">
			</div>
			<div class="form-group">
				<label>Tác giả</label> 
				<input type="text" class="form-control" id="author">
			</div>
			<div class="form-group">
				<label>Giá</label> 
				<input type="number" class="form-control" min="0" id="price">
			</div>

			<div class="form-group">
				<label>Số lượng</label> 
				<input type="number" class="form-control" min="0" id="quantity">
			</div>

			<div class="form-group">
				<label>Mô tả</label>
				<textarea name="" id="" cols="30" rows="5" class="form-control" id="description"></textarea>
			</div>
			</div>
			

			<div class="row col-md-12 ">
				<button type="submit" class="btn btn-success"
					style="border-radius: 20px;">Thêm sách</button>
				<button type="submit" class="btn btn-warning mx-3"
					style="border-radius: 20px;">Cập nhật</button>
				<button type="submit" class="btn btn-primary"
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
					placeholder="Nhập tên sách để tìm">
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
					<th>STT</th>
					<th>Tên sách</th>
					<th>Giá</th>
					<th>Số lượng</th>
					<th>Mô tả</th>
					<th>hình</th>
					<th>Like</th>
					<th>Tác giả</th>
					<th></th>
				</tr>
			</thead>
			<tbody class="bg-light">
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.id}</td>
					<td>${list.name}</td>
					<td>${list.price}</td>
					<td>${list.quantity}</td>
					<td>${list.description}</td>
					<td>${list.image}</td>
					<td>${list.like}</td>
					<td>${list.author}</td>
					<td><a href="/Quanlysanpham.html">Sửa|Xóa</a></td>
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
