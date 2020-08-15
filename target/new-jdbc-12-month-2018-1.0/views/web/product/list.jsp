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
				<c:forEach var ="item" items="${categories.listResult}">
	          		<c:if test ="${model.categoryId == item.id}">
	          			${item.name}
	          		</c:if>	
	        	 </c:forEach>
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
				
			<div class="row">
				<c:forEach var="item" items="${model.listResult}">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href='#'><img class="card-img-top"
								src="<c:url value='/template/codosaovang.png' />" alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href='<c:url value='/detail?id=${item.id}'/>'>${item.name} ${item.code}</a>

								</h4>
								<h5>${item.price}</h5>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
					<!-- /.row -->
				</c:forEach>
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