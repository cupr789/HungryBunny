<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function confirmRes(){
	alert("??");
	var au = new AjaxUtil2("${root}/res/confirmRes",null,"GET");
	au.send(test);
}
function test(res){
	alert("asdfa");
	$("#res").css("display","none");
	var htmlStr = '';
/*   	for(var i=0;i<res.length;i++){
		if(res[i].shopName==res[i+1].shopName){ //자리랑 가격
			htmlStr += '자리는 ' + res[i].seatCnt +'인석' + '<br>';
			htmlStr += '가격은 ' + res[i].payPrice + '<br>';
			alert(res[i].shopName); 
		}
		htmlStr += '개수는 ' + res[i].resMenuCnt + '<br>'; 
		htmlStr += '가게 ' + res[i].shopName + '<br>';
		htmlStr += '메뉴는 ' + res[i].menuName + '<br>';
	} */
		for(var key in res){
			var resList = res[key];
			htmlStr += '개수는 ' + resList.resMenuCnt + '<br>'; 
			htmlStr += '가게 ' + resList.shopName + '<br>';
			htmlStr += '자리는 ' + resList.seatCnt +'인석' + '<br>';
			htmlStr += '가격은 ' + resList.payPrice + '<br>';
			htmlStr += '메뉴는 ' + resList.menuName + '<br><br><br><br>';
		}
		htmlStr += '<button>예약취소</button><br><br><br><br>'
		$("#resList").html(htmlStr);
}
</script>
<body>
<section class="section">
<div id="resList">
<div id="res">
<h1>예약이 완료되었습니다!</h1>
<button onclick="confirmRes()">예약확인</button>
</div>
</div>
</section>
</body>
</html>