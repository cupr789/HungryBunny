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
<meta name="description" content="Some ideas for modern button styles and effects" />
<meta name="keywords" content="button, effect, hover, style, inspiration, web design" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="${rPath}/css/button/normalize.css" />
<link rel="stylesheet" type="text/css" href="${rPath}/css/button/vicons-font.css" />
<link rel="stylesheet" type="text/css" href="${rPath}/css/button/base.css" />
<link rel="stylesheet" type="text/css" href="${rPath}/css/button/buttons.css" />

<body>
<section class="section">
	<div class="container">
		<h2>예약하기</h2>
		<form action="${root}/res/askRes" method="POST">
			<c:forEach items="${hallList}" var="hallList">
				<c:choose>
					<c:when test="${hallList.seatCnt eq '2'}">
						<img src="${rPath}/images/person_icon/people1.jpg" style="width:30%;">
						<input type="radio" name="hallNo" value="${hallList.hallNo}">
					</c:when>
					<c:when test="${hallList.seatCnt eq '4'}">
						<img src="${rPath}/images/person_icon/people2.jpg" style="width:30%;">
						<input type="radio" name="hallNo" value="${hallList.hallNo}">
					</c:when>
					<c:when test="${hallList.seatCnt eq '6'}">
						<img src="${rPath}/images/person_icon/people3.jpg" style="width:30%;">
						<input type="radio" name="hallNo" value="${hallList.hallNo}">
					</c:when>
					<c:otherwise>
						<img src="${rPath}/images/person_icon/people4.jpg" style="width:30%;">
						<input type="radio" name="hallNo" value="${hallList.hallNo}">
					</c:otherwise>
				</c:choose>
			</c:forEach><br>
			<c:forEach items="${menuList}" var="menuList">
				${menuList.menuName}
				<input type="hidden" name="menuNo" value="${menuList.menuNo}">
				<input type="hidden" name="menuPrice" value="${menuList.menuPrice}">
				<select name="resMenuCnt">
					<option value="0">개수를 선택해주세요</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				(${menuList.menuPrice}원)<br>
			</c:forEach>
				결제방식
				<select name="payCaNo">
					<c:forEach items="${payCaList}" var="payCaList">
						<option value="${payCaList.payCaNo}">${payCaList.payType}</option>
					</c:forEach>
				</select><br>
			<button>예약</button>
		</form>
	</div>
</section>
</body>
</html>