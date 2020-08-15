<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type='text/javascript' src='<c:url value="/template/admin/js/kit.fontawesome.js" />'></script>
<%@include file="/common/taglib.jsp"%>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="<c:url value='/cart'/>">Giỏ hàng <i class='fas fa-shopping-cart' style='font-size:24px;color:white'></i></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value='/trang-chu'/>">Home <span class="sr-only">(current)</span>
				</a></li>
				<c:if test="${not empty USERMODEL}">
					<li class="nav-item"><a class="nav-link"
						href="#"> WELCOME, ${USERMODEL.fullName}</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/thoat?action=logout'/>"> Thoát </a></li>
				</c:if>
				<c:if test="${empty USERMODEL}">
					<li class="nav-item"><a class="nav-link"
						href="#"> Đăng ký</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/dang-nhap?action=login'/>"> Đăng nhập </a></li>
				</c:if>
				


			</ul>
		</div>
	</div>
</nav>