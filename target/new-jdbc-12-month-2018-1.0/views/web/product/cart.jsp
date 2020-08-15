<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-9">
		<br>
		<div class="row">
			<div class="col-6">
			<h3>
				Giỏ hàng
			</h3>
			</div>
			<div class="col-6">
				<ul class="pagination" id="pagination"></ul>

			</div>
		</div>
		<hr>
		<form action='<c:url value="/product"></c:url>' id="formSubmit"
			method="get">
				<input type="hidden" value="" id="categoryId" name="categoryId" />
				<input type="hidden" value="" id="page" name="page" /> 
				<input type="hidden" value="" id="maxPageItem" name="maxPageItem" />
				 <input type="hidden" value="" id="sortName" name="sortName" /> 
				<input type="hidden" value="" id="sortBy" name="sortBy" />
				
			<table class="table table-bordered">
									<thead>
										<tr>
											<th>Ảnh</th>
											<th>Sản phẩm</th>
											
											<th>Mã số</th>
											<th>Giá</th>
										</tr>
									</thead>
									<tbody>					
											<tr>
												<td>aa</td>
												<td>AA</td>
												<td>aa</td>
												<td>aa</td>
											</tr>
									</tbody>
								</table>
	     	<h3>
				Thực hiện đặt hàng
			</h3>
			<hr>
			<div class="row">
	                <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
	                <div class="col-sm-9">
	                    <input type="text" class="form-control" id="image" name="image" value="${model.image}"/>
	                </div>
	                <br>
	                <br>
	                <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
	                <div class="col-sm-9">
	                    <input type="text" class="form-control" id="image" name="image" value="${model.image}"/>
	                </div>
	                <br>
	                <br>
	                <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
	                <div class="col-sm-9">
	                    <input type="text" class="form-control" id="image" name="image" value="${model.image}"/>
	                </div>
	                <br>
	                <br>
	                <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
	                <div class="col-sm-9">
	                    <input type="text" class="form-control" id="image" name="image" value="${model.image}"/>
	                </div>
	                 <br>
	                <br>
	                 <br>
	                <br>
	                <button  type="button" class="btn btn-primary">Primary</button>
			</div>
			
		</form>
	</div>

	<script type="text/javascript">
	var totalPages = ${model.totalPage};
	var currentPage = ${model.page};
	var categoryId = ${model.categoryId};
	var limit = 3;
	$(function() {
		window.pagObj = $('#pagination').twbsPagination({
			totalPages : totalPages,
			visiblePages : 4,
			startPage : currentPage,
			onPageClick : function(event, page) {
				if(currentPage != page){
					$('#categoryId').val(categoryId);
					$('#page').val(page);
					$('#maxPageItem').val(limit);
					$('#sortName').val("code");
					$('#sortBy').val("desc");
					$('#formSubmit').submit();
				}
			}
		});
	});
	</script>
</body>
</html>