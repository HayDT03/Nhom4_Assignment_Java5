<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<main class="p-5">
	<h1 class="text-center">DANH SÁCH SẢN PHẨM YÊU THÍCH</h1>
    <div class="container mt-5">
    	 <div class="row">   
           <c:if test="${not empty message}">
				<h3 class="my-5 text-center">${message}</h3>
			</c:if>
			<c:set var="total" value="0"></c:set>
            <!-- San pham MỚI -->
                    <c:forEach var="item" items="${listFavourite}">
                        <!-- San pham 1 -->
                        <div class="col-md-3 mb-4" onclick="window.location.href='/detail?pid=${item.product.id}'">
                            <div class="card">
                                <img src="/image/${item.product.image}" class="card-img-top" alt="Book 1" height="300px">
                                <div class="card-body">
                                    <h5 class="card-title" style="min-height: 2.5em;">${item.product.name}</h5>
                                    <p class="card-text">Tác giả: ${item.product.author}   
                                    </p>
                                    <p class="card-text">Giá: <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="VND" maxFractionDigits="0"/></p>
                  
                                   <form action="/cart/add">
										<button type="submit" formaction="/cart/add/${item.product.id}" class="btn btn-outline-primary col-12">
											<i class="bi bi-cart"></i> Thêm giỏ hàng
										</button>
									</form>
                               		<br>
                                    <form action="/cart/delete">
										<button type="submit" formaction="/favorite/delete/${item.id}" class="btn btn-outline-danger col-12">
											<i class="bi bi-x-lg"></i> Hủy yêu thích
										</button>
									</form>
                                </div>
                            </div>
                        </div>
                        </c:forEach>                 
                        <!-- -------------- -->
                    </div>
                </div>
			<c:set var="i" value="${i + 1}" />
    </main>