<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<jsp:include page="layout/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>

	<article class="container-fluid">
			 <article class="container">
        <div class="row my-4 col-md-12 justify-content-center">
            <form class="form-inline">
                <div class="form-group col-md-3">
                    <label class="text-right"><strong>Tìm kiếm:</strong></label>
                </div>
                <div class="form-group col-md-7">
                    <input type="text" class="form-control" placeholder="Nhập tên sách để tìm">
                </div>
                <div class="form-group col-2 ">
                    <button type="submit" class="btn btn-success">Tìm</button>
                </div>
            </form>
        </div>

        <div class="row">
            <h2> Danh sách sản phẩm hiện có trên shop</h2>
        </div>

        <div class="row">
            <table class="table table-hover mt-2 mb-5">
                <thead class="thead-dark">
                    <tr>
                        <th>STT</th>
                        <th>Tên sách</th>
                        <th>Giá</th>
                        <th>Ngày nhập</th>
                        <th>Quản lý</th>
                    </tr>
                </thead>
                <tbody class="bg-light">
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td><a href="/Quanlysanpham.html">Chi tiết</a></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td><a href="/Quanlysanpham.html">Chi tiết</a></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                        <td><a href="/Quanlysanpham.html">Chi tiết</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="row col-md-12 justify-content-center mb-4">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">&lt;&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>

                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;&gt;</a></li>
                </ul>
            </nav>
        </div>
    </article>

	</article>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
	<jsp:include page="layout/script.jsp"></jsp:include>
</body>

</html>