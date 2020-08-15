<%@page import="com.laptrinhjavaweb.model.CategoryModel"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-lg-3">

        <h1 class="my-4">ZIO.VN</h1>
        <div class="list-group">
          <a href="<c:url value="/trang-chu#newProducts" ></c:url>" class="list-group-item active">SẢN PHẨM MỚI NHẤT</a>
          
          
         <c:forEach var ="item" items="${categories.listResult}">
          		<a href='<c:url value="product?categoryId=${item.id}&page=1&maxPageItem=3&sortName=code&sortBy=desc" ></c:url>' class="list-group-item">
          			${item.name}
          		</a>
         </c:forEach>
          

          
        </div>

      </div>
      <!-- /.col-lg-3 -->