<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="searchURL" value="search?key="></c:url>'>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="<c:url value='/cart'/>">
			Giỏ hàng <i class='fas fa-shopping-cart' style='font-size:24px;color:white'></i>
		</a>
		<a class="navbar-brand" href="<c:url value='list-bill'/>">
			Đơn hàng <i class='fas fa-copy' style='font-size:24px;color:white'></i>
		</a>
		
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" placeholder="Nhập tên sản phẩm hoặc mã số..." style="width:350px;" id="key">
		 &nbsp;&nbsp;&nbsp;&nbsp;
		
			<button type="button" class="btn btn-danger" id="btnSearch">Tìm kiếm</button>
		
		
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value='/trang-chu'/>">Home <span class="sr-only">(current)</span>
				</a></li>
				
					<li class="nav-item"><a class="nav-link"
						href="#"> Welcome, <b>${USERMODEL.fullName}</b></a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/thoat?action=logout'/>"> Đăng xuất </a></li>
			</ul>
		</div>
	</div>
	<script>
		$("#btnSearch").click(function(){
			if($("#key").val() == "" || $("#key").val() == " ")
				alert("Bạn phải nhập từ khóa");
			else
				window.location.href ="${searchURL}"+$("#key").val();
		});
	</script>
</nav>