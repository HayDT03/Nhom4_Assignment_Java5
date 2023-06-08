<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
  <div class="vh-300 d-flex justify-content-center align-items-center">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-12 col-md-8 col-lg-6">
                    <div class="border border-3 border-success"></div>
                    <div class="card bg-white shadow-lg">
                        <div class="card-body p-5">
                            <form class="mb-3 mt-md-4">
                                <h2 class="fw-bold mb-2 text-uppercase text-center">Đăng ký</h2>
                                <div class="mb-3">
                                    <label class="form-label">Họ và tên</label>
                                    <input type="text" class="form-control" placeholder="Nguyễn Văn Tèo">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" class="form-control" placeholder="name@example.com">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" placeholder="0918487123">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Địa chỉ</label>
                                    <input type="text" class="form-control" placeholder="Cà Mau">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Ngày sinh</label>
                                    <input type="date" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label for="gender" class="form-label">Giới tính</label>
                                    <br>
                                    <div class="form-check form-check-inline" >
                                      <input class="form-check-input" type="radio" name="gender" id="male" value="male" checked>
                                      <label class="form-check-label" for="male">
                                        Nam
                                      </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                      <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                                      <label class="form-check-label" for="female">
                                        Nữ
                                      </label>
                                    </div>
                                  </div>
                                <div class="mb-3">
                                    <label class="form-label">Tên đăng nhập</label>
                                    <input type="text" class="form-control" placeholder="name12">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label ">Mật khẩu</label>
                                    <input type="password" class="form-control" id="password" placeholder="*******">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Nhập lại mật khẩu</label>
                                    <input type="password" class="form-control" id="password" placeholder="*******">
                                </div>
                                <div class="d-grid">
                                    <button class="btn btn-outline-primary" type="submit">Đăng ký</button>
                                </div>
                            </form>
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