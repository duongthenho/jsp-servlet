<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var ="UserURL" value="/admin-user"/>
<c:url var="editURL" value="/admin-user?type=edit&id="></c:url>
<c:url var="HomeURL" value="/admin-home" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách tài khoản</title>
</head>
<body>
	<div class="main-content">
		<form action='<c:url value="/admin-user"></c:url>' id="formSubmit"
			method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${HomeURL }">Trang chủ</a></li>
								<li>Danh sách tài khoản</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
				<div class="row">
							<div class="col-xs-12">
								<c:if test="${not empty messageResponse}">
									<div class="alert alert-${alert}">
  										${messageResponse}
									</div>
								</c:if>
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<button type="button" class="btn btn-primary" id="btnUnlock">
													Mở khóa tài khoản
												</button>
												<button type="button" class="btn btn-warning" id="btnlock">
													Khóa tài khoản
												</button>
												<button type="button" class="btn btn-success" id="btnSetAdmin">
													Chọn làm quản trị</button>
												<button type="button" class="btn btn-danger" id="btnSetUser">
													Chọn làm người dùng
												</button>
											</div>
										</div>
									</div>
								</div>
								</div></div>
					<div class="row">
						<div class="col-xs-12">
							<div class="table-reponsive">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th width="50"></th>
											<th>Tên tài khoản</th>
											<th>Mật khẩu</th>
											<th>Họ và tên</th>
											<th>Số điện thoại</th>
											<th>Email</th>
											<th>Trạng thái</th>
											<th>Vai trò</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${model.listResult}">
											<tr>
												<td align="center">
													<input type="checkbox" id="checkbox_${item.id}" value="${item.id}">
												</td>
												<td>${item.userName}</td>
												<td>${item.password}</td>
												<td>${item.fullName}</td>
												<td>${item.numberPhone}</td>
												<td>${item.email}</td>
												<td>
													<c:if test="${item.status==1}">Hoạt động</c:if>
													<c:if test="${item.status!=1}">Đã khóa</c:if>
												</td>
												<td>${item.role.name}</td>
												<td>
													<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
														title="Cập nhật bài viết" href='${editURL}${item.id}'>
														<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
													</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<ul class="pagination" id="pagination"></ul>
								<input type="hidden" value="" id="type" name="type" />
								<input type="hidden" value="" id="page" name="page" /> 
								<input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
								<input type="hidden" value="" id="sortName" name="sortName" /> 
								<input type="hidden" value="" id="sortBy" name="sortBy" />
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- /.main-content -->
	<script type="text/javascript">
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		var limit = 4;
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if(currentPage != page){
						$('#maxPageItem').val(limit);
						$('#page').val(page);
						$('#type').val("list");
						$('#sortName').val("username");
						$('#sortBy').val("asc");
						$('#formSubmit').submit();
					}
				}
			});
		});
		$("#btnUnlock").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
	            return $(this).val();
	        }).get();
			data['ids'] = ids;
			data['type'] = "1";
			updateUser(data);
		});
		$("#btnlock").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
	            return $(this).val();
	        }).get();
			data['ids'] = ids;
			data['type'] = "2";
			updateUser(data);
		});
		$("#btnSetAdmin").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
	            return $(this).val();
	        }).get();
			data['ids'] = ids;
			data['type'] = "3";
			updateUser(data);
		});
		$("#btnSetUser").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
	            return $(this).val();
	        }).get();
			data['ids'] = ids;
			data['type'] = "4";
			updateUser(data);
		});
		
		function updateUser(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	alert("Bạn đã cập nhật thành công");
	                window.location.href = "${UserURL}?type=list&page=1&maxPageItem=4&sortName=username&sortBy=asc";
	            	
	            },
	            error: function (error) {
	            	alert("Bạn đã cập nhật thaast bai");
	            	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
	            }
	        });
	    }
	</script>
</body>
</html>