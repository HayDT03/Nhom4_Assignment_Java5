<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<main class="mb-5">
	<h1 style="height: 1em"></h1>
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<img src="/image/${product.image}" class="card-img-top" alt="${product.name}"
					height="500px">
			</div>
			<div class="col-lg-8">
				<h1>${product.name}</h1>
				<h5>Tác giả: ${product.author}</h5>
				<hr>
				<h6 class="text-info">Giá bán: <fmt:formatNumber value="${product.price}" type="number" pattern="0" /> VND</h6>
				<hr>
				<p style="min-height: 5.5em;">Mô tả: ${product.description}</p>
				<hr>

				<p>Số lượng: ${product.quantity}</p>
				<div class="row d-flex align-items-center">
					<form action="/detail" method="post" class="col-md-10 row d-flex align-items-center">
						<div class="col-md-4">
							
							<a style="text-decoration: none;" href="/detail/like/${product.id}"><i class="bi bi-hand-thumbs-up-fill" style="font-size: 20px;"></i> ${product.like}</a>
	<!-- 						<i class="bi bi-hand-thumbs-up-fill" style="font-size: 20px;"></i> Bỏ like -->
						</div>
						<input id="form1" min="1" name="quantity" value="1" type="number"
							class="form-control" style="width: 75px">
						
	
						<button type="submit" class="col-md-4 ms-2 btn btn-primary" formaction="/detail/add-to-cart/${product.id}"><i class="bi bi-cart"></i> Thêm vào
								giỏ hàng
						</button>
					</form>
					
					<button class="col-md-2 ms-auto btn btn-danger" onclick="window.location.href='/favorite/add/${product.id}'">
					<i class="bi bi-bookmark-plus-fill"></i>
							Yêu thích
					</button>

				</div>
			</div>
		</div>
		<br>
		<div class="card">
			<div class="card-header text-center  text-dark bg-info">SẢN
				PHẨM LIÊN QUAN</div>
			<div class="card-body">
				<div class="row">
					<c:forEach var="item" items="${listP}">
						<div class="col-md-2 mb-2" onclick="window.location.href='/detail?pid=${item.id}'">
							<div class="card">
								<img src="/image/${item.image}" class="card-img-top" alt="${item.name}"
									height="250px">
								<div class="card-body">
									<h5 class="card-title" style="min-height: 3.5em;">${item.name}</h5>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


		</div>
	</div>
		
</main>