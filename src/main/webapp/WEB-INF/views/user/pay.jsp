<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <main>
        <div class="container mt-4">
		<h1 class="text-center">XÁC NHẬN THANH TOÁN</h1>
		
		<div class="col-12 row">
			<hr>
			<div class="col-7">
				<h5 class="text-center">Đơn hàng của bạn</h5>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Hình sản phẩm</th>
							<th scope="col">Tên sản phẩm</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Tổng giá</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="total" value="0"></c:set>
						<c:forEach var="item" items="${listC}" varStatus="i">
							<tr>
								<th>${i.index + 1}</th>
								<td><img src="/image/${item.product.image}" alt=""
									width="100px" height="100px"></td>
								<td>${item.product.name}</td>
								<td>${item.quantityPurchased}</td>
								<td><fmt:formatNumber
										value="${item.quantityPurchased * item.product.price}"
										type="currency" currencySymbol="VND" maxFractionDigits="0" /></td>
							</tr>
							<c:set var="total"
								value="${total + item.quantityPurchased * item.product.price}"></c:set>
						</c:forEach>

					</tbody>
				</table>
				<h5 class="mt-3">
					Tổng tiền:
					<fmt:formatNumber value="${total}" type="currency"
						currencySymbol="VND" maxFractionDigits="0" />
				</h5>
			</div>
			<div class="col-5 text-center">
				<div class="col-11 ms-5">
					<h5>Thông tin mua hàng</h5>
					<c:if test="${not empty message}">
						<div id="alertMessage" class="alert alert-warning row" role="alert">
							<span class="me-auto col-8">${message}</span>
							<button type="button" class="btn-close ms-auto col-4"
								data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
						<script>
							var alertMessage = document.getElementById('alertMessage');
							var closeButton = alertMessage.querySelector('.btn-close');
							var timeoutId;
			
							closeButton.addEventListener('click', function() {
								alertMessage.style.display = 'none';
								clearTimeout(timeoutId);
							});
			
							timeoutId = setTimeout(function() {
								alertMessage.style.display = 'none';
							}, 5000); // Tắt cảnh báo sau 5 giây (5000 milliseconds)
						</script>
					</c:if>
					<form action="/pay" method="post" class="my-5">

						<div class="mb-3">
							<input readonly="readonly" value="${user.fullname}" type="text"
								class="form-control" placeholder="Họ và tên(*)">
						</div>
						<div class="mb-3">
							<input readonly="readonly" value="${user.email}" type="text"
								class="form-control" placeholder="Email(*)">
						</div>
						<div class="mb-3">
							<input readonly="readonly" value="${user.phone}" type="text"
								class="form-control" placeholder="Số điện thoại(*)">
						</div>
						<div class="mb-3">
							<input readonly="readonly" value="${user.address}" type="text"
								class="form-control" placeholder="Địa chỉ(*)">
						</div>
						<div class="mb-3">
							<textarea class="form-control"
								placeholder="Ghi chú về đơn hàng. Ví dụ: thời gian cụ thể giao hàng, địa điểm giao hàng chi tiết hơn..."
								style="height: 100px"></textarea>
						</div>
						<button type="submit" class="btn btn-primary col-12">Xác
							nhận thanh toán</button>
					</form>
				</div>
			</div>
		</div>
	</div>
    </main>
    <br>
    <br>
