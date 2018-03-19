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
	var au = new AjaxUtil2("${root}/res/confirmRes",null,"GET");
	au.send(test);
}
function test(res){
	var htmlStr = '';
	htmlStr += '<div class="container">';
	htmlStr += '<h1>예약확인</h1>';
	htmlStr += '<table class="table table-bordered">';
	htmlStr += '<thead>';
	htmlStr += '<tr>'; 
	htmlStr += '<th>가게</th>';
	htmlStr += '<th>메뉴</th>';
	htmlStr += '<th>자리</th>';
	htmlStr += '<th>금액</th>';
	htmlStr += '<th></th>';
	htmlStr += '</tr>';
	htmlStr += '<tbody>';
	htmlStr += '<tr>';
	htmlStr += '<td>' + res[0].shopName + '</td>';
	htmlStr += '<td>';
	for(var key in res){
		var resList = res[key];
		htmlStr += resList.menuName + '('+resList.menuPrice+'원) X '+ resList.resMenuCnt + '<br>';
	}
	htmlStr += '</td>';
	htmlStr += '<td>' + resList.seatCnt +'인석' + '</td>';
	htmlStr += '<td>' + resList.payPrice + '</td>';
	htmlStr += '<td><button>예약취소</button></td>';
	htmlStr += '</tr>';
	$("#resList").html(htmlStr);
}
</script>
<body onload="confirmRes()">
<section class="section">
<div id="resList">
</div>
</section>
</body>
</html>