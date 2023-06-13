<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<main class="p-5">
	<h1 class="text-center">SẢN PHẨM NỔI BẬT</h1>
	<div class="container mt-5">
		<div class="row">
		<c:set var="i" value="1"></c:set>
		<c:forEach var="item" items="${listProduct}">
				
				<div class="col-md-3 mb-4 col-12" onclick="window.location.href='/detail?pid=${item.id}'">
					<div class="card">
						<img src="/image/${item.image}" class="card-img-top" alt="Book"
							height="300px">
						<div class="card-body">
							<h5 class="card-title" style="min-height: 2.5em;">${item.name}</h5>
							<p class="card-text">Tác giả: ${item.author}</p>
							<p class="card-text">Giá: <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="VND" maxFractionDigits="0"/></p>
							<form action="/cart/add">
								<button type="submit" formaction="/cart/add/${item.id}" class="btn btn-outline-primary col-12">
									<i class="bi bi-cart"></i> Thêm giỏ hàng
								</button>
							</form>
							
								
						</div>
					</div>
				</div>
				<!-- -------------- -->
				<c:set var="i" value="${i + 1}" />
		</c:forEach>
		</div>
	</div>
</main>