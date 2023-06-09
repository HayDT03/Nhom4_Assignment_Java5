<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row col-md-12 justify-content-center my-4">
	<h2>Quản lý người dùng</h2>
</div>
<div class="row justify-content-center">
	<form:form action="user/save" modelAttribute="user"
		class="form col-md-7 p-5" style="border: 1px solid black;">
		<div class="form-group">
			<label>ID:</label>
			<form:input type="text" class="form-control" path="id" />
		</div>
		<div class="form-group">
			<label>Mật khẩu:</label>
			<form:input type="password" class="form-control" path="password" />
		</div>
		<div class="form-group">
			<label>Họ tên:</label>
			<form:input type="text" class="form-control" path="fullname" />
		</div>
		<div class="form-group">
			<label>Email:</label>
			<form:input type="password" class="form-control" path="email" />
		</div>
		<div class="form-group">
			<label>Giới tính:</label>
			<div class="row">
				<div class="form-check ml-4">
						<form:radiobutton class="form-check-input" value="true"
							name="exampleRadios" path="gender" />
						<label class="form-check-label"> Nam </label>
				</div>
				<div class="form-check ml-3">
						<form:radiobutton class="form-check-input" value="false"
							name="exampleRadios" path="gender" />
						<label class="form-check-label"> Nữ </label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label>Ngày sinh:</label>
			
			<form:input type="date" class="form-control" path="birthday"
			<fmt:formatDate value="${user.birthday }"
								pattern="dd-MM-yyyy" />/>
		</div>
		<div class="form-group">
			<label>Số điện thoại:</label>
			<form:input type="text" class="form-control" path="phone" />
		</div>
		<div class="form-group">
			<label>Địa chỉ:</label>
			<form:textarea type="text" class="form-control" path="address" />
		</div>
		<div class="form-group">
			<label>Quyền:</label>
			<div class="row">
				<div class="form-check ml-4">
						<form:radiobutton class="form-check-input" value="true"
							name="exampleRadios1" path="role" />
						<label class="form-check-label"> Quản trị </label>
				</div>
				<div class="form-check ml-3">
					<form:radiobutton class="form-check-input" value="false"
						name="exampleRadios1" path="role" />
					<label class="form-check-label"> Người dùng </label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label>Trạng thái tài khoản:</label>
			<div class="row">
				<div class="form-check ml-4">
					<form:radiobutton class="form-check-input" value="true"
						name="exampleRadios1" path="active" />
					<label class="form-check-label"> Đang hoạt động </label>
				</div>
				<div class="form-check ml-3">
					<form:radiobutton class="form-check-input" value="false"
						name="exampleRadios1" path="active" />
					<label class="form-check-label"> Bị khóa </label>
				</div>
			</div>
		</div>
		<div class="row col-md-12 ">
			<button formaction="/admin/manage/user/edit/${user.id}" type="submit" class="btn btn-warning mx-3"
				style="border-radius: 20px;">Cập nhật</button>
			<button formaction="/admin/manage/user/reset" type="submit" class="btn btn-primary"
				style="border-radius: 20px;">Làm mới</button>
		</div>
	</form:form>
</div>
<div class="row my-4 col-md-12 justify-content-center">
	<form class="form-inline">
		<div class="form-group col-md-3">
			<label class="text-right"><strong>Tìm kiếm:</strong></label>
		</div>
		<div class="form-group col-md-7">
			<input type="text" class="form-control"
				placeholder="Nhập tên người dùng để tìm">
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
				<th>Id</th>
				<th>Mật khẩu</th>
				<th>Họ tên</th>
				<th>Email</th>
				<th>Giới tính</th>
				<th>Ngày sinh</th>
				<th>Số điện thoại</th>
				<th>Địa chỉ</th>
				<th>Quyền</th>
				<th>Trạng thái</th>
				<th></th>
			</tr>
		</thead>
		<tbody class="bg-light">
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.id}</td>
					<td>${list.password}</td>
					<td>${list.fullname}</td>
					<td>${list.email}</td>
					<td>${list.gender ? 'Nam' : 'Nữ'}</td>
					<td>${list.birthday}</td>
					<td>${list.phone}</td>
					<td>${list.address}</td>
					<td>${list.role ? 'Admin' : 'User'}</td>
					<td>${list.active ? 'Đang hoạt động' : 'Bị Khoá'}</td>
					<td><a href="/admin/manage/user/getform/${list.id}">Sửa</a>|
						<a href="/admin/manage/user/remove/${list.id}">Xóa</a></td>
				</tr>
			</c:forEach>
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