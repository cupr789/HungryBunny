<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
String shopNo = request.getParameter("shopNo");
%>
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
				<th>메뉴</th>
				<th>코멘트</th>
				<th>별점</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reviewList}" var="reviewList">
				<tr>
					<td>${reviewList.uiId}님</td>
					<td>${reviewList.menuName}</td>
					<td>${reviewList.reviewComment}</td>
					<td width="10%"><fieldset class="starability-basic"><input type="radio"/><label for="rate1"></label>
					<span>X${reviewList.reviewRating}</span></fieldset></td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>
</div>
</section>
</body>
</html>