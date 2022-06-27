<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16308 - QL Account</title>
<link rel="stylesheet" href="/Assignment1/css/bootstrap.min.css" />
</head>
<body>
	<div class="table-responsive col-10 offset-1">
		<a class="btn btn-success" href="/Assignment1/admin/accounts/create">
			Create </a>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Full name</th>
					<th>User name</th>
					<th>Email</th>
					<th>Photo</th>
					<th>Activated</th>
					<th>Role</th>
					<th colspan="2">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ data.content }" var="acc">
					<tr>
						<td>${ acc.id }</td>
						<td>${ acc.fullname }</td>
						<td>${ acc.username }</td>
						<td>${ acc.email }</td>
						<td><img src="/Assignment1/imgs/${ acc.photo }"
							style="width: 50px; height: 50px" /></td>
						<td>${ acc.activated == 0 ? "In-Active" : "Active" }</td>
						<td>${ acc.admin}</td>
						<td><a class="btn btn-primary"
							href="/Assignment1/admin/accounts/edit/${ acc.id }"> Update </a></td>
						<td><a class="btn btn-danger" data-bs-toggle="modal"
							data-bs-target="#Modal${ acc.id }"> Delete </a></td>

						<div class="modal fade" id="Modal${acc.id }" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										Bạn muốn xóa <b>${ acc.fullname }</b> không ?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">No</button>
										<button>
											<a href="/Assignment1/admin/accounts/delete/${ acc.id }"
												class="btn btn-danger" type="button"> Delete </a>
										</button>
									</div>
								</div>
							</div>
						</div>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<div class="row mt-3">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link"
						href="/Assignment1/admin/accounts/index">First</a></li>
					<li class="page-item"><a class="page-link"
						href="/Assignment1/admin/accounts/index?page=${ data.number - 1 }">Previous
					</a></li>
					<li class="page-item"><a class="page-link" href="#"> ${ data.number }</a>
					</li>
					<li class="page-item"><a class="page-link"
						href="/Assignment1/admin/accounts/index?page=${ data.number + 1 }">Next</a></li>
					<li class="page-item"><a class="page-link"
						href="/Assignment1/admin/accounts/index?page=${ data.totalPages - 1 }">Last</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<script src="/Assignment1/js/jquery.min.js"></script>
	<script src="/Assignment1/js/popper.min.js"></script>
	<script src="/Assignment1/js/bootstrap.min.js"></script>
</body>
</html>