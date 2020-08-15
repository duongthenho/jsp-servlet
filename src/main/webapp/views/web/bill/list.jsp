<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%> 
<c:url var="APIurl" value="/api-bill" />
<c:url var="listbill" value='/list-bill?userId=${USERMODEL.id}' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách đơn hàng</title>
</head>
<body>
	<div class="col-lg-9">
	<br>
		<div class="row">
			<div class="col-10">
				<h3>Đơn hàng</h3>
			</div>
			<div class="col-2"></div>
		</div>
		<hr>
		<table class="table table-bordered">
				<thead>
					<tr>
						<th>Mã đơn hàng</th>
						<th>Trạng thái</th>
						<th>Thành tiền</th>
						<th>Thao tác</th>
						<c:if test="${not empty bills.listResult}">
						<th width="120px"><button id="btnDelete" type="button"
							class="btn btn-danger">Hủy đơn</button></th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${bills.listResult}">
						<tr>
							<td>${item.id}</td>
							<td>${item.status}</td>
							<td>${item.totalMoney}</td>
							<td><a href='<c:url value="/bill-detail?id=${item.id}"></c:url>'>Xem chi tiết</a></td>
							<td align="center"><input type="checkbox"
							id="checkbox_${item.id}" value="${item.id}"></td>
						</tr>
					</c:forEach>
					
					
						
				</tbody>
			</table>
	</div>
<script>
	$("#btnDelete").click(function() {
		var data = {};
		var ids = $('tbody input[type=checkbox]:checked').map(function () {
	        return $(this).val();
	    }).get();
		data['ids'] = ids;
		$.ajax({
	        url: '${APIurl}',
	        type: 'DELETE',
	        contentType: 'application/json',
	        data: JSON.stringify(data),
	        success: function (result) {
	        	alert("Bạn đã xóa thành công");
	            window.location.href = "${listbill}";
	        	
	        },
	        error: function (error) {
	        	//window.location.href = "${NewURL}?type=list&maxPageItem=2&page=1&message=error_system";
	        }
	    });
	});
</script>
</body>
</html>