<%@page import="com.laptrinhjavaweb.model.ProductModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%> 
    <c:url var="APIurl" value="/api-cart"/>
    <c:url var="Carturl" value="/cart"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
</head>
<body>
      <div class="col-lg-9">
		
        <div class="card mt-4">
        <form id="formSubmit">
        	<div class="row">
        	<div class="col-lg-6">
	          <img class="card-img-top img-fluid" src="<c:url value='/image?id=${model.id}' />" style="width:402; height = 536; " alt="">				
	          </div>
	          <div class="col-lg-6">
	          <div class="card-body">
	            <h3 class="card-title">${model.name}</h3>
	            
	            <div class="row">
	            	<div class="col-lg-3">
		            	<p>Mã số</p><hr>
		            	<p>Size</p><hr>
		            	<p>Màu sắc</p><hr>
		            	<p style="margin-top: 20px; margin-bottom: 20px;">Số lượng</p><hr>
		            	<p>Giá</p><hr>
	            	</div>
	            	<div class="col-lg-1">
		            	<p>|</p><hr>
		            	<p>|</p><hr>
		            	<p>|</p><hr>
		            	<p>|</p><hr>
		            	<p>|</p><hr>
	            	</div>
	            	<div class="col-lg-8">
		            	<p>${model.code}</p><hr>
		            	<p>Size</p><hr>
		            	<p>Màu sắc</p><hr>
		            	<p><input type="number"value="1" id="amount" name="amount" min="1" max="5"></p><hr>
		            	<h4 style="color:red;"> <fmt:formatNumber type="number" pattern="###,###.###"
								value="${model.price}" /> VNĐ</h4><hr>
	            	</div>
	            </div>
	            
	           	<button type="button" id="btnDatHangNgay" class="btn btn-primary" style="width: 100;">Đặt hàng ngay</button>
	           	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	           	<button id="btnAddCart" type="button" class="btn btn-info">Thêm vào giỏ hàng</button><br>
	            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
	            4.0 stars
	          </div>
	          </div>
	          </div>
	          <input type="hidden" name="userId" value="${USERMODEL.id}">
	          	          <input type="hidden" name="productId" value="${model.id}">
	          	           
	          </form>
        </div>
        <!-- /.card -->

        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Product Reviews
          </div>
          <div class="card-body">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <a href="#" class="btn btn-success">Leave a Review</a>
          </div>
        </div>
        <!-- /.card -->
       
      </div>
      <!-- /.col-lg-9 -->
 <script>
 $("#btnAddCart").click(function(e){
	  e.preventDefault();
       var data = {};
       var formData = $('#formSubmit').serializeArray();
       $.each(formData, function (i, v) {
           data[""+v.name+""] = v.value;
       });
       $.ajax({
           url: '${APIurl}',
           type: 'POST',
           contentType: 'application/json',
           data: JSON.stringify(data),
           dataType: 'json',
           success: function (result) {
           	alert("Bạn đã thêm thành công");
           	//window.location.href = "${NewURL}?type=edit&id="+result.id+"&message=insert_success";
           },
           error: function (error) {
           	alert("Bạn đã thêm thất bại");
           	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
           }
       });
      });
 $("#btnDatHangNgay").click(function(e){
	  e.preventDefault();
      var data = {};
      var formData = $('#formSubmit').serializeArray();
      $.each(formData, function (i, v) {
          data[""+v.name+""] = v.value;
      });
      $.ajax({
          url: '${APIurl}',
          type: 'POST',
          contentType: 'application/json',
          data: JSON.stringify(data),
          dataType: 'json',
          success: function (result) {
          	alert("Bạn đã thêm thành công");
          	window.location.href = "${Carturl}";
          },
          error: function (error) {
          	alert("Bạn đã thêm thất bại");
          	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
          }
      });
     });
 </script>
</body>
</html>