<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
		<table class="table table-hover mt-2 mb-5" border="1">
			<thead class="thead-dark">
				<tr>
					<th class="col-md-1 text-center">STT</th>
					<th class="col-md-3 text-center">Tên sách</th>
					<th class="col-md-2 text-center">Tác giả</th>
					<th class="col-md-2 text-center">Giá</th>
					<th class="col-md-2">Hình</th>
					<th class="col-md 1"></th>
				</tr>
			</thead>
			<tbody class="bg-light">
			<c:set var="stt" value="1" />
				<c:forEach var="list" items="${list.content }">
				<tr>
					<td class="text-center">${stt }</td>
					<td>${list.name }</td>
					<td>${list.author }</td>
					<td style="text-align: end;">${list.price } VNĐ</td>
					<td><img src="/image/${list.image}" width="100%"></td>
					<td class="text-center"><a href="/admin/manage/product/getform/${list.id}" class="btn btn-info px-5">sửa</a></td>
				</tr>
					<c:set var="stt" value="${stt+1 }" />
				</c:forEach>
				
			</tbody>
		</table>
	</div>
	<div class="row col-md-12 justify-content-center mb-4">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="?p=${list.number-1}">&lt;&lt;</a></li>
				<c:forEach var="i" begin="1" end="${list.totalPages}">
					<li class='page-item ${list.number == i-1 ? "active":""}'><a
						class="page-link" href="?p=${i-1}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="?p=${list.number+1}">&gt;&gt;</a></li>
			</ul>
		</nav>
	</div>
</article>