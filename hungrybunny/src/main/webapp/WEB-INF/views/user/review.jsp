<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

</head>
<%
String shopNo = request.getParameter("shopNo");
%>
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
function test(){
	var b = <%=shopNo%>
	alert(b);
}
var a = document.forms["test"].elements["shopNo"];
alert(a);
</script>
<body onload="commentCnt()">
<section class="section">
	<div class="container">
		<div class="form-group">
			<h2><%= request.getParameter("shopName") %> 리뷰 남기기<br></h2>
				<form action="/user/review" method="POST">
					<fieldset class="starability-basic">
						<legend>별점을 주세요!</legend>
						<input type="radio" id="no-rate" class="input-no-rate" name="rating" value="0" checked aria-label="No rating." />

						<input type="radio" id="rate1" name="rating" value="1" />
						<label for="rate1">1 star.</label>

						<input type="radio" id="rate2" name="rating" value="2" />
						<label for="rate2">2 stars.</label>

						<input type="radio" id="rate3" name="rating" value="3" />
						<label for="rate3">3 stars.</label>

						<input type="radio" id="rate4" name="rating" value="4" />
						<label for="rate4">4 stars.</label>

						<input type="radio" id="rate5" name="rating" value="5" />
						<label for="rate5">5 stars.</label>

      					<span class="starability-focus-ring"></span>
    				</fieldset>
					<br>
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" id="comment" name="comment"></textarea>
					<h6 class="pull-right" id="count_message"></h6>
					
					<button>등록하기</button>
				</form>
		</div>
	</div>
</section>
</body>
</html>