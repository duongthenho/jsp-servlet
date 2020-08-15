<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thay đổi quảng cáo</title>
</head>
<body>
<div class="main-content">
	<c:if test="${not empty message }">
		<script type="text/javascript">
			alert("Bạn đã thay đổi thành công");
		</script>
	</c:if>
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href='<c:url value="/admin-home"></c:url>'>Trang chủ</a>
                </li>
                <li>Thay đổi quảng cáo</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row" >
                <div class="col-xs-12">
                    <form method="Post" action="<c:url value='/admin-upload'/>" enctype="multipart/form-data" id="formUpload">
						<table>
							<tr>
								<td width="200">Quảng cáo thứ nhất</td>
								<td width="500">
									<input type="file" name="inputFile1" id="inputFile1" />
									<img id="yourImgTag1" class="img-thumbnail" height="50%" width="50%" src="<c:url value='slideimage?col=image1' />"/>	
							
								</td>
								<td><input type="submit" value="Thay đổi"></td>
							</tr>
							<tr>
								<td>Quảng cáo thứ hai</td>
								<td>
									<input type="file" name="inputFile2" id="inputFile2" />
									<img id="yourImgTag2" class="img-thumbnail" height="50%" width="50%" src="<c:url value='slideimage?col=image2' />"/>	
							
								</td>
							</tr>
							<tr>
								<td>Quảng cáo thứ ba</td>
								<td>
									<input type="file" name="inputFile3" id="inputFile3" />
									<img id="yourImgTag3" class="img-thumbnail" height="50%" width="50%" src="<c:url value='slideimage?col=image3' />"/>	
							
								</td>
							</tr>
											
							
							 
						</table>
						
					</form>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.main-content -->
<script>
	$("#inputFile1").change(function() {
		var input = document.getElementById("inputFile1");			
		var fReader = new FileReader();
		fReader.readAsDataURL(input.files[0]);
		fReader.onloadend = function(event) {
			var img = document.getElementById("yourImgTag1");
			img.src = event.target.result;
		}
	});
	$("#inputFile2").change(function() {
		var input = document.getElementById("inputFile2");			
		var fReader = new FileReader();
		fReader.readAsDataURL(input.files[0]);
		fReader.onloadend = function(event) {
			var img = document.getElementById("yourImgTag2");
			img.src = event.target.result;
		}
	});
	$("#inputFile3").change(function() {
		var input = document.getElementById("inputFile3");			
		var fReader = new FileReader();
		fReader.readAsDataURL(input.files[0]);
		fReader.onloadend = function(event) {
			var img = document.getElementById("yourImgTag3");
			img.src = event.target.result;
		}
	});
</script>
</body>
</html>