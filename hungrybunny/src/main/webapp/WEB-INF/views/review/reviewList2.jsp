<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script>
function alertMsg(){
	var msg = "${msg}";
	if(msg){
		alert(msg);
	}
}
</script>
<body onload="alertMsg()">
<section class="section">
<div class="container">
	<table class="table table-bordered" style="width:100%">
		<thead>
			<tr>
				<th>ID</th>
				<th>사진</th>
				<th>메뉴</th>
				<th>코멘트</th>
				<th>별점</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reviewList}" var="reviewList">
				<tr>
					<td><div class="w3-xxxlarge"><i class="glyphicon glyphicon-user"></i></div>${reviewList.uiId}</td>
					<td><img src="D:\iot_study\server\apache-tomcat-8.5.23\tmpFiles\${reviewList.reviewImageName}" width="100"></td>
					<td>${reviewList.menuName}</td>
					<td>${reviewList.reviewComment}</td>
					<td width="15%">
					<fieldset class="starability-basic">
					<c:forEach begin="1" end="${reviewList.reviewRating}">
					<input type="radio"/><label for="rate1"></label>
					</c:forEach>
					</fieldset>
					</td>
					<td>${reviewList.resDate}</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>
			<c:forEach items="${reviewList}" var="reviewList">
			
			</c:forEach>
</div>
</section>
</body>
</html>