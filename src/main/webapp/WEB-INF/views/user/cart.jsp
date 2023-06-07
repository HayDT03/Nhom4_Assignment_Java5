<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br><br>
    <main>
        <div class="container mt-4">
            <h1 class="text-center">GIỎ HÀNG</h1>
            <hr>
            <!-- San pham MỚI -->
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered text-center"
                        style="vertical-align: middle;border-color: inherit;">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Ảnh sản phẩm</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Đơn giá</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Tổng giá</th>
                                <th scope="col">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td><img src="hinh.jpg" alt="" width="120px" height="120px"></td>
                                <td>TokuDA</td>
                                <td>1900000</td>
                                <td>1</td>
                                <td>1900000</td>
                                <td><a href="#" style="text-decoration: none; color: red;"><i
                                            class="bi bi-trash3-fill"></i> Xóa</a></td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td><img src="hinh.jpg" alt="" width="120px" height="120px"></td>
                                <td>TokuDA</td>
                                <td>1900000</td>
                                <td>1</td>
                                <td>1900000</td>
                                <td><a href="#" style="text-decoration: none; color: red;"><i
                                            class="bi bi-trash3-fill"></i> Xóa</a></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="col-12 row">
                        <div class="col-6">
                            <h5>Tổng tiền: </h5>
                        </div>
                        <div class="col-6">
                            <a href="/pay" class="btn btn-danger left-button">Thanh toán</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
    </main>
    <br>
    <br>