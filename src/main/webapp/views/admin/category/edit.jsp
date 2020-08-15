<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="api-admin-category"/>
<c:url var="Categoryurl" value="admin-category"/>
<html>
<head>
<c:url var="HomeURL" value="/admin-home" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bảo trì danh mục</title>
</head>

<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="${HomeURL }">Trang chủ</a>
                </li>
                 <li>Danh sách danh mục</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row" >
                <div class="col-xs-2">
                 <br>
                   	<select  id="category" name="category" style="height:50px; width:175px;">
						<option value="null">__ Thêm danh mục __</option>
						<c:forEach var="item" items="${categories.listResult}">
							<option value="${item.id}, ${item.name}, ${item.code}"
								<c:if test="${model.categoryId== item.id}">selected="selected"</c:if>>
								${item.name}</option>
						</c:forEach>

					</select>
                </div>
                 <div class="col-xs-4">
                 Tên danh mục <input type="text" class="form-control" id="name" name="name" value="" /><br>
                 Mã danh mục <input type="text" class="form-control" id="code" name="code" value="" />
                 </div>
                 <div class="col-xs-4">
                 <br>
                 <button type="button" class="btn btn-primary" id="btnUpdateCategory" style="width:200px; display:none;">
					Cập nhật danh mục
				</button>
				<button type="button" class="btn btn-success" id="btnAddCategory" style="width:200px;">
					Thêm danh mục
				</button>
				<br><br>
				<button type="button" class="btn btn-danger" id="btnDeleteCategory" style="width:200px; display:none;">
					Xóa danh mục
				</button>
                 </div>
            </div>
        </div>
    </div>
</div><!-- /.main-content -->
<script>
	$(document).ready(function(){
			$("#btnUpdateCategory").hide();
			$("#btnDeleteCategory").hide();
			$("#btnAddCategory").show();
		  $("#category").change(function(){
		  		if($("#category").val() == "null"){
		  			$("#btnUpdateCategory").hide();
		  			$("#btnDeleteCategory").hide();
		  			$("#btnAddCategory").show();
		  			$("#name").val("");
		  			$("#code").val("");
		  		}
		  		else{
		  			$("#btnUpdateCategory").show();
		  			$("#btnDeleteCategory").show();
		  			$("#btnAddCategory").hide();
		  			var arrayData =  $("#category").val().split(', ');
		  			$("#name").val(arrayData[1]);
		  			$("#code").val(arrayData[2]);
		  		}
		  });
		  $("#btnAddCategory").click(function(){
			  var data = {};
			  
			  if($("#name").val()=="" || $("#code").val()==""||$("#name").val()==" "||$("#code").val()==" "){
				  alert("Bạn phải nhập thông tin cho danh mục");
				  return;
			  }
			  data['name'] = $("#name").val();
			  data['code'] = $("#code").val();
			  
			  $.ajax({
					url : '${APIurl}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Bạn đã thêm thành công");
						window.location.href = "${Categoryurl}";
					},
					error : function(error) {
						alert("Bạn đã thêm thất bại");
						
					}
				});
		  });
		  $("#btnUpdateCategory").click(function(){
			  var arrayData =  $("#category").val().split(', ');
			  var data = {};
			  data['id'] = arrayData[0];
			  data['name'] = $("#name").val();
			  data['code'] = $("#code").val();
			  $.ajax({
					url : '${APIurl}',
					type : 'PUT',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Bạn đã cập nhật thành công");
						window.location.href = "${Categoryurl}";
					},
					error : function(error) {
						alert("Bạn đã cập nhật thất bại");
						
					}
				});
		  });
		  $("#btnDeleteCategory").click(function(){
			  var arrayData =  $("#category").val().split(', ');
			  var data = {};
			  data['id'] = arrayData[0];
			  $.ajax({
					url : '${APIurl}',
					type : 'DELETE',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						alert("Bạn đã xóa thành công");
						window.location.href = "${Categoryurl}";
					},
					error : function(error) {
						alert("Bạn đã xóa thất bại");
						
					}
				});
		  });
	});
</script>
</body>
</html>