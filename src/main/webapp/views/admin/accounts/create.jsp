<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16308 - Create Account</title>
<link rel="stylesheet" href="/Assignment1/css/bootstrap.min.css" />
</head>
<body class="container">
	<form:form method="POST"
		action="/Assignment1/admin/accounts/store" modelAttribute="account">
		<div class="mt-3">
			<label>Fullname</label>
			<form:input name="fullname" path="fullname" class="form-control" />
			<form:errors path="fullname" class="text-danger" ></form:errors>
		</div>
		<div class="mt-3">
			<label>Email</label>
			<form:input path="email" type="email" name="email" class="form-control" />
			<form:errors path="email" class="text-danger" ></form:errors>
		</div>
		<div class="mt-3">
			<label>Username</label>
			<form:input path="username" name="username" class="form-control" />
			<form:errors path="username" class="text-danger" ></form:errors>
		</div>
		<div class="mt-3">
			<label>Password</label>
			<form:password path="password" name="password" class="form-control" />
			<form:errors path="password" class="text-danger" ></form:errors>
		</div>
		<div class="mt-3">
			<label>Photo</label>
			<form:input path="photo" name="photo" class="form-control" type="file" />
			<form:errors path="photo" class="text-danger" ></form:errors>
		</div>
		<div class="mt-3">
			<label>Admin</label>
			<form:select path="admin" class="form-control">
				<form:option value="0">Member</form:option>
				<form:option value="1">Admin</form:option>
			</form:select>
		</div>
		<button class="btn btn-success mt-3">Save</button>
	</form:form>
	
	<script src="/Assignment1/js/jquery.min.js"></script>
	<script src="/Assignment1/js/popper.min.js"></script>
	<script src="/Assignment1/js/bootstrap.min.js"></script>
</body>
</html>