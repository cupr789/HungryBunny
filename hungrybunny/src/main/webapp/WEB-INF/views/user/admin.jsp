<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${rPath}/css/button.css">
<script>
function adminHave(){
	var au = new AjaxUtil("${root}/shop/adminHave",null,"GET");
	au.send(callback);  
}
function callback(res){
	var str="";
    for(var i=0;i<res.spList.length;i++){
		 str+="<tr><td>"+ res.spList[i].shopName+"</td>"
		 +"<td>"+res.spList[i].shopAddress+"</td>"
		 +"<td>"+res.spList[i].shopHP+"</td>"
		 +"<td>"+ res.spList[i].shopTime+"</td>"
		 +"<td>"
		 +"<form action='${root}/adminRes/resInfo'><button name='shopNo' type='submit' value='"+res.spList[i].shopNo+"'>예약관리</button></form>"
		 +"<form action='${root}/shop/updateShop'><button name='updateShop' type='submit' value='"+res.spList[i].shopNo+"'>메뉴관리</button></form>"
		 +"<form action='${root}/adminRes/hallInfo' method='GET'><button name='shopNo' type='submit' value='"+res.spList[i].shopNo+"'>홀관리</button></form>"
		 +"<form action='${root}/review/reviewList' method='GET'><button name='shopNo' type='submit' value='"+res.spList[i].shopNo+"'>리뷰보기</button></form>"
		 +"</td></tr>";
		 	} 
	
 	
 	 	
	$("#shopName").html(
 	"<table class='table table-striped table-hover' style='width: 100%'>"+
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
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-4">
						<h2>가게리스트</h2>
					</div>
				</div>
			</div>
			
			<div id="shopName">
			</div>
			
		</div>
	</div>
</section>
</body>
</html>