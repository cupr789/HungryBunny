<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="${rPath}/css/button.css">
</head>
<style>
	.img_warp{
		width:300px;
		margin-top:50px;
	}
</style>

<script>
function commentCnt(){
	var text_max = 300;
	$('#count_message').html(text_max + ' remaining');
	  $('#comment').keyup(function() {
	  var text_length = $('#comment').val().length;
	  var text_remaining = text_max - text_length;
	  $('#count_message').html(text_remaining + ' remaining');
	}); 
}

$(document).ready(function(){
	$("#input_img").on("change", handleImgFileSelect);
	
	//파일 사이즈가 max를 넘으면 뜨는 알람
	if("${error}"){
		alert("${error}");
	}
});

function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("으아아ㅏ아아아아아");
			return;
		}
		
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

</script>
<body onload="commentCnt()">
<section class="section">
	<div class="container">
		<div class="form-group">
			<h2>리뷰 남기기<br></h2>
				<form action="/review/writeReview" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="resNo" value="<%= request.getParameter("resNo") %>">
					<input type="hidden" name="shopNo" value="<%= request.getParameter("shopNo") %>">
					<fieldset class="starability-basic">
						<legend>별점을 주세요!</legend>
						<input type="radio" id="no-rate" class="input-no-rate" name="reviewRating" value="0" checked aria-label="No rating." />

						<input type="radio" id="rate1" name="reviewRating" value="1" />
						<label for="rate1">1 star.</label>

						<input type="radio" id="rate2" name="reviewRating" value="2" />
						<label for="rate2">2 stars.</label>

						<input type="radio" id="rate3" name="reviewRating" value="3" />
						<label for="rate3">3 stars.</label>

						<input type="radio" id="rate4" name="reviewRating" value="4" />
						<label for="rate4">4 stars.</label>

						<input type="radio" id="rate5" name="reviewRating" value="5" />
						<label for="rate5">5 stars.</label>

      					<span class="starability-focus-ring"></span>
    				</fieldset>
					<br>
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" id="comment" name="reviewComment"></textarea>
					<h6 class="pull-right" id="count_message"></h6>
					<br>
					File to upload: <input type="file" name="file" id="input_img">
					<br>
					<div>
						<div class="img_wrap">
							<img id="img" style="width: 100%; max-width: 200px;"/>
						</div>
					</div>
					<button>등록하기</button>
				</form>
		</div>
	</div>
</section>
</body>
</html>