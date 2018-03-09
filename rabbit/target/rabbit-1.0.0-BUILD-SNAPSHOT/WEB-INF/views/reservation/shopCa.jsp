<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function category(){
	var au = new AjaxUtil("${root}/shop/category", null, "POST");
	au.send(caList());
}
function caList(res){
	console.log(res);
	
	alert("까꾸웅?");
}
</script>

<body onload="category()">
<!-- portfolio grid section -->
<section id="portfolio" class="section portfolio">

${caList}

<div class="container-fluid">
    <div class="row"> 
		<c:forEach items="${caList}" var="ca">
			<div class="col-sm-6 portfolio-item"> <a href="${pPath}/reservation/shop" class="portfolio-link">
				<div class="caption">
					<div class="caption-content">
						<h2>${ca.shopCaNo}. ${ca.shopCaName}</h2>
					</div>
				</div>
			<img src="${rPath}/images/portfolio/hansik.jpg" class="img-responsive" alt=""> </a> </div>
		</c:forEach>
	</div>
</div>

  
</section>
<!-- portfolio grid section --> 
</body>
</html>