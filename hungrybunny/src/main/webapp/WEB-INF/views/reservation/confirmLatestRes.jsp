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
	console.log(res);
	var resList = res;
	for(var i=0;i<res.length;i++){
		if(res[i].currentStatus==1){
			resList.splice(i,1);
			i--;
		}
	}
	
	htmlStr = '';
	htmlStr += '<table class="table table-striped table-hover" style="width: 100%">';
	htmlStr += '<thead>';
	htmlStr += '<tr>'; 
	htmlStr += '<th>가게</th>';
	htmlStr += '<th>메뉴</th>';
	htmlStr += '<th>금액</th>';
	htmlStr += '<th>결제방식</th>';
	htmlStr += '<th>날짜</th>';
	htmlStr += '<th>리뷰남기기</th>';
	htmlStr += '</tr>';
	htmlStr += '</thead>';
	htmlStr += '<tbody>';
	
	if(res.length==0){
		htmlStr += '<tr><td>지난예약내역이 없습니다</tr></td>';
	}else{
		for(var i=0;i<res.length;i++){
			for(var j=0;j<i;j++){
				if(res[i].resDate==res[j].resDate){
					res[i].shopName = '';
					res[i].payPrice = '';
					res[i].payType = '';
					res[i].resDate = '';
				}
			}
		}
		console.log(res);
		for(var i=0;i<res.length;i++){
			htmlStr += '<tr>';
			htmlStr += '<td>'+res[i].shopName+'</td>';
			htmlStr += '<td>'+res[i].menuName+'</td>';
			htmlStr += '<td>'+res[i].payPrice+'</td>';
			htmlStr += '<td>'+res[i].payType+'</td>';
			htmlStr += '<td>'+res[i].resDate+'</td>';
			if(res[i].shopName==""){
				htmlStr += '<td></td>';
			}else{
				htmlStr += '<td><form method="POST" action="${pPath}/review/writeReview">'
				+ '<input type="hidden" name="resNo" value="'+res[i].resNo+'">'
				+ '<button name="shopNo" value="'+res[i].shopNo+'">리뷰남기러가기</button></form></td>';
			}
			htmlStr += '</tr>'; 
		}
		htmlStr += '</tbody>';
		htmlStr += '</table>';
	}
	$("#resList").html(htmlStr);
}
</script>
<body onload="confirmRes()">
<section class="section">
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-4">
						<h2>지난예약확인</h2>
					</div>
				</div>
			</div>
			
			<div id="resList">
			</div>
			
		</div>
	</div>
</section>
</body>
</html>