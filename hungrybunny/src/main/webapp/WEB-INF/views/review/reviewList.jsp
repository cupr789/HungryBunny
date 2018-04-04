<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${rPath}/css/reviewList.css"> 
<script>
var shopNo;
function alertMsg(){
	var msg = "${msg}";
	if(msg){
		alert(msg);
		
	}
}

function adminComment(){
	var reviewNo=$("input:checkbox[name=reviewNo]:checked").val();
	if(reviewNo==null){
		alert("수정하려는 댓글을 체크해주세요");
	}
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
			window.location.reload();
		
	}	
	
}


//이미지 클릭 시 확대 추가
function resizeImg(osrc)

{

    var bdiv =document.createElement('DIV');

    document.body.appendChild(bdiv);

    bdiv.setAttribute("id", "bdiv");

    bdiv.style.position = 'absolute';

    bdiv.style.top = 0;

    bdiv.style.left = 0;

    bdiv.style.zIndex = 0;

    bdiv.style.width = document.body.scrollWidth;

    bdiv.style.height = document.body.scrollHeight;

    bdiv.style.background = 'gray';

    //bdiv.style.filter = "alpha(opacity=75)";

    bdiv.style.opacity = '0.5';

    //bdiv.style.mozOpacity = '0.5';

    var odiv = document.createElement('DIV');

    document.body.appendChild(odiv);

    odiv.style.zIndex = 1;

    odiv.setAttribute("id", "odiv");

    odiv.innerHTML = "<a href='javascript:void(closeImg())'><img id='oimg' src='"+osrc+"' border='0' width='700' height='400'/></a>";

    var img = document.all['oimg'];

    var owidth = (document.body.clientWidth)/2 - (img.width)/2;

    var oheight = (document.body.clientHeight)/2 - (img.height)/2;

    odiv.style.position = 'absolute';

    odiv.style.top = oheight + document.body.scrollTop;

    odiv.style.left = owidth;

    scrollImg();

}

function scrollImg()

{

    var odiv = document.all['odiv'];

    var img = document.all['oimg'];

    var oheight = (document.body.clientHeight)/2 - (img.height)/2 + document.body.scrollTop;

    odiv.style.top = oheight;

    settime = setTimeout(scrollImg, 100);

}

function closeImg()

{

    document.body.removeChild(odiv);

    document.body.removeChild(bdiv);

    clearTimeout(settime);

}

</script>
<body onload="alertMsg()">
<section class="section">
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-4">
						<h2>리뷰리스트</h2>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover" style="width: 100%">
				<thead>
					<tr>
						<th></th>
						<th>ID</th>
						<th>메뉴</th>
						<th>코멘트</th>
						<th>별점</th>
						<th>날짜</th>
						<th>사진</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty reviewList}">
						<tr>
							<td colspan="7">리뷰가 없습니다.</td>
						</tr>
					</c:if>

					<c:forEach items="${reviewList}" var="reviewList">
						<tr>
							<td><c:choose>
									<c:when test="${admin == '1'}">
										<input type="checkbox" name="reviewNo" value="${reviewList.reviewNo}">
									</c:when>
									<c:when test="${admin == '0'}">

									</c:when>
								</c:choose></td>
							<td><div class="w3-xxxlarge">
									<i class="glyphicon glyphicon-user"></i>
								</div>${reviewList.uiId}님</td>
							<td>${reviewList.menuName}</td>
							<td>${reviewList.reviewComment}</td>
							<td width="15%">
								<fieldset class="starability-basic">
									<c:forEach begin="1" end="${reviewList.reviewRating}">
										<input type="radio" />
										<label for="rate1"></label>
									</c:forEach>
								</fieldset>
							</td>
							<td>${reviewList.resDate}</td>

							<c:if test="${empty reviewList.fileName}">
								<td>사진이 없또요</td>
							</c:if>
							<c:if test="${not empty reviewList.fileName}">
								<td><img src="${rPath}/review/imgs/${reviewList.fileName}" width="100" onclick="resizeImg(this.src)"></td>
							</c:if>
						</tr>
						<tr>
							<c:choose>
								<c:when test="${reviewList.adminComment != null}">
									<td colspan="7">사장님댓글-->${reviewList.adminComment}</td>
								</c:when>
								<c:when test="${reviewList.adminComment == null}">
									<td colspan="7">아직댓글이 없어요</td>
								</c:when>
							</c:choose>

						</tr>

					</c:forEach>

				</tbody>
			</table>

			<div>
				<br>
				<c:choose>
					<c:when test="${admin =='1'}">
						<a> <label for="comment">Comment:</label> <textarea class="form-control" rows="5" id="adminComment" name="adminComment"></textarea>
							<h6 class="pull-right" id="count_message"></h6>
							<button onclick="adminComment()">등록하기</button>
						</a>
					</c:when>
					<c:when test="${admin == '0'}">

					</c:when>
				</c:choose>
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
	</div>
</section>
</body>
<script>
$("li[class!='active'][class!='disabled']>a").click(function(){
	var shopNo = "${shopNo}";
	var url = "${root}/review/reviewList/?nowPage=";
	var pageNum = new Number(this.innerHTML);
	if(isNaN(pageNum)){
		var sign = this.innerHTML;
		if(sign=="‹"){
			url += (${page.nowPage}-1) + "&shopNo="+shopNo;
		}else if(sign=="«"){
			url += 1 + "&shopNo="+shopNo;
		}else if(sign=="»"){
			url += ${page.totalPage} + "&shopNo="+shopNo;
		}else if(sign=="›"){
			url += (${page.nowPage}+1) + "&shopNo="+shopNo;
		}
	}else{
		url += pageNum + "&shopNo="+shopNo;
	}
	
	location.href=url;
})
</script>
</html>