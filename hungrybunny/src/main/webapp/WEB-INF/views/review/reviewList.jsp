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
function reviewList(){
	var msg = "${msg}";
	if(msg){
		alert(msg);
	}
	var shopNo = "${shopNo}"
	var param = {shopNo : shopNo};
	
		$.ajax({
			url : "${root}/review/reviewList",
			type : "POST",
			data : param,
			success : function(res) {
				
			}
		})
}
</script>
<body>
<section class="section">
</section>
</body>
</html>