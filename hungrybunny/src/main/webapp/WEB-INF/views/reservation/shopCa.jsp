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
	
	function goShopList(shopCaNo){
		var au = new AjaxUtil2("${root}/shop/shopList/"+shopCaNo, null, "POST");
		au.send(shopListCB); 
	}
	
	function shopListCB(res){
		$("#tagID").css("display","none");
		var htmlStr = '';
		htmlStr += '<div class="container">';
		htmlStr += '<h1>가게리스트</h1>';
		htmlStr += '<table class="table table-bordered">';
		htmlStr += '<thead>';
		htmlStr += '<tr>'; 
		htmlStr += '<th>가게이름</th>';
		htmlStr += '<th>주소</th>';
		htmlStr += '<th>전화번호</th>';
		htmlStr += '<th>운영시간</th>';
		htmlStr += '<th>예약하기</th>';
		htmlStr += '</tr>';
		htmlStr += '<tbody>';
		for(var key in res){
			var shop = res[key];
			htmlStr += '<tr>';
			htmlStr += '<td>'+shop.shopName+'</td>';
			htmlStr += '<td>'+shop.shopAddress+'</td>';
			htmlStr += '<td>'+shop.shopHP+'</td>';
			htmlStr += '<td>'+shop.shopTime+'</td>';
			htmlStr += '<td>'+'</td>';
			htmlStr += '</tr>';
		}
		htmlStr += '</tbody>';
		console.log(htmlStr);
		$("#chToTable").html(htmlStr)
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