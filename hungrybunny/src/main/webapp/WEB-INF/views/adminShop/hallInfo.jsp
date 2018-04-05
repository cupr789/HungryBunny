<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${rPath}/css/button.css">
<script>
	function hallUpdate(hallNo,idx){
		
		var hallStatus=$("input:radio[name=hallStatus]:checked").val();
		var param={hallStatus:hallStatus,hallNo:hallNo};
		console.log(param);
		$.ajax({
		       type:"POST",
	           url:"${root}/adminRes/hallUpdate",
	           data:param,
	           success :callback,
	           error : callback
			
		})
		function callback(res){
			
				 location.reload();
			
		}
		
	}
	function deleteHall(hallNo,idx){
		var param={hallNo:hallNo};
		$.ajax({
		       type:"POST",
	           url:"${root}/adminRes/deleteHall",
	           data:param,
	           success :callback3,
	           error : callback3
			
		})
		function callback3(){
			 location.reload(); 
		}
	}
	
	
	function insertHall(){
		var seatCnt=$("input:radio[name=insertHallCnt]:checked").val();
		 var shopNo = $("input[name='insertShopNo']").val();
		 var param={seatCnt:seatCnt,shopNo:shopNo};
		 $.ajax({
		       type:"POST",
	           url:"${root}/adminRes/insertHall",
	           data:param,
	           success :callback2,
	           error : callback2
			
		})
	}
	function callback2(res){
		
		 location.reload();
	}
	
	
</script>
<body>
<section class="section">
<div class="container">
	<div class="table-wrapper">
		<div class="table-title">
			<div class="row">
				<div class="col-sm-4">
					<h2>홀현황</h2>
				</div>
			</div>
		</div>
			<table class="table table-striped table-hover" style="width: 100%">
				<thead>
					<tr>
						<th>좌석수</th>
						<th>번호</th>
						<th>사용현황</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody class='tbody'>
				<c:forEach items="${hallList}" var="hlist" varStatus="idx">
					<c:set value="${hlist.hallStatus} " var="msg" />
					<tr>
						<td>${hlist.seatCnt}</td>
						<td>${hlist.hallNo}</td>
						<td>
							<c:choose>
								<c:when test="${hlist.hallStatus == '1'}">사용중</c:when>
								<c:when test="${hlist.hallStatus == '0'}">빈자리</c:when>
							</c:choose>
						</td>
						<td>
							<input type="radio" name="hallStatus" value="0">빈자리
							<input type="radio" name="hallStatus" value="1">사용중
							<div class="buttons"><button type="button" class="fill" onclick="hallUpdate(${hlist.hallNo},${idx.index})">수정</button></div>
						</td>
						<td><button type="button" class="fill" onclick="deleteHall(${hlist.hallNo},${idx.index})">삭제</button></td>
					</tr>
				</c:forEach>
						<tr>
						<td colspan="3"></td>
						<td >
						2인석<input type="radio" name="insertHallCnt" value="2">
						4인석<input type="radio" name="insertHallCnt" value="4">
						6인석<input type="radio" name="insertHallCnt" value="6">
						<input type="hidden" name="insertShopNo" value="${shopNo}">
						</td>
						<td>
							<div class="buttons"><button type="button" class="fill" onclick="insertHall()">홀추가</button></div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
			<!-- 페이징 -->
		<div class="clearfix" style="text-align: center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${page.nowPage eq 1}">
						<li class='disabled'><a>«</a></li>
						<li class='disabled'><a>‹</a></li>
					</c:when>
					<c:otherwise>
						<li><a>«</a></li>
						<li><a>‹</a></li>
					</c:otherwise>
				</c:choose>

				<!--페이지번호 -->
				<c:forEach var='i' begin="${page.nowBlock}" end="${page.endBlock}"
					step="1">
					<c:choose>
						<c:when test="${page.nowPage eq i}">
							<li class='active'><a>${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${page.nowPage eq page.totalPage}">
						<li class='disabled'><a>›</a></li>
						<li class='disabled'><a>»</a></li>
					</c:when>
					<c:otherwise>
						<li><a>›</a></li>
						<li><a>»</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
</div>

</section>
</body>
<script>
$("li[class!='active'][class!='disabled']>a").click(function(){
	var shopNo = "${shopNo}";
	var url = "${root}/adminRes/hallInfo/?nowPage=";
	var pageNum = new Number(this.innerHTML);
	if(isNaN(pageNum)){
		var sign = this.innerHTML;
		if(sign=="‹"){
			url += (${page.nowPage}-1) + "&shopNo="+shopNo;
		} else if(sign=="«"){
			url += 1 + "&shopNo="+shopNo;
		} else if(sign=="»"){
			url += ${page.totalPage} + "&shopNo="+shopNo;
		} else if(sign=="›"){
			url += (${page.nowPage}+1) + "&shopNo="+shopNo;
		}
	}else{
		url += pageNum + "&shopNo="+shopNo;
	}
	
	location.href=url;
});
</script>
</html>