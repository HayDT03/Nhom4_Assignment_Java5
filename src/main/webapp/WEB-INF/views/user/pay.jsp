<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <br>
    <br>
    <main>
        <div class="container mt-4">
            <h1 class="text-center">THANH TOÁN</h1>
            <div class="col-12 container row">
                <hr>
                <div class="col-6">
                    <h5 class="text-center">Đơn hàng của bạn</h5>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Hình sản phẩm</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Tổng giá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td><img src="hinh.png" alt="" width="100px" height="100px"></td>
                                <td>Otto</td>
                                <td>@mdo</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td><img src="hinh.png" alt="" width="100px" height="100px"></td>
                                <td>Thornton</td>
                                <td>@fat</td>
                                <td>@mdo</td>
                            </tr>
                        </tbody>
                    </table>
                    <h5>Tổng tiền:</h5>
                </div>
                <div class="col-6 text-center">
                    <div class="col-11 container">
                        <form>
                            <h5>Thông tin mua hàng</h5>
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Họ và tên(*)">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Email(*)">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Số điện thoại(*)">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Địa chỉ(*)">
                            </div>
                            <div class="mb-3">
                                <textarea class="form-control"
                                    placeholder="Ghi chú về đơn hàng. Ví dụ: thời gian cụ thể giao hàng, địa điểm giao hàng chi tiết hơn..."
                                    style="height: 100px"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Thanh toán</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <br>
    <br>
