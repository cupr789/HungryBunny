<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${rPath}/css/button.css">
<style>
button{
	width: 200px;
}
</style>
<script >
</script>
<body>
<section class="section">
<h1>리뷰 작성 완료!</h1>
	<form action="${root}/review/reviewList" method="GET">
		<button name="shopNo" value="${shopNo}">전체 리뷰 보기</button>
	</form>
</section>
</body>
</html>