<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="${rPath}/css/index.css">
<script type="text/javascript">

function validation(){
	var inputValue = $("input[name='keyword']").val();
	if(inputValue.length==0){
		alert("주소를 입력해 주세요!")
		return false;
	}else{
		return true;
	}
}

/*도로명주소 API 호출시 검색어에 특수문자 또는 OR, INSERT, UNION 등 SQL예약어가 포함될 경우
보안장비가 SQL INJECTION공격으로 간주하여 해당 IP를 차단시킬 수 있습니다.
사용자분들은 API호출시 검색어 필터링를 적용하여 주시기 바랍니다.*/

//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function checkSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join(""); 
			return false;
		}
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
		);
		
		var regex ;
		var regex_plus ;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp("\\s" + sqlArray[i] + "\\s","gi") ;
			if (regex.test(obj.value)) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
			
			regex_plus = new RegExp( "\\+" + sqlArray[i] + "\\+","gi") ;
			if (regex_plus.test(obj.value)) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex_plus, "");
				return false;
			}
		}
	}
	return true ;
}

// 적용예 (api 호출 전에 검색어 체크) 
function searchJuso(){
	if (!checkSearchedWord(document.getElementById("address"))) {
		return ;
	}
}

function enterSearch() {
	var inputValue = $("input[name='keyword']").val();
	searchJuso();
	$.ajax({
		 url :"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do",
		 type:"post",
		 data:$("#searchAddr").serialize(),
		 dataType:"jsonp",
		 crossDomain:true,
		 success:function(jsonStr){
			 var str="";
			 console.log(jsonStr.results.juso);
			 	for(loadIdx in jsonStr.results.juso){
			 		str+=jsonStr.results.juso[loadIdx].roadAddr+"<br>";
			 	}
			 	
				//$("#dbSearch").html(str);
			
				
				/* var errCode = jsonStr.results.common.errorCode;
					var errDesc = jsonStr.results.common.errorMessage;
					if(errCode != "0"){
						alert(errCode+"="+errDesc);
					}else{
						if(jsonStr != null){
							makeListJson(jsonStr);
						}
					} */
				},
				error: function(xhr,status, error){
			    	alert("에러발생");
			    }
	})

}

</script>
</head>
<link rel="stylesheet" type="text/css" href="${rPath}/css/index.css"> 
<body>
	<!-- Slider Section -->
<section class="section">	
	<form action="${root}/map/mapList" id="searchAddr" method="get" onsubmit="return validation()"> 
					<div id="custom-search-input">
						<div class="input-group col-md-12">
							<input type="hidden" name="confmKey" value="TESTJUSOGOKR"/>
							<input type="hidden" name="resultType" value="json"/>
							<input type="hidden" name="currentPage" value="1"/>
							<input type="hidden" name="countPerPage" value="10"/>
							<input id="address" name="keyword" type="text" onkeyup="enterSearch()" class="form-control input-lg" placeholder="주소를 입력해주세요" /> 
							<span class="input-group-btn">
								<button class="btn btn-info btn-lg" type="submit">
									<i class="glyphicon glyphicon-search"></i> 
								</button>
							</span></div>
							<div id="dbSearch" style="font-size: 20px"></div>
					</div>
	</form>
</section>	
	
	
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
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span></a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span></a>
		</div>
	</section>
	<!-- Slider Section -->

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
