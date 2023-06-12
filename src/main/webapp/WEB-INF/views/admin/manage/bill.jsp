<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<article class="container">
	<div class="row col-md-12 justify-content-center my-4">
		<h2>Quản lý hóa đơn</h2>
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
		<table class="table table-hover mt-2 mb-5" >
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
				<c:forEach var="item" items="${pages.content}">
					<tr>
						<td>${item.id}</td>
						<td>${item.user.id}</td>
						<td>${item.total}</td>
						<td>${item.date}</td>
						<td>
						<c:choose>
						<c:when test="${item.status=0 }">Đã xóa</c:when>
						<c:when test="${item.status=1 }">Chờ xác nhận</c:when>
						<c:when test="${item.status=2 }"></c:when>
						<c:otherwise></c:otherwise>
						</c:choose>
						</td>
						<td><a href="/admin/manage/bill/detail?id=${item.id}">Chi tiet</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="row col-md-12 justify-content-center mb-4">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="?p=${pages.number-1}">&lt;&lt;</a></li>
				<c:forEach var="i" begin="1" end="${pages.totalPages}">
					<li class='page-item ${pages.number == i-1 ? "active":""}'><a
						class="page-link" href="?p=${i-1}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="?p=${pages.number+1}">&gt;&gt;</a></li>
			</ul>
		</nav>
	</div>
</article>