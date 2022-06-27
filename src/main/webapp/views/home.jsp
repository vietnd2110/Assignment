<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="col-2">
	<div class="row mt-3 mb-3">
		<div class="col">
			<div class="card">
				<div class="card-header">
					<a style="text-decoration: none; color: blue"><b>Danh mục
							sản phẩm</b></a>
				</div>
				<c:forEach var="cate" items="${ cate }">
					<ul class="list-group list-group-flush">
						<a class="list-group-item ng-binding">${ cate.name }</a>
					</ul>
				</c:forEach>
			</div>
		</div>

	</div>
</div>
<div class="col-10">
	<div class="row p-2">
		<c:if test="${!empty data.content }">
			<c:forEach items="${ data.content }" var="product">
				<div class="card col-3 mt-2">
					<img src="/Assignment1/imgs/${product.image }"
						style="width: 100%; height: 200px" class="card-img-top"
						alt="${product.name }">
					<div class="card-body py-2 px-0 text-center">
						<h5 class="card-title text-danger">
							<fmt:formatNumber value="${product.price }" groupingUsed="true" />
							&nbsp;₫
						</h5>
						<p class="card-text">${product.name }</p>
						<a href="/Assignment1/cart?p=${product.id}" class="btn btn-primary">Thêm
							vào giỏ hàng</a>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<br>
	<div class="row mt-3">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="/Assignment1/home">First</a></li>
				<li class="page-item"><a class="page-link"
					href="/Assignment1/home?page=${ data.number - 1 }">Previous </a></li>
				<li class="page-item"><a class="page-link" href="#"> ${ data.number }</a>
				</li>
				<li class="page-item"><a class="page-link"
					href="/Assignment1/home?page=${ data.number + 1 }">Next</a></li>
				<li class="page-item"><a class="page-link"
					href="/Assignment1/home?page=${ data.totalPages - 1 }">Last</a></li>
			</ul>
		</nav>
	</div>
</div>
