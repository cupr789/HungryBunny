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
		var searchAddr = "${address}";
		alert(searchAddr);
		alert(shopCaNum);
		var param = {searchAddr:searchAddr,shopCaNum:shopCaNum};
		//param=JSON.stringify(param);
		console.log(param);
	 	/* var au = new AjaxUtil2("${root}/map/selectMap",param,"POST");
		au.send(callback);   */
		$.ajax({
			url: "${root}/map/selectMap",
			type:"POST",
			data: param,
			success: function(res){
				alert("sds");
			}
		})
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