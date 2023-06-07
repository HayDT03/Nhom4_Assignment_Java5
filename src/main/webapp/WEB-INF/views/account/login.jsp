<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<div class="vh-100 d-flex justify-content-center align-items-center">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-12 col-md-8 col-lg-6">
                    <div class="border border-3 border-primary"></div>
                    <div class="card bg-white shadow-lg">
                        <div class="card-body p-5">
                            <form class="mb-3 mt-md-4">
                                <h2 class="fw-bold mb-2 text-uppercase text-center">Đăng nhập</h2>

                                <div class="mb-3">
                                    <label class="form-label">Tên đăng nhập</label>
                                    <input type="text" class="form-control" placeholder="name@example.com">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label ">Mật khẩu</label>
                                    <input type="password" class="form-control" id="password" placeholder="*******">
                                </div>
                                <p class="small"><a class="text-primary" href="/account/forgot">Quên mật khẩu?</a></p>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>