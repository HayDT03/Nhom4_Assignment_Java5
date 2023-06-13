<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<h2>Thông tin hóa đơn:${bill.id}</h2>
	<div class="row">
		<table class="table table-hover mt-2 mb-5">
			<thead class="thead-dark">
				<tr>
					<th>Mã người dùng</th>
					<th>Tên người dùng</th>
					<th>Tổng tiền</th>
					<th>Ngày lập</th>
					<th>Trạng thái</th>
					<th></th>
				</tr>
			</thead>
			<tbody class="bg-light">
				<tr>

					<td>${bill.user.id}</td>
					<td>${bill.user.fullname}</td>
					<td>${bill.total}</td>
					<td><fmt:formatDate value="${bill.date}" pattern="dd-MM-yyyy" /></td>
					<td>${bill.status }</td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	<h2 class='text-center'>Chi tiết hóa đơn</h2>
	<table class="table table-hover mt-2 mb-5">
		<thead class="thead-dark text-center">
			<tr>
				<th>STT</th>
				<th class="col-md-2">Hình cuốn sách</th>
				<th>Tên sách</th>
				<th>Tác giả</th>
				<th>Giá tiền</th>
				<th>Số lượng mua</th>
				<th></th>

			</tr>
		</thead>
		<tbody class="bg-light">
			<c:set var="stt" value="1" />
			<c:forEach items="${bill.orderDetails}" var="orderDetail">
				<tr>
					<td>${stt }</td>
					
					<td><img src="/image/${orderDetail.product.image}"
						width="100%"></td>
					<td class="text-center">${orderDetail.product.name}</td>
					<td>${orderDetail.product.author}</td>
					<td class="text-center">${orderDetail.product.price} VND</td>
					<td class="text-center">${orderDetail.quantityPurchased}</td>
					<td class="text-center"></td>
				</tr>
				<c:set var="stt" value="${stt+1 }"/>
			</c:forEach>
		</tbody>
	</table>
	<div class="row col-md-12 justify-content-center mb-4">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="?p=${pages.number-1}">&lt;&lt;</a></li>
				<c:forEach var="i" begin="1" end="${pages.totalPages}">
					<li class='page-item ${pages.number == i-1 ? "active":""}'><a
						class="page-link" href="?p=${i-1}">${i}</a></li>
				</c:forEach>

				<li class="page-item"><a class="page-link"
					href="?p=${pages.number+1}">&gt;&gt;</a></li>
			</ul>
		</nav>
	</div>
</div>
