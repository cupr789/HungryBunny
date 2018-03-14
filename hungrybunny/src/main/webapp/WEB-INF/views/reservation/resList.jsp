<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
		<meta charset="UTF-8" />
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
<c:set value="${resListWithTwo}" var="cntVal"></c:set>
<section class="section">
	<div class="container">
			<section class="content">
				<h2>Antiman</h2>
				<div class="box bg-2">
					<button class="button button--antiman button--text-thick button--text-upper button--size-s button--inverted-alt button--round-s button--border-thick"></i><span>Add New</span></button>
					<button class="button button--antiman button--text-thick button--text-upper button--size-s button--inverted-alt button--round-s button--border-thick"></i><span>Locate</span></button>
				</div>
			</section>
	</div>
	${resList}<br>
	${resListWithTwo}<br>
	${resListWithFour}<br>
<c:forEach items="${resListWithTwo}" var="hall">
	${hall.seatCnt}<br>
</c:forEach>

	
<%-- 	<c:forEach items="${resListWithTwo}" var="item">
	    ${item.seatCnt}
	</c:forEach> --%>
</section>
</body>
</html>