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
	function validate() {
		var payCaNo = document.getElementById("payCaNo");
		var getInTime = document.getElementById("getInTime");
		//	alert('선택된 옵션 text 값=' + target.options[target.selectedIndex].text);     // 옵션 text 값
		//	alert('선택된 옵션 value 값=' + target.options[target.selectedIndex].value);

		if (payCaNo.options[payCaNo.selectedIndex].value == 0) {
			alert("결제방식을 선택해주세요");
			return false;
		}
		if (getInTime.options[getInTime.selectedIndex].value == 0) {
			alert("도착 예정 시간을 선택해주세요");
			return false;
		}
		var con_res = confirm("예약 시 환불이 불가능합니다. 예약하시겠습니까?");
		if (con_res == true) {
			return true;
		} else if (con_res == false) {
			alert("예약이 취소되었습니다.");
			location.reload();
			return false;
		}

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

		/* var msgObj = JSON.parse(event.data);
		alert(msgObj.msg); */
	}
	function onOpen(event) {
		//textarea.value += "연결 성공\n";
		alert("연결성공");
	}
	function onError(event) {
		alert(event.data);
	}
	function send() {
		var hallNo = $('input:radio[name="hallNo"]:checked').val();
		var menuNo = $("input[name='menuNo']");
		var menuPrice = $("input[name='menuPrice']");
		var selectCnt = $("select[name='resMenuCnt']");
		var menuPriceArr = [];
		var selectCntArr = [];
		var menuArr = [];
		for (var i = 0; i < menuNo.size(); i++) {
			menuArr[i] = menuNo[i].value;
			menuPriceArr[i] = menuPrice[i].value;
			selectCntArr[i] = selectCnt[i].value;
		}
		console.log(menuArr);
		console.log(menuPriceArr);
		console.log(selectCntArr);
		//webSocket.send(JSON.stringify(msg));
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
					<input type="radio" name="hallNo" value="${hallList.hallNo}">
				</c:when>
				<c:when test="${hallList.seatCnt eq '4'}">
					<img src="${rPath}/images/person_icon/people2.jpg"
						style="width: 30%;">
					<input type="radio" name="hallNo" value="${hallList.hallNo}">
				</c:when>
				<c:when test="${hallList.seatCnt eq '6'}">
					<img src="${rPath}/images/person_icon/people3.jpg"
						style="width: 30%;">
					<input type="radio" name="hallNo" value="${hallList.hallNo}">
				</c:when>
				<c:otherwise>
					<img src="${rPath}/images/person_icon/people4.jpg"
						style="width: 30%;">
					<input type="radio" name="hallNo" value="${hallList.hallNo}">
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
			<button type="button" value="send" onclick="send()">예약</button>
		</div>
	</section>
</body>
</html>