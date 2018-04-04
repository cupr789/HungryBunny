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
</script>

<body>
<section class="section">
	<div class="container">
		<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-4">
							<h2>예약 현황</h2>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover" style="width: 100%">
					<thead>
						<tr>
							<th>예약인수</th>
							<th>메뉴/개수</th>
							<th>예약시간</th>
							<th>핸드폰</th>
							<th>결제방법</th>
							<th>예약자명</th>
							<th>예약테이블</th>
							<th>총금액</th>
							<th>예약상태</th>
						</tr>
					</thead>
					<tbody class="tbody">
					<c:if test="${totalCnt eq 0}">
					<tr><td colspan="8">예약 내역이 없습니다</td></tr></c:if>
					<c:forEach items="${resList}" var="resList">
						<tr>
							<td>${resList.seatCnt}</td>
							<td>${resList.menuName}</td>
							<td>${resList.resDate}</td>
							<td>${resList.uiHP}</td>
							<td>${resList.PayType}</td>
							<td>${resList.uiName}</td>
							<td>${resList.hallNo}</td>
							<td>${resList.payPrice}</td>
							<c:if test="${resList.currentStatus eq 1 }">
							<td>현재예약</td>	
							</c:if>
							<c:if test="${resList.currentStatus eq 0 }">
							<td>지난예약</td>	
							</c:if>
						</tr>
					</c:forEach>
					</tbody>
				</table>
		
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
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>
</body>
<script>
$("li[class!='active'][class!='disabled']>a").click(function(){
	var shopNo = "${shopNo}";
	var url = "${root}/adminRes/resInfo/?nowPage=";
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