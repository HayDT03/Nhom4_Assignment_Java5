<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Đổi mật khẩu</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/form.css">
</head>
<body>
    <div class="vh-100 d-flex justify-content-center align-items-center">
        <div class="container form-group">
            <div class="row d-flex justify-content-center">
                <div class="col-12 col-md-8 col-lg-6">
                    <div class="border border-3 border-success"></div>
                    <div class="card bg-white shadow-lg">
                        <div class="card-body p-5">
                            <form class="mb-3 mt-md-4" action="/account/change" method="post">
                                <h2 class="fw-bold mb-2 text-uppercase text-center">Đổi mật khẩu</h2>
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
										<c:if test="${not empty messageSuccess}">
										    <div id="alertMessage" class="alert alert-warning row" role="alert">
										        <span class="me-auto col-11">${messageSuccess}</span>
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
										            window.location.href = "/account/login";
										        }, 5000); // Tắt cảnh báo sau 5 giây (5000 milliseconds)
										    </script>
										</c:if>
                                <div class="mb-3">
                                    <label class="form-label">Mật khẩu mới</label>
                                    <input required="required" type="password" name="password" class="form-control" placeholder="name@example.com">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Xác nhận mật khẩu mới</label>
                                    <input required="required" type="password" name="passwordConfirm" class="form-control" placeholder="name12">
                                </div>
                                <div class="d-grid">
                                    <button class="btn btn-outline-primary" type="submit">Xác nhận</button>
                                </div>
                            </form>
                            <div>
                                <p class="mb-0  text-center">Bạn có muốn quay trở về?
                                    <a href="/account/login" class="text-primary fw-bold">Đăng nhập</a>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>