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
</script>
<body>
<!-- portfolio grid section -->
<section id="portfolio" class="section portfolio">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-6 portfolio-item"> <a href="${pPath}/reservation/shop" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h2>한식</h2>
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
      <div class="col-sm-6 portfolio-item"> <a href="work-details.html" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h2>분식</h2>
            <h4>Snack Bar</h4>
          </div>
        </div>
        <img src="${rPath}/images/portfolio/work-3.jpg" class="img-responsive" alt=""> </a> </div>
      <div class="col-sm-6 portfolio-item"> <a href="work-details.html" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h2>일식</h2>
            <h4>Japanese Food</h4>
          </div>
        </div>
        <img src="${rPath}/images/portfolio/ilsik.jpg" class="img-responsive" alt=""> </a> </div>
      <div class="col-sm-6 portfolio-item"> <a href="work-details.html" class="portfolio-link" id="3" onclick="search(id)">
        <div class="caption">
          <div class="caption-content">
            <h2>양식</h2>
            <h4>Western food</h4>
          </div>
        </div>
        <img src="${rPath}/images/portfolio/work-5.jpg" class="img-responsive" alt=""> </a> </div>
      <div class="col-sm-6 portfolio-item"> <a href="work-details.html" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h2>야식</h2>
            <h4>Late-night Snack</h4>
          </div>
        </div>
        <img src="${rPath}/images/portfolio/work-6.jpg" class="img-responsive" alt=""> </a> </div>
    </div>
  </div>
</section>
<!-- portfolio grid section --> 
</body>
</html>