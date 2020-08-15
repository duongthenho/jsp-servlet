<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product"/>
<c:url var ="ProductURL" value="/admin-product"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Chỉnh sửa sản phẩm</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                        
                        <form id="formSubmit">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Danh mục</label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="categoryId" name="categoryId">                                   
                                            <option value="">Chọn loại danh mục</option>
                                             <c:forEach var="item" items="${categories.listResult}">
                                  	          	 <option value="${item.id}" <c:if test="${model.categoryId== item.id}">selected="selected"</c:if>>
                                             	 		${item.name}
                                             	 </option>
                                             </c:forEach>
                                        
                                    </select>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="image" name="image" value="${model.image}"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tên sản phẩm</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="name" name="name" value="${model.name}"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mã sản phẩm</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="code" name="code" value="${model.code}"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Giá</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="price" name="price" value="${model.price}"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <div class="col-sm-12">
                                     <c:if test="${not empty model.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật sản phẩm" id="btnAddOrUpdateProduct"/>
                                    </c:if>
                                    <c:if test="${empty model.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm sản phẩm" id="btnAddOrUpdateProduct"/>
                                    </c:if>
                                </div>
                            </div>
                            <input type="hidden" value="${model.id}" id="id" name="id"/>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

	  $("#btnAddOrUpdateProduct").click(function(e){
		  e.preventDefault();
	        var data = {};
	        var formData = $('#formSubmit').serializeArray();
	        $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
	        
	        var id = $('#id').val();
	        if (id == "") {
	            addNew(data);
	        } else {
	            updateNew(data);
	        }
	  });
	  function addNew(data) {
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
	    }
	  function updateNew(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	alert("Bạn đã cập nhật thành công");
	            	//window.location.href = "${NewURL}?type=edit&id="+result.id+"&message=update_success";
	            },
	            error: function (error) {
	            	alert("Bạn đã cập nhật thất bại");
	            	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
	            }
	        });
	    }

</script>
</body>
</html>