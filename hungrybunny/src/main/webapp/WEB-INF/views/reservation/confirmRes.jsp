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
	var resList = res;
	for(var i=0;i<res.length;i++){
		if(res[i].currentStatus==0){
			resList.splice(i,1);
			i--;
		}
	}

	var htmlStr = '';
	
	if(res.length==0){
		htmlStr += '<h2>예약내역이 없습니다</h2>';
	}else{
		htmlStr += '<table class="table table-bordered">';
		htmlStr += '<thead>';
		htmlStr += '<tr>'; 
		htmlStr += '<th>가게</th>';
		htmlStr += '<th>메뉴</th>';
		htmlStr += '<th>금액</th>';
		htmlStr += '<th>결제방식</th>';
		htmlStr += '<th>날짜</th>';
		htmlStr += '</tr>';
		htmlStr += '<tbody>';
		for(var i=0;i<res.length;i++){
			for(var j=0;j<i;j++){
				if(res[i].shopName==res[j].shopName){
					res[i].shopName = '';
					res[i].payPrice = '';
					res[i].resMenuCnt = '';
					res[i].payType = '';
					res[i].resDate = '';
				}
			}
		}
		var resNo = '';
		for(var i=0;i<res.length;i++){
			htmlStr += '<tr>';
			htmlStr += '<td>'+res[i].shopName+'</td>';
			htmlStr += '<td>'+res[i].menuName+'('+res[i].menuPrice+'원) X'+res[i].resMenuCnt+'</td>';
			htmlStr += '<td>'+res[i].payPrice+'</td>';
			htmlStr += '<td>'+res[i].payType+'</td>';
			htmlStr += '<td>'+res[i].resDate+'</td>';
			htmlStr += '</tr>'; 
			var resNo = res[i].resNo;
		}
		htmlStr += '</tbody>';
		htmlStr += '</table>';
		htmlStr += '<button onclick="validate('+resNo+')">예약취소</button>'
	}
	$("#resList").html(htmlStr);
}

function validate(resNo){
	alert(resNo);
	var check = confirm("정말로 취소하시겠습니까?");
	if(check == true){
		var au = new AjaxUtil2("${root}/res/cancleRes/"+resNo,null,"POST");
		au.send(cancleRes);
	}
	if(check == false){
		return false;
	}
}

function cancleRes(res){
	if(res.result){
		alert(res.result);
		location.reload();
	}
}
</script>
<body onload="confirmRes()">
<section class="section">
	<div class="container">
	<h1>예약확인</h1>
		<div id="resList">
		</div>
		<button><a href="${pPath}/reservation/confirmRes2">지난 예약 보기</a></button>
	</div>
</section>
</body>
</html>