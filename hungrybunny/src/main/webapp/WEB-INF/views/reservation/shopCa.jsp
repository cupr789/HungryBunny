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
	
	function goShopList(){
		var shopCaNo = $(".한식").attr("id");
		var au = new AjaxUtil2("${root}/shop/shopList/"+shopCaNo, null, "POST");
		au.send(exam);
	}
	
	function exam(){
		$("#tagID").css("display","none");
		var chToTable = document.getElementById("chToTable");
 		chToTable.innerHTML = '';
		chToTable.innerHTML += '<div class="container" style="position: absolute;">';
		chToTable.innerHTML += '<h1>가게리스트</h1>';
		chToTable.innerHTML += '<table class="table table-bordered">';
		chToTable.innerHTML += '<thead>';
		chToTable.innerHTML += '<tr>'; 
		chToTable.innerHTML += '<th>가게이름</th>';
		chToTable.innerHTML += '<th>주소</th>';
		chToTable.innerHTML += '<th>전화번호</th>';
		chToTable.innerHTML += '<th>운영시간</th>';
		chToTable.innerHTML += '<th>예약하기</th>';
		chToTable.innerHTML += '</tr>';
	}
</script>

<body onload="category()">
	<!-- portfolio grid section -->
	<section id="portfolio" class="section portfolio">
	<div id="chToTable">
		<div id="tagID" class="container-fluid">
			<div class="row">
				
			</div>
		</div>
	</div>
	</section>
	<!-- portfolio grid section -->
</body>
</html>