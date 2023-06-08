<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="row col-md-12 justify-content-center my-4">
            <h2>Quản lý người dùng</h2>
        </div>
        <div class="row justify-content-center">
            <form class="form col-md-7 p-5" style="border: 1px solid black;">
                <div class="form-group">
                    <label>Họ tên người dùng:</label>
                    <input type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>Tài khoản</label>
                    <input type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>Ngày sinh</label>
                    <input type="date" class="form-control">
                </div>
                <div class="form-group">
                    <label>Giới tính:</label>
                    <div class="row">
                        <div class="form-check ml-4">
                            <input class="form-check-input" type="radio" value="option1" name="exampleRadios">
                            <label class="form-check-label">
                                Nam
                            </label>
                        </div>

                        <div class="form-check ml-3">
                            <input class="form-check-input" type="radio" value="option2" name="exampleRadios">
                            <label class="form-check-label">
                                Nữ
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Quyền:</label>
                    <div class="row">
                        <div class="form-check ml-4">
                            <input class="form-check-input" type="radio" value="option1" name="exampleRadios1">
                            <label class="form-check-label">
                                Quản trị
                            </label>
                        </div>

                        <div class="form-check ml-3">
                            <input class="form-check-input" type="radio" value="option2" name="exampleRadios1">
                            <label class="form-check-label">
                                Người dùng
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Trạng thái tài khoản:</label>
                    <div class="row">
                        <div class="form-check ml-4">
                            <input class="form-check-input" type="radio" value="option1" name="exampleRadios1">
                            <label class="form-check-label">
                                Đang hoạt động
                            </label>
                        </div>
                        <div class="form-check ml-3">
                            <input class="form-check-input" type="radio" value="option2" name="exampleRadios1">
                            <label class="form-check-label">
                                Bị khóa
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" class="form-control">
                </div>
                <div class="form-group">
                    <label>Số điện thoại</label>
                    <input type="text" class="form-control">
                </div>

                <div class="form-group">
                    <label>Địa chỉ</label>
                    <input type="text" class="form-control">
                </div>

                <div class="row col-md-12 ">
                    <button type="submit" class="btn btn-warning mx-3" style="border-radius: 20px;">Cập nhật</button>
                    <button type="submit" class="btn btn-primary" style="border-radius: 20px;">Làm mới</button>
                </div>
            </form>
        </div>
        <div class="row my-4 col-md-12 justify-content-center">
            <form class="form-inline">
                <div class="form-group col-md-3">
                    <label class="text-right"><strong>Tìm kiếm:</strong></label>
                </div>
                <div class="form-group col-md-7">
                    <input type="text" class="form-control" placeholder="Nhập tên người dùng để tìm">
                </div>
                <div class="form-group col-2 ">
                    <button type="submit" class="btn btn-success">Tìm</button>
                </div>
            </form>
        </div>
        <div class="row">
            <table class="table table-hover mt-2 mb-5">
                <thead class="thead-dark">
                    <tr>
                        <th>Họ tên</th>
                        <th>Tài khoản</th>
                        <th>Giới tính</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                        <th>Trạng thái</th>
                        <th>Quyền</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="bg-light">
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>10000</td>
                        <td>ádad</td>
                        <td></td>
                        <td><a href="/Quanlysanpham.html">Sửa|Xóa</a></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>10000</td>
                        <td>ádad</td>
                        <td></td>
                        <td><a href="/Quanlysanpham.html">Sửa|Xóa</a></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>10000</td>
                        <td>ádad</td>
                        <td></td>
                        <td><a href="/Quanlysanpham.html">Sửa|Xóa</a></td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>10000</td>
                        <td>ádad</td>
                        <td></td>
                        <td><a href="/Quanlysanpham.html">Sửa|Xóa</a></td>
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