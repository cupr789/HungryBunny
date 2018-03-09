<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Character set configuration -->
<meta charset="UTF-8">
<title>Record - Responsive Bootstrap Table Design</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Viewport configuration, scaling options -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- CSS Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/demo-1/table-1.css" rel="stylesheet">
<!-- Font Awesome icon -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- Google web font  -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
</head>
<body class="demo">
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
                    <th>Srno.</th>
                    <th class="size-one">Candidate Name</th>
                    <th class="size-one">Father Name</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Contact</th>
                    <th>Country</th>
                    <th>Class</th>
                    <th>Mark</th>
                    <th>Grade</th>
                    <th>Status</th>
                    <th>Radio</th>
                    <th>Check</th>
                    <th>Link</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td data-title="Srno.">01</td>
                    <td data-title="Candidate Name">Max Well</td>
                    <td data-title="Father Name">Jim Well</td>
                    <td data-title="Gender">Male</td>
                    <td data-title="DOB">15/08/1989</td>
                    <td data-title="Contact No.">9826012354</td>
                    <td data-title="Country">Shri Lanka</td>
                    <td data-title="Class">10th</td>
                    <td data-title="Mark">80/100</td>
                    <td data-title="Grade">A+</td>
                    <td data-title="Status">Pass</td>
                    <td  data-title="Radio"><div class="radio">
                        <input type="radio" id="rb1" name="rb" value="">
                        <label for="rb1"></label>
                      </div></td>
                    <td  data-title="Check"><div class="checkbox">
                        <input type="checkbox" id="cb1" name="cb" value="">
                        <label for="cb1"></label>
                      </div></td>
                    <td data-title="Link"><a href="#" type="button" class="btn btn-success btn-xs">Click</a> </td>
                  </tr>
                  <tr>
                    <td data-title="Srno.">02</td>
                    <td data-title="Candidate Name">Tony Blare</td>
                    <td data-title="Father Name">Tim Cook Blare</td>
                    <td data-title="Gender">Male</td>
                    <td data-title="DOB">25/10/1990</td>
                    <td data-title="Contact No.">9826098652</td>
                    <td data-title="Country">Nepal</td>
                    <td data-title="Class">12th</td>
                    <td data-title="Mark">70/100</td>
                    <td data-title="Grade">A</td>
                    <td data-title="Status">Pass</td>
                    <td  data-title="Radio"><div class="radio">
                        <input type="radio" id="rb2" name="rb" value="">
                        <label for="rb2"></label>
                      </div></td>
                    <td  data-title="Check"><div class="checkbox">
                        <input type="checkbox" id="cb2" name="cb" value="">
                        <label for="cb2"></label>
                      </div></td>
                    <td data-title="Link"><a href="#" type="button" class="btn btn-success btn-xs">Click</a> </td>
                  </tr>
                  <tr>
                    <td data-title="Srno.">03</td>
                    <td data-title="Candidate Name">Chelsi Jorg</td>
                    <td data-title="Father Name">Doge Jorg</td>
                    <td data-title="Gender">Female</td>
                    <td data-title="DOB">05/11/1992</td>
                    <td data-title="Contact No.">9826098745</td>
                    <td data-title="Country">London</td>
                    <td data-title="Class">8th</td>
                    <td data-title="Mark">90/100</td>
                    <td data-title="Grade">A++</td>
                    <td data-title="Status">Pass</td>
                    <td  data-title="Radio"><div class="radio">
                        <input type="radio" id="rb3" name="rb" value="">
                        <label for="rb3"></label>
                      </div></td>
                    <td  data-title="Check"><div class="checkbox">
                        <input type="checkbox" id="cb3" name="cb" value="">
                        <label for="cb3"></label>
                      </div></td>
                    <td data-title="Link"><a href="#" type="button" class="btn btn-success btn-xs">Click</a> </td>
                  </tr>
                  <tr>
                    <td data-title="Srno.">04</td>
                    <td data-title="Candidate Name">Bon Ton Jee</td>
                    <td data-title="Father Name">Tig Ton Jee</td>
                    <td data-title="Gender">Male</td>
                    <td data-title="DOB">20/06/1999</td>
                    <td data-title="Contact No.">9826045214</td>
                    <td data-title="Country">USA</td>
                    <td data-title="Class">10th</td>
                    <td data-title="Mark">40/100</td>
                    <td data-title="Grade">C</td>
                    <td data-title="Status">Fail</td>
                    <td  data-title="Radio"><div class="radio">
                        <input type="radio" id="rb4" name="rb" value="">
                        <label for="rb4"></label>
                      </div></td>
                    <td  data-title="Check"><div class="checkbox">
                        <input type="checkbox" id="cb4" name="cb" value="">
                        <label for="cb4"></label>
                      </div></td>
                    <td data-title="Link"><a href="#" type="button" class="btn btn-success btn-xs">Click</a> </td>
                  </tr>
                  <tr>
                    <td data-title="Srno.">05</td>
                    <td data-title="Candidate Name">Pikar Kock</td>
                    <td data-title="Father Name">Joel Kock</td>
                    <td data-title="Gender">Male</td>
                    <td data-title="DOB">10/08/19996</td>
                    <td data-title="Contact No.">9826063258</td>
                    <td data-title="Country">China</td>
                    <td data-title="Class">12th</td>
                    <td data-title="Mark">95/100</td>
                    <td data-title="Grade">A+++</td>
                    <td data-title="Status">Pass</td>
                    <td  data-title="Radio"><div class="radio">
                        <input type="radio" id="rb5" name="rb" value="">
                        <label for="rb5"></label>
                      </div></td>
                    <td  data-title="Check"><div class="checkbox">
                        <input type="checkbox" id="cb5" name="cb" value="">
                        <label for="cb5"></label>
                      </div></td>
                    <td data-title="Link"><a href="#" type="button" class="btn btn-success btn-xs">Click</a> </td>
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