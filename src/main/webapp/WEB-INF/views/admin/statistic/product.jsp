<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row col-md-12 justify-content-center my-4">
	<h2>Thống kê sản phẩm</h2>
</div>
<div class="container">
	<table class="table table-hover mt-2 mb-5">
		<thead class="thead-dark text-center">
			<tr>
				<th>ID Sản Phẩm</th>
				<th>Tên Sản Phẩm</th>
				<th>Lược mua</th>
			</tr>
		</thead>
		<c:forEach var='tk' items="${top10}">
			<tr>
				<td>${tk[0]}</td>
				<td>${tk[1]}</td>
				<td>${tk[2]}</td>
			</tr>
		</c:forEach>
	</table>
</div>
