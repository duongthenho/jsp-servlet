<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>

   
    <link href="<c:url value='/template/web/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" media="all"/>
    <link href="<c:url value='/template/web/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>
	<script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>
    <script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script> 
   <script type='text/javascript' src='<c:url value="/template/icon/kit.fontawesome.js" />'></script>
    
    
    

</head>
<body>
	<!-- header -->
    <%@ include file="/common/web/header.jsp" %>
    <!-- header -->
    
    <div class="container">
     	<div class="row">
     	 <%@ include file="/common/web/menu.jsp" %>
    		<dec:body/>
    	</div>
    </div>

	<!-- footer -->
	<%@ include file="/common/web/footer.jsp" %>
	<!-- <script type="text/javascript" src="<c:url value='/template/web/jquery/jquery.min.js' />"></script>-->
	
    <script type="text/javascript" src="<c:url value='/template/web/bootstrap/js/bootstrap.bundle.min.js' />"></script>
    
    
</body>
</html>