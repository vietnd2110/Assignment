<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-10 offset-1 mt-5">
		<c:if test="${ not empty sessionScope.error }">
			<div class="alert alert-danger">${ sessionScope.error }</div>
			<c:remove var="error"/>
		</c:if>
	</div> 
	<div class="col-md-6 offset-md-3 ng-scope">
		<div class="text">
			<div class="row ng-scope">
				<div class="card inside" style="margin-top: 50%; margin-left: 65%;">
					<div class="row">
						<div class="col-md-12">
							<form:form method="POST" action="/Assignment1/login"
								class="ng-pristine ng-invalid ng-invalid-required"
								modelAttribute="account">
								<div class="card-body">
									<div class="mt-3" style="color: #1ddef7; text-align: center;">
										<b>
											<h2>Đăng nhập</h2>
										</b>
									</div>
									<div class="row mt-3">
										<label>Tài khoản:</label>
										<div class="mt-3">
											<form:input path="username" class="form-control" />
										</div>
									</div>
									<div class="row mt-3">
										<label>Mật khẩu</label>
										<div class="mt-3">
											<form:password path="password" class="form-control" />
										</div>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckChecked" checked=""> <label
											class="form-check-label" for="flexCheckChecked">
											Remember me </label>
									</div>

									<div class="row mt-3 mb-3">
										<div class="form-group text-center">
											<button class="border border-secondary rounded"
												style="background: #ff7304;">Đăng nhập</button>
											<br>
										</div>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<img src="/Assignment1/imgs/dn1.jpg" style="width: 100%; height: 100%;">
</body>
</html>

