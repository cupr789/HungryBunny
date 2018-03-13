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
		htmlStr += '<th>남은자리</th>';
		htmlStr += '<th>메뉴보기</th>';
		htmlStr += '</tr>';
		htmlStr += '<tbody>';
		for(var key in res){
			var shop = res[key];
			htmlStr += '<tr>';
			htmlStr += '<td>'+shop.shopName+'</td>';
			htmlStr += '<td>'+shop.shopAddress+'</td>';
			htmlStr += '<td>'+shop.shopHP+'</td>';
			htmlStr += '<td>'+shop.shopTime+'</td>';
			htmlStr += '<td></td>';
			htmlStr += '<td><button type="button" onclick="menuList('+shop.shopNo+')">Click Me!</button></td>';
			htmlStr += '</tr>';
		}
		htmlStr += '</tbody>';
		htmlStr += '</table>';
		htmlStr += '</div>';
		htmlStr += '<button type="button" onclick="backToCa()">카테고리로 돌아가기!</button>';
		console.log(htmlStr);
		$("#chToSTable").html(htmlStr)
	}
	
	function backToCa(){
		$("#chToSTable").css("display","none");
		$("#tagID").css("display","block");
	}
	
	function menuList(shopNo){
		var au = new AjaxUtil2("${root}/menu/menuList/"+shopNo,null,"POST");
		au.send(menuListCB);
	}
	function menuListCB(res){
		$("#chToSTable").css("display","none");
		var htmlStr = '';
		htmlStr += '<div class="container">';
		htmlStr += '<h1>메뉴리스트</h1>';
		htmlStr += '<table class="table table-bordered">';
		htmlStr += '<thead>';
		htmlStr += '<tr>'; 
		htmlStr += '<th>메뉴이름</th>';
		htmlStr += '<th>메뉴가격</th>';
		htmlStr += '<th>예약하기</th>';
		htmlStr += '</tr>';
		htmlStr += '<tbody>';
		for(var key in res){
			var menu = res[key];
			htmlStr += '<tr>';
			htmlStr += '<td>'+menu.menuName+'</td>';
			htmlStr += '<td>'+menu.menuPrice+'</td>';
			htmlStr += '<td></td>';
			htmlStr += '</tr>';
		}
		htmlStr += '</tbody>';
		htmlStr += '</table>';
		htmlStr += '</div>';
		htmlStr += '<button type="button" onclick="backToShop()">가게리스트로 돌아가기!</button>';
		$("#chToMTable").html(htmlStr);
	}
	
	function backToShop(){
		$("#chToMTable").css("display","none");
		alert("박혜진");
	}
</script>

<body onload="category()">
	<!-- portfolio grid section -->
	<section id="portfolio" class="section portfolio">
	<div id="chToMTable">
	<div id="chToSTable">
		<div id="tagID" class="container-fluid">
			<div class="row">
				
			</div>
		</div>
	</div>
	</div>
	</section>
	<!-- portfolio grid section -->
</body>
</html>