<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<main>
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<img src="hinh14.jpg" class="card-img-top" alt="Book 1"
					height="500px">
			</div>
			<div class="col-lg-8">
				<h1>Tên sản phẩm</h1>
				<p>Tác giả:</p>
				<hr>
				<h5>Giá bán: 99.99 VND</h5>
				<hr>
				<p>Mô tả: Hajime, nạn nhân bị bắt nạt và các bạn cùng lớp bị
					triệu hồi đến một thế giới khác. Trái ngược với chúng bạn với các
					khả năng chiến đấu siêu cường như hack game, Hajime chỉ có năng lực
					rất đỗi bình thường là khả năng biến đổi. Đến thế giới khác rồi mà
					Hajime vẫn trở thành người yếu nhất, thế là một đứa bạn cùng lớp ác
					ý đã khiến cậu rơi xuống đáy vực thẳm? Bên bờ vực của tuyệt vọng,
					khi không còn cách nào thoát thân, Hajime tìm ra con đường để trở
					thành người mạnh nhất với tư cách một biến đổi sư. Lúc đó, cuộc gặp
					gỡ định mệnh giữa cậu và nàng ma cà rồng tên Yue cũng diễn ra… “Tôi
					sẽ bảo vệ Yue, Yue cũng sẽ bảo vệ tôi. Chúng ta sẽ trở thành người
					mạnh nhất, chinh phạt tất cả và rời khỏi thế giới này.” Câu chuyện
					viễn tưởng “mạnh mẽ nhất” của thiếu niên rơi xuống địa ngục và ma
					cà rồng ở nơi sâu thẳm ấy, bắt đầu!</p>
				<hr>

				<p>Số lượng:</p>
				<div class="col-12 row d-flex align-items-center">
					<div class="col-md-4 col-lg-4 col-xl-3 d-flex">
						<button class="btn btn-outline-secondary px-2">
							<i class="bi bi-dash"></i>
						</button>
						<input id="form1" min="0" name="quantity" value="1" type="number"
							class="form-control form-control-sm"
							style="width: 70px; text-align: center;">

						<button class="btn btn-outline-secondary px-2">
							<i class="bi bi-plus"></i>
						</button>
					</div>
					<div class="col-md-4 col-lg-4 col-xl-3">
						<i class="bi bi-hand-thumbs-up" style="font-size: 20px;"></i> Like
						<i class="bi bi-hand-thumbs-up-fill" style="font-size: 20px;"></i>
						Bỏ like
					</div>

					<div class="col-md-4 col-lg-4 col-xl-3 ms-5">
						<a class="btn btn-primary"><i class="bi bi-cart"></i> Thêm vào
							giỏ hàng</a>
					</div>
					<div class="col-md-2 col-lg-2 col-xl-2 ms-auto">
						<a class="btn btn-danger"><i class="bi bi-bookmark-plus-fill"></i>
							Yêu thích</a>
					</div>

				</div>
			</div>
		</div>
		<br>
		<div class="card">
			<div class="card-header text-center  text-dark bg-info">SẢN
				PHẨM LIÊN QUAN</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-2 mb-2">
						<div class="card">
							<img src="hinh.jpg" class="card-img-top" alt="Book 1"
								height="250px">
							<div class="card-body">
								<h5 class="card-title">Book 1</h5>
							</div>
						</div>
					</div>
					<div class="col-md-2 mb-2">
						<div class="card">
							<img src="hinh.jpg" class="card-img-top" alt="Book 1"
								height="250px">
							<div class="card-body">
								<h5 class="card-title">Book 1</h5>
							</div>
						</div>
					</div>
					<div class="col-md-2 mb-2">
						<div class="card">
							<img src="hinh.jpg" class="card-img-top" alt="Book 1"
								height="250px">
							<div class="card-body">
								<h5 class="card-title">Book 1</h5>
							</div>
						</div>
					</div>
					<div class="col-md-2 mb-2">
						<div class="card">
							<img src="hinh.jpg" class="card-img-top" alt="Book 1"
								height="250px">
							<div class="card-body">
								<h5 class="card-title">Book 1</h5>
							</div>
						</div>
					</div>
					<div class="col-md-2 mb-2">
						<div class="card">
							<img src="hinh.jpg" class="card-img-top" alt="Book 1"
								height="250px">
							<div class="card-body">
								<h5 class="card-title">Book 1</h5>
							</div>
						</div>
					</div>
					<div class="col-md-2 mb-2">
						<div class="card">
							<img src="hinh.jpg" class="card-img-top" alt="Book 1"
								height="250px">
							<div class="card-body">
								<h5 class="card-title">Book 1</h5>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
		
</main>