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

function swapStr(rr){
/*  	alert("!!!");
 	var inputObj = $("input[name='keyword']");
 	inputObj.value=str; */
	 console.log(rr.id);
	  	var obj = document.getElementById(rr);
	  	$("input[name='keyword']").val(rr.innerHTML); 
 }
 
 function hoverFunc(rr){

	$("span[id='"+rr.id+"']").hover(function() {
		   $(this).css("background-color", "#D5D5D5");
	},function() {
		   $(this).css("background-color", "white");
	});
	
}

function enterSearch() {
	var inputValue = $("input[name='keyword']").val();
	searchJuso();
	$.ajax({
		 url :"http://www.juso.go.kr/addrlink/addrLinkApi.do",
		 type:"post",
		 data:$("#searchAddr").serialize(),
		 dataType:"json",
		 crossDomain:true,
		 success:function(jsonStr){
			 var str="";



			 console.log(jsonStr);
			 	for(loadIdx in jsonStr.results.juso){
			 		var strObj=jsonStr.results.juso[loadIdx].roadAddrPart1;
			 		str+="<span id='span"+loadIdx+"' onmouseover='hoverFunc(span"+loadIdx+")' onclick='swapStr(span"+loadIdx+")'>"+jsonStr.results.juso[loadIdx].roadAddrPart1+"</span><br>";
			 	}
			 	
				$("#dbSearch").html(str);
				
				 /* var errCode = jsonStr.results.common.errorCode;
					var errDesc = jsonStr.results.common.errorMessage;
					if(errCode != "0"){
						alert(errCode+"="+errDesc);
					}else{
						if(jsonStr != null){
							makeListJson(jsonStr);
						}
					}  */
					

					
					
					
				},
				error: function(xhr,status, error){
			    	alert("에러발생");
			    }
	})

}
</script>
</head>
<span onmouseover=""></span>
<link rel="stylesheet" type="text/css" href="${rPath}/css/index.css"> 
<body>
	<!-- Slider Section -->
<section class="section">
	<form action="${root}/map/mapList" id="searchAddr" method="get" onsubmit="return validation()"> 
					<div id="custom-search-input">
						<div class="input-group col-md-12">
							<input type="hidden" name="confmKey" value="U01TX0FVVEgyMDE4MDQwNDIzMDM0ODEwNzc5NjA="/>
							<input type="hidden" name="resultType" value="json"/>
							<input type="hidden" name="currentPage" value="1"/>
							<input type="hidden" name="countPerPage" value="5"/>
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
</body>
</html>
