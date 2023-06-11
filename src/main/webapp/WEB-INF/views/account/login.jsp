<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<link rel="stylesheet" href="/css/form.css">
<body>
	<div class="vh-100 d-flex justify-content-center align-items-center">
        <div class="container form-group" >
            <div class="row d-flex justify-content-center">
                <div class="col-12 col-md-8 col-lg-6">
                    <div class="border border-3 border-primary"></div>
                    	<div class="card bg-white shadow-lg" id="loginForm">
	                        <div class="card-body p-5">
		                         <form class="mb-3 mt-md-4" action="/account/login" method="post">
		                               <h2 class="fw-bold mb-2 text-uppercase text-center">Đăng nhập</h2>
		                                <div class="px-3">
		                                	<c:if test="${not empty message}">
										    <div id="alertMessage" class="alert alert-warning row" role="alert">
										        <span class="me-auto col-8">${message}</span>
										        <button type="button" class="btn-close ms-auto col-4" data-bs-dismiss="alert" aria-label="Close"></button>
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
										<c:if test="${not empty login}">
										    <div id="alertMessage" class="alert alert-warning row" role="alert">
										        <span class="me-auto col-8">${login}</span>
										        <button type="button" class="btn-close ms-auto col-4" data-bs-dismiss="alert" aria-label="Close"></button>
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
		                                </div>
										
		                                <div class="mb-3">
		                                    <label class="form-label">Tên đăng nhập</label>
		                                    <input type="text" class="form-control" name="username" value="${username}" placeholder="haydt123">
		                                </div>
		                                <div class="mb-3">
		                                    <label for="password" class="form-label ">Mật khẩu</label>
		                                    <input type="password" class="form-control" name="password" value="${password}" id="password" placeholder="*******">
		                                </div>
		                                <div class="d-flex justify-content-between align-items-center mb-3">
										<div class="form-check">
											<input class="form-check-input" name="remember" type="checkbox" value="true"
												id="flexCheckDisabled" checked="checked"> 
											<label class="form-check-label" for="flexCheckDisabled">
												Ghi nhớ đăng nhập?</label> 
										</div>
											<a class="text-primary" href="/account/forgot">Quên mật khẩu?</a>
										</div>
		                                <div class="d-grid">
		                                    <button class="btn btn-outline-dark" type="submit">Đăng nhập</button>
		                                </div>
		                            </form>
	                            <div>
                                <p class="mb-0  text-center">Bạn chưa có tài khoản? 
                                    <a href="/account/register" class="text-primary fw-bold">Đăng ký</a>
                                </p>
                                <br>
                                <p class="mb-0 text-center">
                                    <a href="/" class="text-primary fw-bold">Quay trở lại trang chủ</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script>
		var loginForm = document.getElementById('loginForm');
		loginForm.classList.add('show');
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>