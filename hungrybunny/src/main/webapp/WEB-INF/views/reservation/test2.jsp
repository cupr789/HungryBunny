<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Record - Responsive Bootstrap Table Design</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/demo-1/table-1.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
</head>
<script>
function shopList(){
	var aufsl = new AjaxUtilForShopList(".animatedParent no-more-tables>.container>.row>.col-md-12>.table-responsive tbl-one>.col-md-12  table table-bordered one-color","${root}/shop/shopList",null,"GET");
	aufl.send();
}
</script>

<body class="demo" onload="shopList()">
<section class="section">
<!-- Unique ID Begin -->
<div id="tbl">
  <!-- Table Style 1 Begin -->
  <div class="text-center">
    <hr>
    <h3><span class="label label-default">가게리스트</span></h3>
    <hr>
  </div>
  <div class="animatedParent no-more-tables">
    <!-- Container Start -->
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div id="no-more-tables">
            <!-- Table Record Begin -->
            <div class="table-responsive tbl-one">
              <table class="col-md-12  table table-bordered one-color">
                <thead>
                  <tr>
                    <th>가게이름</th>
                    <th class="size-one">주소</th>
                    <th class="size-one">전화번호</th>
                    <th>운영시간</th>
                    <th>예약하기</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td data-title="Srno.">01</td>
                    <td data-title="Candidate Name">Max Well</td>
                    <td data-title="Father Name">Jim Well</td>
                    <td data-title="Gender">Male</td>
                    <td data-title="Gender"></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- Table End -->
          <div class="page-footer">
            <div class="container">
              <div class="row">
                <div class="col-md-2">
                  <ul class="pager">
                    <li><a href="#">Previous</a></li>
                  </ul>
                </div>
                <div class="col-md-8 text-center">
                  <ul class="pagination pagination-sm">
                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                  </ul>
                </div>
                <div class="col-md-2">
                  <ul class="pager">
                    <li><a href="#">Next</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- Unique ID End-->
<br>
<br>
<div class="text-center">
  <p class="small">&copy; Copyright 2016 - Design Collection</p>
  <br>
</div>
<!--  Latest jQuery Plugins -->
<script src="js/jquery-1.12.4.min.js" type="text/javascript"></script>
<!-- Bootstrap JavaScript plugins -->
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</section>
</body>
</html>