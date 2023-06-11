<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
        <div class="container-fluid menu">
            <a class="navbar-brand" href="/">Book Store</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/about">Giới thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/allproduct">Sách</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/contact">Liên hệ</a>
                    </li>
                    <c:if test="${not empty sessionScope.fullname}">
                    	<li class="nav-item">
	                        <a class="nav-link" href="/favorite">Yêu thích</a>
	                    </li>
                    </c:if>
                    
                    
                </ul>
                <form action="/allproduct" method="post" class="d-flex mx-auto" role="search" style="width: 35%">
                    <input name="keyword" value="${param.keyword}" class="form-control" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success ms-2" style="width: 35%" type="submit">Tìm kiếm</button>
                </form>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                	<c:if test="${not empty sessionScope.fullname}">
                    	<li class="nav-item navbar-righ">
	                        <a class="nav-link" href="/cart"><i class="bi bi-cart"></i> Giỏ hàng</a>
	                    </li>
                    </c:if>
                	
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
             				<c:if test="${not empty sessionScope.fullname}">
             					${sessionScope.fullname}
             				</c:if>
                            <c:if test="${empty sessionScope.fullname}">
             					Tài khoản
             				</c:if>
                        </a>
                        <ul class="dropdown-menu">
                        	<c:if test="${not empty sessionScope.user}">
                        		<li><a class="dropdown-item" href="/account/editprofile">Thay đổi thông tin</a></li>
                        		<c:if test="${sessionScope.user.role}">
                        			<li><a class="dropdown-item" href="/admin">Trang quản trị</a></li>
                        		</c:if>
                        		
             					<li><a class="dropdown-item" href="/account/logout">Đăng xuất</a></li>
             				</c:if>
             				<c:if test="${empty sessionScope.user}">
             					<li><a class="dropdown-item" href="/account/login">Đăng nhập</a></li>
	                            <li><a class="dropdown-item" href="/account/register">Đăng ký</a></li>
	                            <li><a class="dropdown-item" href="/account/forgot">Quên mật khẩu</a></li>
             				</c:if>
                            
                        </ul>
                    </li>
                </ul>
                
            </div>
        </div>
    </nav>