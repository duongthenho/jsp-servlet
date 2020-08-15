<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Chi tiết đơn hàng</title>

</head>
<body>
	<div class="col-lg-9">
	<br>
		<div class="row">
			<div class="col-10">
				<h3>Mã đơn hàng: ${model.id}</h3>
			</div>
			<div class="col-2"></div>
			
		</div>
		<hr>
		<table class="table table-borderless" style=" background-color: #ccccb3; ">
			<tr>
				<td width="200">Người đặt: </td>
				<td><b>${model.fullName}</b></td>
			</tr>
			<tr>
				<td>Số điện thoại: </td>
				<td><b>${model.numberPhone}</b></td>
			</tr>
			<tr>
				<td>Email: </td>
				<td><b>${model.email}</b></td>
			</tr>
			<tr>
				<td>Địa chỉ: </td>
				<td><b>${model.address}</b></td>
			</tr>
			<tr>
				<td>Trạng thái: </td>
				<td><b>${model.status}</b></td>
			</tr>
			<tr>
				<td><hr></td>
				<td><hr></td>
			<tr>
			<tr>
				<td>Thành tiền: </td>
				<td style="color:red;"><h5><b>${model.totalMoney}</b></h5></td>
			</tr>
		</table>
		<h4>Ghi chú hàng hóa:...</h4>
		<table class="table table-bordered">
		    <thead>
		      <tr>
		        <th>Tên Sẩn phẩm</th>
		        <th>Mã số</th>
		        <th width="100">Số lượng</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach var="item" items="${cart.listResult}">
		      	<tr>
		      		<td>${item.name}</td>
		      		<td>${item.code}</td>
		      		<td align="center">${item.amount}</td>
		      	</tr>
		      </c:forEach>
		    </tbody>
		</table>
	</div>
</body>
</html>