<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$("#3").val()
function a(){
	alert("한식 눌렀어?");
	var id = document.getElementById("1");
	var shopNo = $(".col-sm-6").attr("id");
	
	/* var param ={shapCaNo:b}; */
	var au = new AjaxUtil("${root}/shop/shopList2/"+shopNo,null,"POST");
	au.send(exam);
	alert(b);
}

function exam(){
	alert("성공");
}

</script>
<body>
<!-- portfolio grid section -->
<section id="portfolio" class="section portfolio">
  <div class="container-fluid">
    <div class="row">
      <div id="1" class="col-sm-6 portfolio-item"> <a href="" class="portfolio-link"  onclick="a()" id="1">
        <div class="caption">
          <div class="caption-content">
            <h2 id="">한식</h2>
            <h4>Korean Food</h4>
          </div>
        </div>
        <img src="${rPath}/images/portfolio/hansik.jpg" class="img-responsive" alt=""> </a> </div>
      <div class="col-sm-6 portfolio-item"> <a href="work-details.html" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h2>중식</h2>
            <h4>Chinese Food</h4>
          </div>
        </div>
        <img src="${rPath}/images/portfolio/jungsik.jpg" class="img-responsive" alt=""> </a> </div>
    </div>
  </div>
</section>
<!-- portfolio grid section --> 
</body>
</html>