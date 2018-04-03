<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
var resList;
function confirmRes(){
	var updateMsg = "${msg}";
	var shopNo = "${shopNo}";
	var hallNo = "${hallNo}";
	var resDate = "${resDate}";
	if(updateMsg){
		alert(updateMsg);
		alert(shopNo);
		
		
		var webSocket = new WebSocket('ws://localhost/alarm');
		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};
		function onMessage(event) {
			
		}
		function onOpen(event) {
			
			console.log("연결성공");
			send();
			
		}
		function onError(event) {
			alert(event.data);
		}
		function send(){
			
 
			var param = {shopNo:shopNo};
			param = JSON.stringify(param); 
			
			$.ajax({
				url : "${root}/user/getAdminName",
				type : "POST",
				contentType : "application/json",
				data : param,	
				success : function(res) {
					var adminId = res.adminId;
					console.log(adminId);
					var msg = {"msg":"예약일시: ["+resDate+"]\n 테이블:[ "+hallNo+"번 ]\n 예약 취소가 들어왔습니다.","target":adminId};
			        webSocket.send(JSON.stringify(msg));
				}
			})
		     /*    var msg = {"msg":inputMessage.value,"target":targetId.value}
		        webSocket.send(JSON.stringify(msg)); */
		}
	}
	
	var au = new AjaxUtil2("${root}/res/confirmRes",null,"GET");
	au.send(test);
}

function test(res){
	console.log(res);
	resList = res;
	for(var i=0;i<res.length;i++){
		if(res[i].currentStatus==0){
			resList.splice(i,1);
			i--;
		}
	}

	var htmlStr = '';
	htmlStr += '<form action="${root}/res/cancleRes" method="post" onsubmit="return validate();">';
	htmlStr += '<table class="table table-striped table-hover" style="width: 100%">';
	htmlStr += '<thead>';
	htmlStr += '<tr>'; 
	htmlStr += '<th>가게</th>';
	htmlStr += '<th>메뉴</th>';
	htmlStr += '<th>금액</th>';
	htmlStr += '<th>결제방식</th>';
	htmlStr += '<th>날짜</th>';
	htmlStr += '</tr>';
	htmlStr += '<tbody>';
	
	if(res.length==0){
		htmlStr += '<tr><td>예약내역이 없습니다</tr></td>';
	}else{
		for(var i=0;i<res.length;i++){
			for(var j=0;j<i;j++){
				if(res[i].shopName==res[j].shopName){
					res[i].shopName = '';
					res[i].payPrice = '';
					res[i].payType = '';
					res[i].resDate = '';
				}
			}
		}
		var resNo = '';
		for(var i=0;i<res.length;i++){
			htmlStr += '<tr>';
			htmlStr += '<td>'+res[i].shopName+'</td>';
			htmlStr += '<td>'+res[i].menuName+'</td>';
			htmlStr += '<td>'+res[i].payPrice+'</td>';
			htmlStr += '<td>'+res[i].payType+'</td>';
			htmlStr += '<td>'+res[i].resDate+'</td>';
			htmlStr += '<input type="hidden" name="hallNo" value="'+res[i].hallNo+'">';
			htmlStr += '<input type="hidden" name="hallStatus" value="0">';
			htmlStr += '<input type="hidden" name="currentStatus" value="0">';
			htmlStr += '<input type="hidden" name="shopNo" value="'+res[i].shopNo+'">';
			htmlStr += '<input type="hidden" name="resDate" value="'+res[i].resDate+'">';
			htmlStr += '</tr>'; 
			var resNo = res[i].resNo;
		}
		htmlStr += '</tbody>';
		htmlStr += '</table>';
		htmlStr += '<button type="submit">예약취소</button>'
		htmlStr += '</form>';
	}
	$("#resList").html(htmlStr);
}

function validate(resNo){
	console.log(resNo);
	var check = confirm("정말로 취소하시겠습니까? 환불은 불가합니다.");
	if(check==true){
		return true;
	}else{
		return false;
	}
	/* if(check == true){
		var au = new AjaxUtil2("${root}/res/cancleRes/"+resNo,null,"POST");
		au.send(cancleRes);
	}
	if(check == false){
		return false;
	} */
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
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-4">
						<h2>예약확인</h2>
					</div>
				</div>
			</div>
			
			<div id="resList">
			</div>
			
			<button><a href="${pPath}/reservation/confirmLatestRes">지난 예약 보기</a></button>
			
		</div>
	</div>
</section>
</body>
</html>