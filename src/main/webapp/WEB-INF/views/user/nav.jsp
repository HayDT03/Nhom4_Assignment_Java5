<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li class="nav-item">
                        <a class="nav-link" href="/favourite">Yêu thích</a>
                    </li>
                    
                </ul>
                <form class="d-flex mx-auto w-25" role="search">
                    <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success ms-2" type="submit">Search</button>
                </form>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                	<li class="nav-item navbar-righ">
                        <a class="nav-link" href="/cart"><i class="bi bi-cart"></i> Giỏ hàng</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Tài khoản
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/account/login">Đăng nhập</a></li>
                            <li><a class="dropdown-item" href="/account/register">Đăng ký</a></li>
                            <li><a class="dropdown-item" href="/account/forgot">Quên mật khẩu</a></li>
                        </ul>
                    </li>
                </ul>
                
            </div>
        </div>
    </nav>