 
<%@page import="kr.co.rabbit.vo.ShopCaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function category() {
		var aufl = new AjaxUtilForList(".container-fluid>.row","${root}/shop/category", null, "GET");
		aufl.send();  
	}
	
	function caList(res) {
		console.log(res.caList);
		alert(res);
		
	}
</script>

<body onload="category()">
	<!-- portfolio grid section -->
	
	
	<section id="portfolio" class="section portfolio"> 
	<div class="container-fluid">
		<div class="row">
			
		</div>
	</div>


	</section>
	<!-- portfolio grid section -->
</body>
</html>