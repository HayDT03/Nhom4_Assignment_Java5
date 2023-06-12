<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row col-md-12 justify-content-center my-4">
	<h2>Thống kê doanh thu sản phẩm</h2>
</div>
<div class="container">
	<table class="table table-hover mt-2 mb-5" border="1">
		<thead class="thead-dark text-center">
			<tr>
				<th>Tên sách</th>
				<th>Tổng Tiền</th>
			</tr>
		</thead>
		<c:forEach var='tk' items="${doanhThu}">
			<tr>
				<td>${tk[0]}</td>
				<td style="text-align: end;">
				<fmt:formatNumber value="${tk[1]}"></fmt:formatNumber>
				 VNĐ</td>
			</tr>
		</c:forEach>
	</table>
</div>