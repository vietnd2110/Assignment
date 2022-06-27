<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Assignment1/css/bootstrap.min.css" />
<style>
.text {
	color: rgb(8, 8, 8);
	position: absolute;
	padding-left: 10px;
}
</style>
</head>
<body>
<body>
	<header>
		<div id="carouselExampleInterval" class="carousel slide p-0"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/Assignment1/imgs/Banner.png" style="height: 400px;"
						class="d-block w-100" alt="..." data-bs-interval="2000">
				</div>
				<div class="carousel-item">
					<img src="/Assignment1/imgs/Banner.png" style="height: 400px;"
						class="d-block w-100" alt="..." data-bs-interval="2000">
				</div>
				<div class="carousel-item">
					<img src="/Assignment1/imgs/Banner.png" style="height: 400px;"
						class="d-block w-100" alt="..." data-bs-interval="2000">
				</div>
				<div class="carousel-item">
					<img src="/Assignment1/imgs/Banner.png" style="height: 400px;"
						class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>`
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</header>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/Assignment1/home"> Trang Chủ </a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<c:if test="${ sessionScope.user != null && user.admin == 1 }">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/Assignment1/admin/accounts/index">
								Quản Lý Users </a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/Assignment1/admin/categories/index">
								Quản Lý Category </a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/Assignment1/admin/products/index">
								Quản Lý Product </a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/Assignment1/admin/orders/index">
								Quản Lý Order </a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/Assignment1/admin/orderDetails/index">
								Quản Lý OrderDetail </a></li>
					</ul>
				</c:if>
				<ul class="navbar-nav me-right mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-expanded="false"> <c:if
								test="${ sessionScope.user == null }"> Tùy chọn </c:if> <c:if
								test="${ sessionScope.user != null }">${ sessionScope.user.fullname } </c:if>

					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/Assignment1/login">Đăng
									nhập</a></li>

							<!-- 	<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
								<li><hr class="dropdown-divider"></li>
								 -->

							<li><a class="dropdown-item" href="/Assignment1/logout">Đăng
									xuất</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="row mt-3">
		<jsp:include page="${ view }"></jsp:include>
	</div>
	<div class="mt-3 p-0 bg-dark text-white text-center">VietND21</div>

	<script src="/Assignment1/js/jquery.min.js"></script>
	<script src="/Assignment1/js/popper.min.js"></script>
	<script src="/Assignment1/js/bootstrap.min.js"></script>
</body>
</html>