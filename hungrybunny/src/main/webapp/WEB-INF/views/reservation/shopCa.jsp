<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lLWN_ojJYVj9L7235_lg&submodules=geocoder"></script>
</head>
<script>
	function category() {
		var aufl = new AjaxUtilForList(".container-fluid>.row","${root}/shop/category", null, "GET");
		aufl.send();  
	}
	var shopCaNum;
	function goShopList(shopCaNo){
		shopCaNum=shopCaNo;
		var au = new AjaxUtil2("${root}/shop/shopList/"+shopCaNo, null, "POST");
		au.send(shopListCB); 
	}
	function shopListCB(res){
		var searchAddr = "${keyword}";
		alert(searchAddr);
		alert(shopCaNum);
	/* 	var param = {searchAddr:searchAddr,shopCaNum:shopCaNum};
		//param=JSON.stringify(param);
		console.log(param);
		$.ajax({
			url: "${root}/map/selectMap",
			type:"POST",
			data: param,
			success: function(res){
				location.href="firstMap.jsp";
			}
		}) */
		location.href="${root}/path/map/firstMap?keyword="+searchAddr+"&shopCaNo="+shopCaNum;
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
			htmlStr += '<td><form action="${root}/res/checkOption" method="get"><button name="shopNo" value="'+menu.shopNo+'">예약하기</button></form></td>';
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
	function callback(res){
		alert("컨트롤러 찍고옴!!");
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