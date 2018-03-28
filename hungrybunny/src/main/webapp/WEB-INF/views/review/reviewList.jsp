<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script>
function alertMsg(){
	var msg = "${msg}";
	if(msg){
		alert(msg);
		
	}
}
function adminComment(){
	var reviewNo=$("input:checkbox[name=reviewNo]:checked").val();
	alert(reviewNo);
	var adminComment=$("#adminComment").val();
	alert(adminComment);
	
	var param={reviewNo:reviewNo,adminComment:adminComment};
	$.ajax({
	       type:"POST",
           url:"${root}/review/adminComment",
           data:param,
           success :callback,
           error : callback
		
	})
	function callback(res){
			alert(res.msg);
			
			/*  location.reload(); */
		
	}	
	
}



</script>
<body onload="alertMsg()">
<section class="section">
<div class="container">
	<table class="table table-bordered" style="width:100%">
		<thead>
			<tr>
				<th></th>
				<th>ID</th>
				<th>메뉴</th>
				<th>코멘트</th>
				<th>별점</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reviewList}" var="reviewList">
				<tr>
		
					<td>		    <c:choose>
       		<c:when test="${admin == '1'}">
           	<input type="checkbox" name="reviewNo" value="${reviewList.reviewNo}">
       		</c:when>
     		<c:when test="${admin == '0'}">
         	
       		</c:when>
   			</c:choose> </td>
					<td><div class="w3-xxxlarge"><i class="glyphicon glyphicon-user"></i></div>${reviewList.uiId}</td>
					<td>${reviewList.menuName}</td>
					<td>${reviewList.reviewComment}</td>
					<td width="15%">
					<fieldset class="starability-basic">
					<c:forEach begin="1" end="${reviewList.reviewRating}">
					<input type="radio"/><label for="rate1"></label>
					</c:forEach>
					</fieldset>
					</td>
					<td>${reviewList.resDate}</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>
			<c:forEach items="${reviewList}" var="reviewList">
			
			</c:forEach>
</div>
<div>
			<a>
				<br>
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" id="adminComment" name="adminComment"></textarea>
					<h6 class="pull-right" id="count_message"></h6>
					
					<button onclick="adminComment()">등록하기</button>
				</a>

</div>

<h1>${admin}</h1>
</section>
</body>
</html>