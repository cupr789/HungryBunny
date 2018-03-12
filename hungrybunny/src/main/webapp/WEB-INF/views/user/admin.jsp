<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function adminHave(){
	var au = new AjaxUtil("${root}/shop/adminHave",null,"GET");
	au.send(callback);  
}
function callback(res){
var str ="";
 	for(var i=0;i<res.spList.length;i++){  
		str += res.spList[0].shopName+",";
 	} 
	$("#shopName").html("<h1>"+str+"사장님환영합니다"+"</h1>");
	
}

</script>

<body onload="adminHave()">
<section class="section">
<div id="shopName"></div>

</section>
</body>
</html>