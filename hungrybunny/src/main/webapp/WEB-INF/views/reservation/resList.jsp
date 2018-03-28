<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Button Styles Inspiration</title>
<meta name="description"
	content="Some ideas for modern button styles and effects" />
<meta name="keywords"
	content="button, effect, hover, style, inspiration, web design" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="${rPath}/css/button/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="${rPath}/css/button/vicons-font.css" />
<link rel="stylesheet" type="text/css"
	href="${rPath}/css/button/base.css" />
<link rel="stylesheet" type="text/css"
	href="${rPath}/css/button/buttons.css" />
	
<script>


$(document).ready(function(){

	IMP.init('imp33735056');

});



	function validate(shopNo) {
		
		var payCaNo = document.getElementById("payCaNo");
		var getInTime = document.getElementById("getInTime");
		var hallNo = $('input:radio[name="hallNo"]:checked').val();
		var menuCnt = $("select[name='resMenuCnt']").val();
		if(hallNo==null){
			alert("자리를 선택해주세요.");
			return false;
		}else if(menuCnt==0){
			alert("메뉴 개수를 선택해주세요");
			return false;
		}else if (payCaNo.options[payCaNo.selectedIndex].value == 0) {
			alert("결제방식을 선택해주세요");
			return false;
		}else if (getInTime.options[getInTime.selectedIndex].value == 0) {
			alert("도착 예정 시간을 선택해주세요");
			return false;
		}
		
		var con_res = confirm("예약 시 환불이 불가능합니다. 예약하시겠습니까?");
		if (con_res == true) {
			send(shopNo);
		} else if (con_res == false) {
			alert("예약이 취소되었습니다.");
			location.reload();
			return false;
		}

	}
	
	function initParam(){
		
		var hallNo = $('input:radio[name="hallNo"]:checked').val();
		var menuNo = $("input[name='menuNo']");
		var menuPrice = $("input[name='menuPrice']");
		var menuCnt = $("select[name='resMenuCnt']");
		var payCaNo = $("select[name='payCaNo']").val();
		var getInTime = $("select[name='getInTime']").val();
		
		var menuPriceArr = [];
		var menuCntArr = [];
		var menuNoArr = [];
		console.log(menuNo[0].value);
		console.log(menuCnt);
		for (var i = 0; i < menuNo.size(); i++) {
			
				if (menuCnt[i].value != 0 && menuCnt[i].value != null) {
					menuNoArr[i] = menuNo[i].value;
					menuCntArr.push(menuCnt[i].value);
					menuPriceArr[i] = menuPrice[i].value;
				}
			

		}
		var param = {
				hallNo : hallNo,
				menuNoArr : menuNoArr,
				menuPriceArr : menuPriceArr,
				menuCntArr : menuCntArr,
				payCaNo : payCaNo,
				getInTime : getInTime,
			};
		
		return param;
	}


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
		console.log(event);
		var msgObj = JSON.parse(event.data);
		var allow = msgObj.msg;
		if (allow) {
/* 			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 14000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }

			    alert(msg);
			}); */
			
			
			
			param=JSON.stringify(initParam());
			console.log(param);
			
/*  			$.ajax({
				url: "${root}/res/askRes",
				contentType: "application/json",
				type:"POST",
				data: param,
				success: function(res){
					console.log(res);
					alert("예약이 성공하였습니다!");
				}
			})  */
			
			
		} else {
			alert("매장 사정에 의해 예약이 거부되었습니다.");
		}
	}
	function onOpen(event) {
		
		console.log("연결성공");
	}
	function onError(event) {
		alert(event.data);
	}
	
	function send(shopNo) {
		
 		console.log(shopNo);
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
				
				var hallNo = $('input:radio[name="hallNo"]:checked').val();
				var menuNo = $("input[name='menuNo']");
				var menuPrice = $("input[name='menuPrice']");
				var menuCnt = $("select[name='resMenuCnt']");
				var payCaNo = $("select[name='payCaNo']").val();
				var getInTime = $("select[name='getInTime']").val();

				var menuPriceArr = [];
				var menuCntArr = [];
				var menuNoArr = [];
				console.log(menuNo[0].value);
				console.log(menuCnt);
				for (var i = 0; i < menuNo.size(); i++) {
						if (menuCnt[i].value != 0 && menuCnt[i].value != null) {
							menuNoArr[i] = menuNo[i].value;
							menuCntArr.push(menuCnt[i].value);
							menuPriceArr[i] = menuPrice[i].value;
						}
				}
				var param = {
					hallNo : hallNo,
					menuNoArr : menuNoArr,
					menuPriceArr : menuPriceArr,
					menuCntArr : menuCntArr,
					payCaNo : payCaNo,
					getInTime : getInTime,
					target : adminId
				};

				param = JSON.stringify(param);
				ajaxTest(param);
			}
		})
		 

	}

	function ajaxTest(param) {
		$.ajax({
			url : "${root}/menu/getMenuName",
			type : "POST",
			contentType : "application/json",
			data : param,
			success : function(res) {
				param = JSON.parse(param);
				console.log(param.target);
				var msg = {
					"msg" : res.namesAndCnt,
					"target" : param.target,
					"hallNo" : param.hallNo
				};
				webSocket.send(JSON.stringify(msg));
			}
		})

	}
</script>
<body>
	<section class="section">
	<div class="container">
		<h2>예약하기</h2>
		<c:forEach items="${hallList}" var="hallList">
			<c:choose>
				<c:when test="${hallList.seatCnt eq '2'}">
					<img src="${rPath}/images/person_icon/people1.jpg"
						style="width: 30%;">
					<input type="radio" name="hallNo" value="${hallList.hallNo},${hallList.seatCnt}">
				</c:when>
				<c:when test="${hallList.seatCnt eq '4'}">
					<img src="${rPath}/images/person_icon/people2.jpg"
						style="width: 30%;">
					<input type="radio" name="hallNo" value="${hallList.hallNo},${hallList.seatCnt}">
				</c:when>
				<c:when test="${hallList.seatCnt eq '6'}">
					<img src="${rPath}/images/person_icon/people3.jpg"
						style="width: 30%;">
					<input type="radio" name="hallNo" value="${hallList.hallNo},${hallList.seatCnt}">
				</c:when>
				<c:otherwise>
					<img src="${rPath}/images/person_icon/people4.jpg"
						style="width: 30%;">
					<input type="radio" name="hallNo" value="${hallList.hallNo},${hallList.seatCnt}">
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<br>
		<c:forEach items="${menuList}" var="menuList" varStatus="idx">
				${menuList.menuName} (${menuList.menuPrice}원)
			<input type="hidden" name="menuNo" value="${menuList.menuNo}">
			<input type="hidden" name="menuPrice" value="${menuList.menuPrice}">
			<div class="form-group">
				<select class="form-control" name="resMenuCnt">
					<option value="0">개수를 선택해주세요</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			<br>
		</c:forEach>
		결제방식
		<div class="form-group">
			<select class="form-control" name="payCaNo" id="payCaNo">
				<option value="0">결제방식을 선택해주세요</option>
				<c:forEach items="${payCaList}" var="payCaList">
					<option value="${payCaList.payCaNo}">${payCaList.payType}</option>
				</c:forEach>
			</select>
		</div>
		<br> 도착예정시간
		<div class="form-group">
			<select class="form-control" name="getInTime" id="getInTime">
				<option value="0">도착 예정 시간을 선택해주세요</option>
				<option value="10">10분 안으로 도착</option>
				<option value="20">20분 안으로 도착</option>
				<option value="30">30분 안으로 도착</option>
			</select><br>
			<button type="button" value="send" onclick="validate(${shopNo})">예약</button>
		</div>
	</section>
</body>
</html>