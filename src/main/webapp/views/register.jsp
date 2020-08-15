<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-register"></c:url>
<c:url var="RegisterURL" value="dang-ki"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng kí</title>
</head>
<body>
	<div class="container">
		<!-- 		<h1 class="form-heading">login Form</h1> -->
		
		
			<div class="main-div">
			<h3>Đăng kí tài khoản</h3>
			<hr>
				<form id="formSubmit" >
					<b>Tên tài khoản</b>
    				<input class="form-control"  type="text" placeholder="Tên tài khoản" name="userName" >
    				<br>
    				<b>Mật khẩu</b>
    				<input class="form-control"  type="password" placeholder="Mật khẩu" name="password" >
    				<br>
    				<b>Nhập lại mật khẩu</b>
    				<input class="form-control"  type="password" placeholder="Nhập lại mật khẩu" name="repeatPassword" >
    				<br>
    				<b>Họ và tên</b>
    				<input class="form-control"  type="text" placeholder="Họ và tên" name="fullName" >
    				<br>
    				<b>Số điện thoại</b>
    				<input class="form-control"  type="text" placeholder="Số điện thoại" name="numberPhone" >
    				<br>
    				<b>Địa chỉ email</b>
    				<input class="form-control"  type="text" placeholder="Địa chỉ email" name="email" >

    				<br>
    				<button id="btnDangKi" class="btn btn-success btn-lg btn-block" >Đăng kí</button>
    				<br>
    				<br>
    				<p>Nếu bạn đã có tài khoản? <a href="<c:url value='dang-nhap?action=login'/>">Đăng nhập</a>.</p>
				</form>	
			</div>
				
		</div>
<script>
	$("#btnDangKi").click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		
		var format = /[ !@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
		var format_fullName = /[1234567890!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
		
		if(data.userName == "" ||data.password == "" ||data.repeatPassword == "" ||
				data.fullName == "" ||data.numberPhone == "" ||data.email == ""){
			alert("Bạn phải điền đầy đủ thông tin");
		}
		else if(format.test(data.userName)){
			alert("Tên tài khoản không được chứa kí tự đặc biêt");
		}
		else if(format.test(data.password)){
			alert("Mật khẩu không được chứa kí tự đặc biêt");
		}
		else if(data.password != data.repeatPassword){
			alert("Nhập lại mật khẩu sai");
		}
		else if(format_fullName.test(data.fullName)){
			alert("Họ và tên chỉ có chữ và dấu cách");
		}
		else if(isNaN(data.numberPhone)){
			alert("Số điện thoại chỉ được nhập số");
		}
		else if(emailIsValid(data.email) == false){
			alert("Bạn đã nhập sai email");
		}
		else{
			register(data);
		}
	});
	
	function emailIsValid (email) {
		  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
		}
	
	function register(data) {
		$.ajax({
			url : '${APIurl}',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				alert(result);
				window.location.href="${RegisterURL}";
				
			},
			error : function(error) {
				alert("Bạn đã đăng kí thất bại");
				
			}
		});
	}
</script>	

</body>
</html>