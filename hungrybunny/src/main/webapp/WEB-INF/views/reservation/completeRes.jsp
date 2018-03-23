<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function goConfirmRes(){
	location.href="${pPath}/reservation/confirmRes";
}
</script>
<body>
<section class="section">
<h1>예약이 완료되었습니다!</h1>
<button onclick="goConfirmRes()">예약확인</button>
</section>
</body>
</html>