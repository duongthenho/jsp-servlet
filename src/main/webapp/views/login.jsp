<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="container">
		<!-- 		<h1 class="form-heading">login Form</h1> -->
		<div class="login-form">
		
			<div class="main-div">
			<h3>ZIO.COM</h3>
				<form id="Login" action="<c:url value='/dang-nhap'/>" method="POST">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">
							${message}
						</div>
					</c:if>
					
					<div class="form-group">


						<input type="text" class="form-control" id="userName"
							name="userName" placeholder="Tên tài khoản">

					</div>

					<div class="form-group">

						<input type="password" class="form-control" id="password"
							name="password" placeholder="Mật khẩu">

					</div>
										
					<input type="hidden" value="login" id="action" name="action" />
					<button type="submit" class="btn btn-primary">Đăng nhập</button>
					
				</form>
				<br>
				<p>Bạn chưa có tài khoản?<a href="<c:url value='/dang-ki'/>">Đăng kí ngay!</a></p>		
			</div>
				
		</div>
	</div>

</body>
</html>