<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product" />
<c:url var="ProductURL" value="/admin-product?type=list&page=1&maxPageItem=4&sortName=id&sortBy=desc" />
<c:url var="HomeURL" value="/admin-home" />
<html>
<head>
<c:if test="${empty model.id}">
	<title>Thêm sản phẩm</title>
</c:if>
<c:if test="${not empty model.id}">
	<title>Cập nhật sản phẩm</title>
</c:if>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href='${HomeURL}'>Trang chủ</a></li>
					<li><i class="ace-icon fa fa-list-alt"></i> <a href="${ProductURL}">Danh sách sản phẩm</a></li>
						<c:if test="${empty model.id}">
							<li class="active">Thêm sản phẩm</li>		
						</c:if>
						<c:if test="${not empty model.id}">
							<li class="active">Cập nhật sản phẩm</li>		
						</c:if>
					
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
				<div class="col-xs-3">
					<img id="yourImgTag" class="img-thumbnail" width="233" height="311" src="<c:url value='/image?id=${model.id}' />">
				</div>
				<div class="col-xs-8">
						<div class="col-xs-12">
							<form method="post" action="<c:url value='/admin-upload'/>"
								enctype="multipart/form-data" id="formUpload">
	
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Ảnh
										đại diện</label>
									<div class="col-sm-9">
										<input type="file" name="inputFile" id="inputFile" />
										 <input type="hidden" name="imageId" id="imageId" value="">
									</div>	
								</div>
							</form>
						</div>
					
						<div class="col-xs-12">
							<form id="formSubmit">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Danh
										mục</label>
									<div class="col-sm-9">
										<select class="form-control" id="categoryId" name="categoryId">
											<option value="">Chọn loại danh mục</option>
											<c:forEach var="item" items="${categories.listResult}">
												<option value="${item.id}"
													<c:if test="${model.categoryId== item.id}">selected="selected"</c:if>>
													${item.name}</option>
											</c:forEach>
	
										</select>
									</div>
								</div>
								<br /> <br /> <br>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Tên
										sản phẩm</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="name" name="name" 
											value="${model.name}" />
									</div>
								</div>
								<br /> <br />
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Mã
										sản phẩm</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="code" name="code"
											value="${model.code}" />
									</div>
								</div>
								<br /> <br />
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Giá</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="price" name="price"
											value="${model.price}" />
									</div>
								</div>
								<br /> <br />
								<div class="form-group">
									<div class="col-sm-12">
										<c:if test="${not empty model.id}">
											<input type="button"
												class="btn btn-white btn-warning btn-bold"
												value="Cập nhật sản phẩm" id="btnAddOrUpdateProduct" />
										</c:if>
										<c:if test="${empty model.id}">
											<input type="button"
												class="btn btn-white btn-warning btn-bold"
												value="Thêm sản phẩm" id="btnAddOrUpdateProduct" />
										</c:if>
									</div>
								</div>
								<input type="hidden" value="${model.id}" id="id" name="id" />
	
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#btnAddOrUpdateProduct").click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});

			var id = $('#id').val();
			if (id == "") {
				addProduct(data);
			} else {
				updateProduct(data);
			}
		});
		function addProduct(data) {
			if($("#inputFile").val() == ""){
				alert("Bạn phải đặt ảnh cho sản phẩm");
				return;
			}
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					alert("Bạn đã thêm thành công ");
					$("#imageId").val(result);
					$("#formUpload").submit();
				},
				error : function(error) {
					alert("Bạn đã thêm thất bại");
					
				}
			});
		}
		function updateProduct(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					alert("Bạn đã cập nhật thành công");
					
					if($("#inputFile").val() != ""){
						$("#imageId").val(result);
						$("#formUpload").submit();						
					}
					else{
						window.location.href = "${ProductURL}";
					}
				},
				error : function(error) {
					alert("Bạn đã cập nhật thất bại");
					//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
				}
			});
		}
		$("#inputFile").change(function() {
			var input = document.getElementById("inputFile");			
			var fReader = new FileReader();
			fReader.readAsDataURL(input.files[0]);
			fReader.onloadend = function(event) {
				var img = document.getElementById("yourImgTag");
				img.src = event.target.result;
			}
		});
	</script>
</body>
</html>