<%@page import="com.laptrinhjavaweb.model.ProductModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <div class="col-lg-9">
		<%
			ProductModel a = (ProductModel)request.getAttribute("model");
		%>
        <div class="card mt-4">
        	<div class="row">
        	<div class="col-lg-6">
	          <img class="card-img-top img-fluid" src="<c:url value='/template/codosaovang.png' />" alt="">
	          </div>
	          <div class="col-lg-6">
	          <div class="card-body">
	            <h3 class="card-title"><%=a.getName()%></h3>
	            <h4><%=a.getPrice()+" VNĐ" %></h4>
	            <div class="row">
	            	<div class="col-lg-3">
		            	<p>Mã số</p><hr>
		            	<p>Size</p><hr>
		            	<p>Màu sắc</p><hr>
		            	<p>Số lượng</p><hr>
	            	</div>
	            	<div class="col-lg-1">
		            	<p>|</p><hr>
		            	<p>|</p><hr>
		            	<p>|</p><hr>
		            	<p>|</p><hr>
	            	</div>
	            	<div class="col-lg-8">
		            	<p><%=a.getCode() %></p><hr>
		            	<p>Size</p><hr>
		            	<p>Màu sắc</p><hr>
		            	<p>Số lượng</p><hr>
	            	</div>
	            </div>
	            
	           	<button type="button" class="btn btn-primary">Đặt ngày, giao tận nơi</button>
	           	<button type="button" class="btn btn-info">Thêm vào giỏ hàng</button>
	            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
	            4.0 stars
	          </div>
	          </div>
	          </div>
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
 
</body>
</html>