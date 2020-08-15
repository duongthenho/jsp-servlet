<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-user" />
<c:url var="UserURL" value="/admin-user?type=list&page=1&maxPageItem=4&sortName=username&sortBy=asc" />
<c:url var="HomeURL" value="/admin-home" />
<html>
<head>


	<title>Cập nhật tài khoản</title>

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
					<li><i class="ace-icon fa fa-list-alt"></i> <a href="${UserURL}">Danh sách tài khoản</a></li>
							<li class="active">Cập nhật tài khoản</li>		
					
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					
						<div class="col-xs-12">
							<form id="formSubmit">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Tên tài khoản</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="userName" name="userName" 
											value="${model.userName}" />
									</div>
								</div>
								<br /> <br /> <br>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Mật khẩu</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="password" name="password" 
											value="${model.password}" />
									</div>
								</div>
								<br /> <br />
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Họ và tên</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="fullName" name="fullName"
											value="${model.fullName}" />
									</div>
								</div>
								<br /> <br />
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Số điện thoại</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="numberPhone" name="numberPhone"
											value="${model.numberPhone}" />
									</div>
								</div>
								<br /> <br />
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Email</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="email" name="email"
											value="${model.email}" />
									</div>
								</div>
								<br /> <br />
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
									<div class="col-sm-9">
										<label class="ontrol-label no-padding-right">
											<c:if test="${model.status==1}">Hoạt động</c:if>
											<c:if test="${model.status!=1}">Đã khóa</c:if>
										</label>
									</div>
								</div>
								<br /> <br />
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">Vai trò</label>
									<div class="col-sm-9">
										<label class="ontrol-label no-padding-right">
											${model.role.name}
										</label>
									</div>
								</div>
								<br /> <br />
								<div class="form-group">
									<div class="col-sm-12">
										
											<input type="button"
												class="btn btn-white btn-warning btn-bold"
												value="Cập nhật tài khoản" id="btnUpdateUser" />
										
									</div>
								</div>
								<input type="hidden" value="${model.id}" id="id" name="id" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script>
		$("#btnUpdateUser").click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			var id = $('#id').val();
				updateUser(data);
		});
		
		function updateUser(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					alert("Bạn đã cập nhật thành công");
				},
				error : function(error) {
					alert("Bạn đã thêm thất bại");
					
				}
			});
		}

	</script>
</body>
</html>