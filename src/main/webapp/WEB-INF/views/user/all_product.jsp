<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <br>
  <br>
  <main>
    <div class="container-fluid">
      <h1 class="text-center">Welcome to the Bookstore</h1>
      <div class="row">
      
        <!-- Danh muc san pham -->
        <div class="col-lg-2">
          <div class="card">
            <div class="card-header text-center">
              <i class="bi bi-card-list"></i>
              Danh mục sản phẩm
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><a href="#">Sách thiếu nhi</a></li>
                <li class="list-group-item"><a href="#">Sách giáo dục</a></li>
                <li class="list-group-item"><a href="#">Sách nấu ăn</a></li>
              </a>
            </ul>
          </div>
        </div>
        <!-- =============================== -->
        <!-- San pham HOT -->
        <div class="col-lg-10">
          <div class="card">
            <div class="card-body">
              <div class="row">
                <!-- San pham 1 -->
                <c:forEach var="item" items="${page.content}">
				<c:set var="i" value="1"></c:set>
				<div class="col-md-3 mb-4">
					<div class="card">
						<img src="/image/${item.image}" class="card-img-top" alt="Book"
							height="300px">
						<div class="card-body">
							<h5 class="card-title" style="min-height: 2.5em;">${item.name}</h5>
							<p class="card-text">Tác giả: ${item.author}</p>
							<p class="card-text">Giá: <fmt:formatNumber value="${item.price}" type="number" pattern="0" /> VND</p>
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
                <!-- <!=========================> -->
              </div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <!-- Phân trang -->
      <nav aria-label="Page navigation example" style="margin-left: 780px;">
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
      <!-- <!===========================> -->
    </div>
  </main>
  <br>
  <br>