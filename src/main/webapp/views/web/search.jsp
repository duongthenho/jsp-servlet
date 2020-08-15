<%@page import="com.laptrinhjavaweb.model.ProductModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
</head>
<body>
  
      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
		<h2 id="#newProducts">Kết quả cho: <span style="color:red;"><c:out value="${key}"></c:out></span> </h2>
		<hr>
        <div class="row">
        	<c:forEach var="item" items="${model.listResult}">	
		          <div class="col-lg-4 col-md-6 mb-4">
		            <div class="card h-100">
			              <a href='<c:url value="/detail?id=${item.id}" ></c:url>'>
			              	<img class="card-img-top" src="<c:url value='/image?id=${item.id}' />"  width="233" height="311" alt="">
			              </a>
		              <div class="card-body">
		                <h4 class="card-title">
		                  <a href='<c:url value="/detail?id=${item.id}" ></c:url>'>${item.name} ${item.code}</a>
		                 
		                 </h4>
		                <h5><fmt:formatNumber type="number" pattern="###,###.###"
								value="${item.price}" /> VNĐ</h5>
		              </div>
		              <div class="card-footer">
		                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
		              </div>
		            </div>
		          </div>
         	 </c:forEach>
          
         

          
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->
      </div>

</body>
</html>