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
	var str="";
    for(var i=0;i<res.spList.length;i++){
		 str+="<tr><td>"+ res.spList[i].shopName+"</td>"+"<td>"+res.spList[i].shopAddress+"</td>"+"<td>"+res.spList[i].shopHP+"</td>"+"<td>"+ res.spList[i].shopTime+"</td>"+
		 "<td><form action='${root}/res/adminRes'><button name='adminRes' type='submit' value='"+res.spList[i].shopNo+"'><span class='glyphicon glyphicon-cutlery' aria-hidden='true'></span></button></form>"+
		 "<form action='${root}/shop/updateShop'><button name='updateShop' type='submit' value='"+res.spList[i].shopNo+"'><span class='glyphicon glyphicon-cog' aria-hidden='true'></span></button>"+
		 "</form></td></tr>";
		 	} 
	
 	
 	 	
	$("#shopName").html("<h2>가게리스트</h2>"+
 	"<table class='table table-bordered'>"+
	"<thead>"+
	"<tr>"+
	"<th>가게이름</th>"+
	"<th>주소</th>"+
	"<th>전화번호</th>"+
	"<th>운영시간</th>"+
	"<th>예약하기/정보수정</th></tr>"+  
    "</thead>"+  
    "<tbody class='tbody'>"+
   	str+
    "</tbody>"+ 
	"</table>"); 
	
}

</script>

<body onload="adminHave()">
<section class="section">
<div class="container">
<div id="shopName"></div>

</section>
</body>
</html>