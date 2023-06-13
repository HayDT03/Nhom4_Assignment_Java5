<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán thành công</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body class="vh-100 d-flex justify-content-center align-items-center">
	<div class="row">
		
		<h1 class="text-success text-center col-12"><i class="bi bi-check-circle text-success" style="font-size: 40px"></i> ${message}</h1>
		<h3 class="col text-info col-12 text-center">Bạn sẽ được chuyển hướng về trang chủ</h3>
	</div>
	
	<script type="text/javascript">
        // Đếm ngược 10 giây
        setTimeout(function() {
            // Chuyển hướng về trang chủ
            window.location.href = "/";
        }, 10000); // 10 giây = 10000 miliseconds
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>