<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product"/>
<c:url var ="ProductURL" value="/admin-product"/>
<c:url var="editURL" value="/admin-product?type=edit&id="></c:url>
<c:url var="HomeURL" value="/admin-home" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
</head>
<body>
	<div class="main-content">
		<form action='<c:url value="/admin-product"></c:url>' id="formSubmit"
			method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${HomeURL }">Trang chủ</a></li>
								<li>Danh sách sản phẩm</li>
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
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm bài viết' href='<c:url value="/admin-product?type=edit"/>'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa bài viết'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
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
											<th width="100">Ảnh đại diện</th>
											<th>Tên sản phẩm</th>
											<th>Mã số</th>
											<th>Giá</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${model.listResult}">
											<tr>
												<td align="center">
													<input type="checkbox" id="checkbox_${item.id}" value="${item.id}">
												</td>
												<td align="center">
													<img class="card-img-top" src="<c:url value='/image?id=${item.id}' />" width="50" height="50" alt="">
												</td>
												<td>${item.name}</td>
												<td>${item.code}</td>
												<td><fmt:formatNumber type="number" pattern="###,###.###" value="${item.price}" /> VNĐ</td>
												<td>
													<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
														title="Cập nhật bài viết" href='${editURL}${item.id}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
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
						$('#sortName').val("id");
						$('#sortBy').val("desc");
						$('#formSubmit').submit();
					}
				}
			});
		});
		$("#btnDelete").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function () {
	            return $(this).val();
	        }).get();
			data['ids'] = ids;
			deleteNew(data);
		});
		
		function deleteNew(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            success: function (result) {
	            	alert("Bạn đã xóa thành công");
	                window.location.href = "${ProductURL}?type=list&page=1&maxPageItem=4&sortName=id&sortBy=desc";
	            	
	            },
	            error: function (error) {
	            	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
	            }
	        });
	    }
	</script>
</body>
</html>