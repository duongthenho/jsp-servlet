<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dang nhap</title>
</head>
<body>
	<div class="container">
		<!-- 		<h1 class="form-heading">login Form</h1> -->
		<div class="login-form">
			<div class="main-div">
				<!-- 				<div class="panel"> -->
				<!-- 					<h2>Admin Login</h2> -->
				<!-- 					<p>Please enter your email and password</p> -->
				<!-- 				</div> -->
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
					<!-- 					<div class="forgot"> -->
					<!-- 						<a href="reset.html">Forgot password?</a> -->
					<!-- 					</div> -->
					<input type="hidden" value="login" id="action" name="action" />
					<button type="submit" class="btn btn-primary">Đăng nhập</button>

				</form>
			</div>
			<!-- 			<p class="botto-text">Designed by Sunil Rajput</p> -->
		</div>
	</div>

</body>
</html>