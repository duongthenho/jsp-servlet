<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="billDetail" value='/bill-detail?id=' />
<c:url var="APICart" value="/api-cart" />
<c:url var="APIQuanHuyen" value="/api-QH" />
<c:url var="APIXaPhuongTT" value="/api-XPTT" />
<c:url var="cartURL" value="/cart" />
<c:url var="APIBill" value="/api-bill" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
</head>
<body>
	<div class="col-lg-9">

		<br>
		<div class="row">
			<div class="col-10">
				<h3>Giỏ hàng</h3>
			</div>
			<div class="col-2"></div>
		</div>
		<hr>



		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Ảnh</th>
					<th>Sản phẩm</th>
					<th>Mã số</th>
					<th>Giá</th>
					<th>Số lượng</th>
					<c:if test="${not empty model.listResult}">
						<th width="50px"><button id="btnDelete" type="button"
							class="btn btn-danger">Xóa</button></th>
					</c:if>
				</tr>
			</thead>
			<tbody>

				<c:set var="totalMoney" value="${0}" />

				<c:forEach var="item" items="${model.listResult }">
					<c:set var="totalMoney"
						value="${totalMoney+(item.price*item.amount)}" />

					<tr>
						<td><img  src="<c:url value='/image?id=${item.productId}' />" width="70" height="95" alt=""></td>
						<td>${item.name}</td>
						<td>${item.code}</td>
						<td><fmt:formatNumber type="number" pattern="###,###.###"
								value="${item.price}" /> VNĐ</td>
						<td>
							<input type="number"
							style="width: 80px; text-align: center;" value="${item.amount}"
							id="amount${item.productId}${USERMODEL.id }"
							onchange="myFunction(${item.productId},${USERMODEL.id},${item.price},${item.amount})"
							name="amount" min="1" />
						</td>
						<td align="center"><input type="checkbox"
							id="checkbox_${item.id}" value="${item.id}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${ not empty model.listResult}">
			<form>
			
				<h4 align="right">-- Thành tiền --</h4>
				<h4 align="right" style="color: orange;" id="tongTien">
					<span> <fmt:formatNumber type="number"
							pattern="###,###.###" value="${totalMoney}" />
					</span> VNĐ
				</h4>
				<h3>Thực hiện đặt hàng</h3>
				<hr>


				<div class="row">
					<label class="col-sm-3 control-label no-padding-right">Họ
						tên</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id=fullName name="fullName"
							value="${USERMODEL.fullName }" />
					</div>
					<br> <br> <label
						class="col-sm-3 control-label no-padding-right">Số điện
						thoại</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="numberPhone" name="numberPhone"
							value="${USERMODEL.numberPhone}" />
					</div>
					<br> <br> <label
						class="col-sm-3 control-label no-padding-right">Email</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="email" name="email"
							value="${USERMODEL.email}" />
					</div>
					<br> <br> <label
						class="col-sm-3 control-label no-padding-right">Tỉnh/Thành
						phố</label>
					<div class="col-sm-9">
						<select onchange="loadQuanHuyen()" class="custom-select"
							name="thanhpho" id="thanhpho">
							<option value="aa" selected>-- Chọn --</option>
							<c:forEach var="item" items="${TTP}">
								<option value="${item.matp}">${item.name}</option>
							</c:forEach>
						</select>
					</div>
					<br> <br> <label
						class="col-sm-3 control-label no-padding-right">Quận/Huyện</label>
					<div class="col-sm-9">
						<select onchange="loadXaPhuongThiTran()" class="custom-select"
							name="quanhuyen" id="quanhuyen">

						</select>
					</div>
					<br> <br> <label
						class="col-sm-3 control-label no-padding-right">Xã/Phường/Thị
						trấn</label>
					<div class="col-sm-9">
						<select class="custom-select" name="xaphuongthitran" id="xaphuongthitran">

						</select>
					</div>
					<br>
					<br> <label class="col-sm-3 control-label no-padding-right">Nơi
						nhận hàng</label>
					<div class="col-sm-7">
						<textarea class="form-control" rows="2" id="noinhan"></textarea>

					</div>
					<input type="hidden" id="userId" name="userId" value="${USERMODEL.id}"/>
					&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" id="btnDatHang">
						<i class='far fa-arrow-alt-circle-right'></i> <b>Đặt hàng</b>
					</button>

				</div>
				<br>
			</form>
		</c:if>

	</div>

<script>
	function myFunction(product_id,user_id,price,oldAmount){
		var newAmount = document.getElementById("amount"+product_id+user_id).value;
		var totalMoney = ${totalMoney} +(newAmount-oldAmount)*price;

		 var data = {amount: newAmount, userId: user_id, productId: product_id,totalMoney:totalMoney};
	       $.ajax({
	           url: '${APICart}',
	           type: 'PUT',
	           contentType: 'application/json',
	           data: JSON.stringify(data),
	           dataType: 'json',
	           success: function (result) {
	        	   $("#tongTien").html(result);
	           	//window.location.href = "${NewURL}?type=edit&id="+result.id+"&message=insert_success";
	           },
	           error: function (error) {
	           	alert("Bạn đã thêm thất bại");
	           	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
	           }
	       });
	}
	
	$("#btnDelete").click(function() {
		var data = {};
		var ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
		
			data['ids'] = ids;
			$.ajax({
	            url: '${APICart}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	alert("Bạn đã xóa thành công");
	                window.location.href = "${cartURL}";
	            	
	            },
	            error: function (error) {
	            	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
	            }
	        });
		
	});
	
	function loadQuanHuyen(){	
		var matp = $("#thanhpho").val();
		var data ={"matp":matp};
		 $.ajax({
	            url: '${APIQuanHuyen}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	$("#quanhuyen").html(result);
	            	$("#xaphuongthitran").html("");
	                //window.location.href = "${cartURL}";
	            	
	            },
	            error: function (error) {
	            	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
	            }
	        });
	}
	function loadXaPhuongThiTran(){	
		var maqh = $("#quanhuyen").val();
		var data ={"maqh":maqh};
		 $.ajax({
	            url: '${APIXaPhuongTT}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	$("#xaphuongthitran").html(result);
	            	
	                //window.location.href = "${cartURL}";
	            	
	            },
	            error: function (error) {
	            	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
	            }
	        });
	}
	$("#btnDatHang").click(function(e) {
		
		 e.preventDefault();
		 var hoTen= $("#fullName").val();
		 var soDT = $("#numberPhone").val();
		 var email = $("#email").val();
		 var diaChi = $("#noinhan").val()+", "+
		 				$("#xaphuongthitran option:selected").text() +", "+
		 				$("#quanhuyen option:selected").text() +", "+
		 				$("#thanhpho option:selected").text();
		 var tongTien = $("#tongTien").text();
		 var userId = ${USERMODEL.id};
		 var data = {fullName: hoTen, numberPhone: soDT, email : email, address: diaChi, totalMoney: tongTien, userId :userId};
        
        $.ajax({
            url: '${APIBill}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	alert("Bạn đã đặt hàng thành công");
            	window.location.href = "${billDetail}"+result;
            },
            error: function (error) {
            	alert("Bạn đã  thất bại");
            	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
            }
        });
	});
	
</script>
</body>
</html>