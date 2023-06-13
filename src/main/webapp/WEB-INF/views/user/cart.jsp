<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<main class="mt-5 p-5 min-vh-100">
	<div class="container mt-4">
		<h1 class="text-center">GIỎ HÀNG</h1>
		<!-- San pham MỚI -->
		<c:if test="${not empty message}">
			<h3 class="my-5 text-center">${message}</h3>
		</c:if>
		<c:set var="total" value="0"></c:set>
		<c:forEach var="item" items="${listCart}">
			<div class="card rounded-3 mb-4 mt-4">
				<div class="card-body p-4">
					<div class="row d-flex justify-content-between align-items-center">
						<div class="col-md-2 col-lg-2 col-xl-2">
							<img
								src="/image/${item.product.image}"
								class="img-fluid rounded-3" alt="Cotton T-shirt" onclick="window.location.href='/detail?pid=${item.product.id}'">
						</div>
						<div class="col-md-3 col-lg-3 col-xl-3">
							<p class="lead fw-normal mb-2">${item.product.name}</p>
							<p>
								<span class="text-muted">Tác giả: </span> ${item.product.author}
						</div>
						<div class="col-md-3 col-lg-3 col-xl-2">
							<form action="/cart/setquantity/${item.id}">
								<div class="d-flex">
									<button class="btn btn-link px-2" formaction="/cart/reduced/${item.id}">
										<i class="bi bi-dash" ></i>
									</button>
									<input id="form1" min="1" name="quantity" value="${item.quantityPurchased}"
										class="form-control form-control-sm"
										style="width: 70px; text-align: center;" onblur="this.form.submit()" type="number">
		
									<button class="btn btn-link px-2" formaction="/cart/increase/${item.id}">
										<i class="bi bi-plus"></i>
									</button>
								</div>
								
							</form>
							
						</div>
						<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
							<h5 class="mb-0"> <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="VND" maxFractionDigits="0"/></h5>
						</div>
						<div class="col-md-1 col-lg-1 col-xl-1 ">
							<a href="/cart/delete/${item.id}" class="text-danger alert-heading"><i
								class="bi bi-trash-fill" style="font-size: 23px;"></i></a>
						</div>
					</div>
				</div>
			</div>
			<c:set var="total" value="${total + (item.product.price * item.quantityPurchased)}"></c:set>
		</c:forEach>
		
		<c:if test="${not empty listCart}">
			<div class="col-12 row">
				<div class="col-6">
					<h5>Tổng tiền: <fmt:formatNumber value="${total}" type="currency" currencySymbol="VND" maxFractionDigits="0"/></h5>
				</div>
				<div class="col-6">
					<a href="/pay" class="btn btn-danger left-button">Thanh toán</a>
				</div>
			</div>
		</c:if>
		
	</div>
</main>