<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="com.laptrinhjavaweb.model.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
        ProductModel a = (ProductModel)request.getAttribute("model");
        Blob blob = a.getImage();
        byte byteArray[] = blob.getBytes(1, (int)blob.length());
        response.setContentType("image/gif");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
        %>
</body>
</html>