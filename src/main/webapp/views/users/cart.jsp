<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<div class="row justify-content-center py-5">
		<table class="table table-striped align-middle table-responsive">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Tên sản phẩm</th>
					<th scope="col">Gía</th>
					<th scope="col">Số lượng</th>
					<th scope="col">Tổng giá</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sessionScope.cart}" var="orderDetail">
					<tr>
						<td><img alt="product"
							src="${orderDetail.value.product.image }"
							style="max-width: 150px" /></td>
						<td>${ orderDetail.value.product.name }</td>
						<td><fmt:formatNumber
								value="${orderDetail.value.product.price }" groupingUsed="true" />
							&nbsp;₫</td>

						<td>x${ orderDetail.value.quantity }</td>
						<td>${ orderDetail.product.name }</td>
						<td>
							<div>
								<fmt:formatNumber
									value="${orderDetail.value.quantity * orderDetail.value.product.price }"
									groupingUsed="true" />
								&nbsp;₫
							</div>
						</td>
						<td><a href="/cart/remove?p=${orderDetail.value.product.id }"><button
									class="btn btn-primary">Xóa khỏi giỏ</button></a></td>
					</tr>
					<c:set var="total"
						value="${total + orderDetail.value.quantity * orderDetail.value.product.price }" />
				</c:forEach>
			</tbody>
		</table>
		<div class="m-0 py-3 px-5 text-end">
			Tổng số tiền : <span class="text-danger"><fmt:formatNumber
					value="${total }" groupingUsed="true" />&nbsp;₫</span>
		</div>
	</div>
</div>