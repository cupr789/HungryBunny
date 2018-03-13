<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<script type="text/javascript">
	/* 	function goNaverMap(){
	 var str = $("#address").val();
	
	 var param = "address";
	 var au = new AjaxUtil("${root}/map/mapList",param,"POST");
	 au.send();
	 }
	 */
</script>
</head>

<style>
#custom-search-input {
	padding: 3px;
	border: solid 1px #E4E4E4;
	border-radius: 6px;
	background-color: #fff;
}

#custom-search-input input {
	border: 0;
	box-shadow: none;
}

#custom-search-input button {
	margin: 2px 0 0 0;
	background: none;
	box-shadow: none;
	border: 0;
	color: #666666;
	padding: 0 8px 0 10px;
	border-left: solid 1px #ccc;
}

#custom-search-input button:hover {
	border: 0;
	box-shadow: none;
	border-left: solid 1px #000;
}

#custom-search-input button:active {
	border: 0;
	box-shadow: none;
	border: solid 1px #ccc;
}

#custom-search-input .glyphicon-search {
	font-size: 23px;
}
</style>





<body>
	<!-- Slider Section -->
	<section id="header-slider" class="section">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="${rPath}/images/slider/slid3.jpg" alt="Chania">
					<div class="carousel-caption">
						<h3>We'r Auro</h3>
						<p>We Build Strong Brands which impact your customers</p>
					</div>
				</div>
				<div class="item">
					<img src="${rPath}/images/slider/slid4.jpg" alt="Chania">
					<div class="carousel-caption">
						<h3>Minimal Agency Template</h3>
						<p>We're Australia based branding & design agency</p>
					</div>
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span></a> <a
				class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span></a>
		</div>
	</section>
	<!-- Slider Section -->
	<form action="${root}/map/mapList" method="get">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h2>주소를 검색해주세요</h2>
					<div id="custom-search-input">

						<div class="input-group col-md-12">

							<input id="address" name="address" type="text"
								class="form-control input-lg" placeholder="주소를 입력해주세요" /> <span
								class="input-group-btn">
								<button class="btn btn-info btn-lg" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</span>

						</div>

					</div>
				</div>
			</div>
		</div>
	</form>






	<!-- Service Section -->
	<section id="services" class="section services">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 col-sm-6">
					<div class="services-content">
						<h4>We're Australia based branding & design agency.</h4>
						<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris
							condimentum nibh, ut fermentum massa justo sit amet risus.
							Maecenas sed diam eget risus varius blandit sit amet non magna.
							Nullam quis risus eget urna mollis ornare vel eu leo.</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="services-content">
						<h5>Brand Experience</h5>
						<ul>
							<li><a href="#">Web Design</a></li>
							<li><a href="#">Mobile Application</a></li>
							<li><a href="#">Product Development</a></li>
							<li><a href="#">Packaging</a></li>
							<li><a href="#">Retail Management</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="services-content">
						<h5>Media Marketing</h5>
						<ul>
							<li><a href="#">Marketing Research</a></li>
							<li><a href="#">Social Marketing</a></li>
							<li><a href="#">Mobile marketing</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Service Section -->

	<!-- Testimonials section -->
	<section id="testimonials" class="section testimonials no-padding">
		<div class="container-fluid">
			<div class="row no-gutter">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<div class="col-md-12">
								<blockquote>
									<h1>"Integer posuere erat a ante venenatis dapibus posuere
										velit aliquet. Donec sed odio dui. Phasellus non dolor nibh.
										Nullam elementum Aenean eu leo quam..."</h1>
									<p>Rene Brown, Open Window production</p>
								</blockquote>
							</div>
						</li>
						<li>
							<div class="col-md-12">
								<blockquote>
									<h1>"Cras dictum tellus dui, vitae sollicitudin ipsum.
										Phasellus non dolor nibh. Nullam elementum tellus pretium
										feugiat shasellus non dolor nibh. Nullam elementum tellus
										pretium feugiat."</h1>
									<p>Brain Rice, Lexix Private Limited.</p>
								</blockquote>
							</div>
						</li>
						<li>
							<div class="col-md-12">
								<blockquote>
									<h1>"Cras mattis consectetur purus sit amet fermentum.
										Donec sed odio dui. Aenean lacinia bibendum nulla sed
										consectetur...."</h1>
									<p>Andi Simond, Global Corporate Inc</p>
								</blockquote>
							</div>
						</li>
						<li>
							<div class="col-md-12">
								<blockquote>
									<h1>"Lorem ipsum dolor sit amet, consectetur adipiscing
										elitPhasellus non dolor nibh. Nullam elementum tellus pretium
										feugiat. Cras dictum tellus dui sollcitudin."</h1>
									<p>Kristy Gabbor, Martix Media</p>
								</blockquote>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- Testimonials section -->

</body>
</html>
