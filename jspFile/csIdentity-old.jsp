<%@ page import="Util.*" import="java.sql.*" import="java.util.ArrayList" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/loadingUse.css" rel="stylesheet">
<script type="text/javascript">

document.onreadystatechange = subSomething;
//加载状态为complete时移除loading效果
function subSomething() {
    //当页面加载状态
    if (document.readyState == "complete") {
        //延迟一秒关闭loading
        $('#loading').delay(500).hide(0);
        
    }
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
<link href="img/logo.png" rel="icon">
<link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/style_FileUpLoad.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/ball-newton-cradle.css" />
  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
   <!-- 引入layui  -->
 <!-- 引入layui  -->
<link rel="stylesheet" type="text/css" href="css/tool.css" />
<link rel="stylesheet" type="text/css" href="css/layui.css" />

<title>csIdentity</title>
</head>
<style>
.methodDiscriptionFont{font-size:20px;font-weight:520;}
.leftStyle{margin-top:15px; cursor: pointer;}
.leftStyle:hover {color: #33cc66;}
.leftStyleActivate{margin-top:15px; cursor: pointer;color:#33cc66;}
.methodSelectDiv{width:100%;margin-left:0%;height:50px;background-color:#E0EEEE;text-align:center;line-height:50px;margin-top:10px;}
.methodNameStyle{font-size:20px;cursor: pointer;}
.methodNameStyle:hover {color: #ff3366;}
</style>
<body>
<!-- <div id="loading"> -->
<!-- 	<div class="la-ball-clip-rotate-multiple la-3x" style="color: #f68f6f;margin: auto;  position: absolute;  top: 0; left: 0; bottom: 0; right: 0; "> -->
<!-- 		<div></div> -->
<!-- 		<div></div> -->
<!-- 		<div></div> -->
<!-- 		<div></div> -->
<!-- 		<div></div> -->
<!-- 		<div></div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- ======= Header ======= -->
  <header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.jsp">CSplorer</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li class="active"><a href="csIdentity.jsp">CS identity</a></li>
          <li><a href="DownStream.jsp">DownStream</a></li>
		  <li><a href="help.jsp">Help</a></li>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container" style="margin-top:10px;">
        <h2>description here</h2>
      </div>
    </section>
    <section id="blog" class="blog">
      <div class="container">
        <div class="row">
        	
				<div class="col-lg-3 ">
          			<div class="sidebar" >
          				<div id="bulk" class="leftStyleActivate" >
          					<h3><strong onclick="changeMethod('bulk')">Bulk</strong></h3>
          				</div>
          				<div id="singleCell" class="leftStyle">
          					<h3><strong onclick="changeMethod('singleCell')">Single Cell</strong></h3>
          				</div>
          				<br/>
          			</div>
          		</div>
          		<div class="col-lg-9 entries">
          			<div class="sidebar">
<!-- ### bulkContent start################## -->
          				<div id="bulkContent">
          					<h3><strong >Bulk</strong></h3>
          					<p class="methodDiscriptionFont"> description here description here description here description here description here description here description here description here description here description here description here description here description here description here description here description here description here
          					</p>
          					<div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=mRNAsi&type=bulk" class="methodNameStyle"><strong>mRNAsi</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('mRNAsi')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="mRNAsi" class="fa fa-toggle-on" aria-hidden="true" style="font-size:30px;color:green;"></i>
				                </button>
          					</div>
          					<article id="mRNAsiContent" class="entry entry-single" style='margin-top:-20px;width:100%;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p>
					                    method  description here.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
<!-- 			                StemnessIndex -->
			                <div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=StemnessIndex&type=bulk" class="methodNameStyle"> <strong>StemnessIndex</strong>   </a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemnessIndex')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemnessIndex" class="fa fa-toggle-on" aria-hidden="true" style="font-size:30px;color:green;"></i>
				                </button>
          					</div>
			                <article id="StemnessIndexContent" class="entry entry-single" style='margin-top:-20px;width:100%;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p>
					                    method  description here.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=GSVA&type=bulk" class="methodNameStyle"> <strong>GSVA</strong>   </a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('gsvaBulk')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="gsvaBulk" class="fa fa-toggle-on" aria-hidden="true" style="font-size:30px;color:green;"></i>
				                </button>
          					</div>
			                <article id="gsvaBulkContent" class="entry entry-single" style='margin-top:-20px;width:100%;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p>
					                    method  description here.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
          				</div>
<!-- ### bulkContent end################## -->
<!-- ### singleCellContent start################## -->          				
          				<div id="singleCellContent" style="display:none;max-height:;overflow:auto; ">
          					<h3><strong >Single cell</strong></h3>
          					<p class="methodDiscriptionFont"> description here description here description here description here description here description here description here description here description here description here description here description here description here description here description here description here description here
          					</p>
          					
          					<div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=CytoTRACE&type=single" class="methodNameStyle"><strong>CytoTRACE</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('CytoTRACE')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="CytoTRACE" class="fa fa-toggle-on" aria-hidden="true" style="font-size:30px;color:green;"></i>
				                </button>
          					</div>
          					<article id="CytoTRACEContent" class="entry entry-single" style='margin-top:-20px;width:100%;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p>
					                    method  description here.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=StemSC&type=single" class="methodNameStyle"><strong>StemSC</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemSC')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemSC" class="fa fa-toggle-on" aria-hidden="true" style="font-size:30px;color:green;"></i>
				                </button>
          					</div>
          					<article id="StemSCContent" class="entry entry-single" style='margin-top:-20px;width:100%;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p>
					                    method  description here.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=SLICE&type=single" class="methodNameStyle"><strong>SLICE</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('SLICE')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="SLICE" class="fa fa-toggle-on" aria-hidden="true" style="font-size:30px;color:green;"></i>
				                </button>
          					</div>
          					<article id="SLICEContent" class="entry entry-single" style='margin-top:-20px;width:100%;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p>
					                    method  description here.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=SCENT&type=single" class="methodNameStyle"><strong>SCENT</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('SCENT')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="SCENT" class="fa fa-toggle-on" aria-hidden="true" style="font-size:30px;color:green;"></i>
				                </button>
          					</div>
          					<article id="SCENTContent" class="entry entry-single" style='margin-top:-20px;width:100%;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p>
					                    method  description here.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=StemID&type=single" class="methodNameStyle"><strong>StemID</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemID')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemID" class="fa fa-toggle-on" aria-hidden="true" style="font-size:30px;color:green;"></i>
				                </button>
          					</div>
          					<article id="StemIDContent" class="entry entry-single" style='margin-top:-20px;width:100%;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p>
					                    method  description here.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=GSVA&type=single" class="methodNameStyle"><strong>GSVA</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('gsvaSingle')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="gsvaSingle" class="fa fa-toggle-on" aria-hidden="true" style="font-size:30px;color:green;"></i>
				                </button>
          					</div>
          					<article id="gsvaSingleContent" class="entry entry-single" style='margin-top:-20px;width:100%;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p>
					                    method  description here.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
          				</div>
<!-- ### singleCellContent end################## -->

          			</div>
          		</div>

        	</div>
        </div>

    </section>

  </main>

  <!-- ======= Footer ======= -->
<!--   <footer id="footer"> -->


<!--     <div class="container d-md-flex py-4"> -->

<!--       <div class="mr-md-auto text-center text-md-left"> -->
<!--         <div class="copyright"> -->
<!--           &copy; Copyright <strong><span>RBPreg</span></strong>. Harbin Medical University & Hainan  Medical University -->
<!--         </div>  -->
        
<!--       </div> -->
     
<!--     </div> -->
<!--   </footer>End Footer -->

  <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  
<script type="text/javascript" language="javascript" src="js/base/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="js/base/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript" src="js/base/buttons.html5.min.js"></script>
<!-- //plotly d3 -->
<script type="text/javascript" language="javascript" src="js/base/plotly-2.6.3.min.js"></script>
<script type="text/javascript" language="javascript" src="js/base/d3.min.js"></script>
  <!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script type="text/javascript" language="javascript" src="js/layui.js"></script>
<script src="js/layer.js"></script>
<script src="js/layui.js"></script>
<script src="js/xm-select.js" type="text/javascript" charset="utf-8"></script>
<script src="js/echarts.js" type="text/javascript" charset="utf-8"></script>
<script src="js/csIdentity.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var timer=0;
//email
$('#choose_emil_select').hover(function(){
    $('#email_anno').show();
    },function(){
    timer=setTimeout(function(){
        $('#email_anno').hide();
    },100);
});
$('#email_anno').mouseover(function(){
    //clearTimeout(timer);
    $('#email_anno').hide();
});
//file
$('#FileAnno').hover(function(){
    $('#file_anno').show();
    },function(){
    timer=setTimeout(function(){
        $('#file_anno').hide();
    },100);
});
$('#file_anno').mouseover(function(){
    //clearTimeout(timer);
    $('#file_anno').hide();
});
</script>
<script type="text/javascript">


</script>
</body>
</html>