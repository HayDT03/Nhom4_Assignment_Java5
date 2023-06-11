<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/form.css">
</head>
<body>
  <div class="vh-300 d-flex justify-content-center align-items-center mt-4">
        <div class="container form-group">
            <div class="row d-flex justify-content-center">
                <div class="col-12 col-md-8 col-lg-6">
                    <div class="border border-3 border-success"></div>
                    <div class="card bg-white shadow-lg">
                        <div class="card-body p-5">
                            <form:form class="mb-3 mt-md-4" modelAttribute="user" method="post" action="/account/register">
                                <h2 class="fw-bold mb-2 text-uppercase text-center">Đăng ký</h2>
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
                                <div class="mb-3">
                                    <label class="form-label">Tên đăng nhập</label>
                                    <form:input type="text" path="id" class="form-control" placeholder="name12"></form:input>
                                    <form:errors path="id" element="small" cssClass="form-text text-danger"></form:errors>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Họ và tên</label>
                                    <form:input path="fullname" type="text" class="form-control" placeholder="Nguyễn Văn Tèo"></form:input>
                                    <form:errors path="fullname" element="small" cssClass="form-text text-danger"></form:errors>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <form:input path="email" type="email" class="form-control" placeholder="name@example.com"></form:input>
                                    <form:errors path="email" element="small" cssClass="form-text text-danger"></form:errors>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Số điện thoại</label>
                                    <form:input path="phone" type="text" class="form-control" placeholder="0918487123"></form:input>
                                    <form:errors path="phone" element="small" cssClass="form-text text-danger"></form:errors>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Địa chỉ</label>
                                    <form:input path="address" type="text" class="form-control" placeholder="Cà Mau"></form:input>
                                    <form:errors path="address" element="small" cssClass="form-text text-danger"></form:errors>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Ngày sinh</label>
                                    <fmt:formatDate var="birthday" value="${user.birthday}" pattern="yyyy-MM-dd" />
                                    <form:input path="birthday" type="date" class="form-control" value="${birthday}"></form:input>
                                    <form:errors path="birthday" element="small" cssClass="form-text text-danger"></form:errors>
                                </div>
                                <div class="mb-3">
                                    <label for="gender" class="form-label col-12">Giới tính</label>
                                    <div class="form-check-inline me-5 mt-1" style="margin-left: -15px !important">
                                      <form:radiobuttons path="gender" items="${gender}" cssClass="ms-3 me-1"/>
                                    </div>
                                    <br>
                                    <form:errors path="gender" element="small" cssClass="form-text text-danger"></form:errors>
                                  </div>
                                  
                                <div class="mb-3">
                                    <label for="password" class="form-label ">Mật khẩu</label>
                                    <form:input path="password" type="password" class="form-control" id="password" placeholder="*******"></form:input>
                                    <form:errors path="password" element="small" cssClass="form-text text-danger"></form:errors>
                                </div>
                                <div class="mb-3">
                                    <label for="confirmPassword" class="form-label">Nhập lại mật khẩu</label>
                                    <form:input path="confirmPassword" type="password" class="form-control" id="password" placeholder="*******"></form:input>
                                    <form:errors path="confirmPassword" element="small" cssClass="form-text text-danger"></form:errors>
                                </div>
                                <div class="d-grid">
                                    <button class="btn btn-outline-primary" type="submit">Đăng ký</button>
                                </div>
                            </form:form>
                            <div>
                                <p class="mb-0 text-center">Bạn có muốn quay trở về? 
                                    <a href="/account/login" class="text-primary fw-bold">Đăng nhập</a>
                                </p>
                                <br>
                                <p class="mb-0 text-center">
                                    <a href="/" class="text-primary fw-bold">Quay trở lại trang chủ</a>
                                </p>
                            </div>
                        </div>
                        <div class="border border-3 border-success"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>