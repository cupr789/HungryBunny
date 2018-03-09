<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function shopList(){
	var au = new AjaxUtil("${root}/shop/shopList",null,"post");
	au.send(shopListCB); 
}

function shopListCB(res){
	console.log(res.shopList);
	var list = res.shopList;
	var str = "";
	
	for(var listOne of list){
		str += "<tr><td>" + listOne.shopName + "</td></tr>"
		
	}
	$("#result_tb").html(str);
	
}
</script>
<body onload="shopList()">
<section class="section">
<table border='1'>
	<thead>
		<tr>
			<th>
			식당이름
			</th>
		</tr>
	</thead>
	<tbody id="result_tb">
	</tbody>
</table>
</section>
</body>
</html>