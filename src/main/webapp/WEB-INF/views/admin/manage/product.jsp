<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row col-md-12 justify-content-center my-4">
	<h2>Quản lý sản phẩm</h2>
</div>
<div class="row justify-content-center">
	<form class="form col-md-7 p-5" style="border: 1px solid black;">
		<form:form action="product/save" modelAttribute="product">
			<div class="form-group">
				<label>Mã Sách</label>
				<form:input type="text" class="form-control" id="id" path="id" />
			</div>
			<div class="form-group">
				<label>Tên sách</label>
				<form:input type="text" class="form-control" id="name" path="name" />
			</div>
			<div class="form-group">
				<label>Tác giả</label>
				<form:input type="text" class="form-control" id="author"
					path="author" />
			</div>
			<div class="form-group">
				<label>Giá</label>
				<form:input type="number" class="form-control" min="0" id="price"
					path="price" />
			</div>

			<div class="form-group">
				<label path="quantity">Số lượng</label>
				<form:input type="number" class="form-control" min="0" id="quantity"
					path="quantity" />
			</div>

			<div class="form-group">
				<label>Mô tả</label>
				<form:textarea cols="30" rows="5" class="form-control"
					id="description" path="description" />
			</div>
			<div class="col-md-4">
				<img src="/image/${product.image}" width="100%" />
				<div class="form-group">
					<form:input path="image" name="image" />
				</div>
			</div>
			<div class="row col-md-12 ">
				<button formaction="/admin/manage/product/save"
					class="btn btn-success" style="border-radius: 20px;">Thêm
					sách</button>
				<button formaction="/admin/manage/product/edit/${product.id}"
					class="btn btn-warning mx-3" style="border-radius: 20px;">Cập
					nhật</button>
				<button formaction="/admin/manage/product/reset" type="submit"
					class="btn btn-primary" style="border-radius: 20px;">Làm
					mới</button>
			</div>
		</form:form>
	</form>
</div>
<div class="row my-4 col-md-12 justify-content-center">
	<form action="/admin/manage/product/search" method="POST" class="form-inline">
		<div class="form-group col-md-3">
			<label class="text-right"><strong>Tìm kiếm:</strong></label>
		</div>
		<div class="form-group col-md-7">
			<input class="form-control" name="keyword" value="${param.keyword}"
				type="text" placeholder="Nhập tên sách để tìm"/>
		</div>
		<div class="form-group col-2 ">
			<button type="submit" class="btn btn-success">Tìm</button>
		</div>
	</form>
</div>
<div class="container">
	<table class="table table-hover mt-2 mb-5">
		<thead class="thead-dark text-center">
			<tr>
				<th class="col-md-1">STT</th>
				<th class="col-md-2">Tên sách</th>
				<th class="col-md-1">Giá</th>
				<th class="col-md-1">Số lượng</th>
				<th class="col-md-2">Hình</th>
				<th class="col-md-1">Like</th>
				<th class="col-md-2">Tác giả</th>
				<th class="col-md-1"></th>
				<th class="col-md-1"></th>
			</tr>
		</thead>
		<tbody class="bg-light">
			<c:forEach items="${list.content}" var="list">
				<tr>
					<td>${list.id}</td>
					<td>${list.name}</td>
					<td>${list.price}</td>
					<td>${list.quantity}</td>
					<td><img src="/image/${list.image}" width="100%"></td>
					<td>${list.like}</td>
					<td>${list.author}</td>
					<td><a href="/admin/manage/product/getform/${list.id}">Chi
							tiết</a></td>
					<td><a href="/admin/manage/product/remove/${list.id}"
						onclick="myMessage()">Xóa</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="row col-md-12 justify-content-center mb-4">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${list.number == 0}">
				<li class="page-item"><a class="page-link" href=""
					style="pointer-events: none;">&lt;&lt;</a></li>
				<li class="page-item"><a class="page-link" href=""
					style="pointer-events: none;">&lt;</a></li>
			</c:if>
			<c:if test="${list.number > 0}">
				<li class="page-item"><a class="page-link"
					href="/admin/manage/product?p=0">&lt;&lt;</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/manage/product?p=${list.number-1}">&lt;</a></li>
			</c:if>
			<c:forEach varStatus="i" begin="0" end="${list.totalPages-1}">
				<li class="page-item"><a a class="page-link"
					href="/admin/manage/product?p=${i.index}">${i.index + 1}</a></li>
			</c:forEach>

			<c:if test="${list.number < list.totalPages - 1}">
				<li class="page-item"><a class="page-link"
					href="/admin/manage/product?p=${list.number+1}">&gt;</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/manage/product?p=${list.totalPages-1}">&gt;&gt;</a></li>
			</c:if>
			<c:if test="${list.number == list.totalPages - 1}">
				<li class="page-item"><a class="page-link"
					href="/admin/manage/product?p=${list.number+1}"
					style="pointer-events: none;">&gt;</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/manage/product?p=${list.totalPages-1}"
					style="pointer-events: none;">&gt;&gt;</a></li>
			</c:if>
		</ul>
	</nav>
</div>
