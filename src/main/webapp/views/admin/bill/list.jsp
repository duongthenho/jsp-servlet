<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="HomeURL" value="/admin-home" />
<c:url var="APIurl" value="/api-admin-bill" />
<c:url var="BillstURL" value="/admin-bill?type=0&page=1&maxPageItem=3&sortName=id&sortBy=desc" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lí đơn hàng</title>
</head>
<body>
	<div class="main-content">
		<form action='<c:url value="/admin-bill"></c:url>' id="formSubmit"
			method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${HomeURL }">Trang chủ</a></li>
								<c:if test="${not empty Duyet }">
									<li>Đơn hàng chờ xác nhận</li>
								</c:if>
								<c:if test="${empty Duyet }">
									<li>Đơn hàng đang giao</li>
								</c:if>
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
								
								</div></div>
					<div class="row">
						<div class="col-xs-12">
							<div class="table-reponsive">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Thao tác</th>
											<c:if test="${not empty Duyet }">
												<th width="50">
													<button id="btnDuyet" type="button" class="btn btn-warning">Duyệt</button>
												</th>
											</c:if>
											<th>Mã đơn</th>
											<th width="100">Người đặt</th>
											<th width="300">Địa chỉ</th>
											<th>Số điện thoại</th>
											<th>Email</th>
											<th>Tổng tiền</th>
											<th>Trạng thái</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${model.listResult}">
											<tr>
												<td><b><a href='<c:url value="admin-detail-bill?id=${item.id}"></c:url>'>Xem chi tiết</a></b></td>
												<c:if test="${not empty Duyet }">
													<td align="center">
														<input type="checkbox" id="checkbox_${item.id}" value="${item.id}">
													</td>
												</c:if>
												<td>${item.id}</td>
												<td>${item.fullName}</td>
												<td>${item.address}</td>
												<td>${item.numberPhone}</td>
												<td>${item.email}</td>
												<td>${item.totalMoney}</td>
												<td>${item.status}</td>			
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
  		var type = ${model.type};
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
						$('#type').val(type);
						$('#sortName').val("id");
						$('#sortBy').val("desc");
						$('#formSubmit').submit();
					}
				}
			});
		});
		$("#btnDuyet").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
	            return $(this).val();
	        }).get();
			data['ids'] = ids;
			DuyetBill(data);
		});
		
		function DuyetBill(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	alert("Bạn đã duyệt thành công");
	                window.location.href = "${BillstURL}";
	            	
	            },
	            error: function (error) {
	            	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
	            }
	        });
	    }
	</script>
</body>
</html>