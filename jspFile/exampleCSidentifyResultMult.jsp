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


<title>Cancer Stemness Online </title>
</head>
<style>
.ant-descriptions-view{border: 1px solid #f0f0f0;}
.ant-descriptions-row{border-bottom: 1px solid #f0f0f0;}
.ant-descriptions-item-label{width:30%;padding: 8px 16px;background-color: #fafafa;border-right: 1px solid #f0f0f0;color: rgba(0,0,0,.85);font-weight: 400;font-size: 16px;line-height: 1.5715;text-align: start;}
.ant-descriptions-item-content{padding: 8px 16px;border-right: none;display: table-cell;-webkit-flex: 1 1;flex: 1 1;color: #000;font-size: 16px;line-height: 1.5715;word-break: break-word;overflow-wrap: break-word;}

.imgleft{
width:40%;
float:left;
min-height:100px;
}
.imgright{
width:58%;
min-height:100px;
float:right;
}

.imgleft2{
width:50%;
float:left;
min-height:100px;
}
.imgright2{
	width:49%;
	display        : flex;
    align-items    : center;
    justify-content: center;
    }
.imgright2 img{
		   width     : auto;
           height    : auto;
           max-width : 100%;
           max-height: 100%;
	}
.imgleft5{
width:50%;
float:left;

}
.imgleft5 img{
		   width     : auto;
           height    : auto;
           max-width : 99%;
           max-height: 99%;
	}
.imgright5{
	width:49%;
	display        : flex;
    align-items    : center;
    justify-content: center;
    }
.imgright5 img{
		   width     : auto;
           height    : auto;
           max-width : 99%;
           max-height: 99%;
	}
	
.button_style{margin-top: 10px;height:auto;width:auto; border:1px solid #B0477E;color:white; background:#B0477E;opacity:0.8;border-radius:10px;font-size:16px; padding: 5% 10%;}	


</style>

<body>
<div id="loading">
	<div class="la-ball-clip-rotate-multiple la-3x" style="color: #f68f6f;margin: auto;  position: absolute;  top: 0; left: 0; bottom: 0; right: 0; ">
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
		<div></div>
	</div>
</div>
<!-- ======= Header ======= -->
  <header id="header" class="fixed-top header-inner-pages">
     <div class="container d-flex align-items-center">
      <a href="index.jsp" > 
		<img src="img/logo1.png"   height="80">
       </a>
        <h1 class="logo mr-auto"></h1>
      <nav class="nav-menu d-none d-lg-block" >
        <ul >
          <li ><a href="index.jsp">Home</a></li>
          
          <li class=" active drop-down"><a href="">CSscore</a>
            <ul>
              <li><a href="csIdentity.jsp">Single method</a></li>
              <li><a href="csIdentityMult.jsp">Multiple method</a></li>
             
            </ul>
          </li>
          <li><a href="DownStream.jsp">Downstream</a></li>
          <li ><a href="data.jsp">Data</a></li>
          <li><a href="help.jsp">Help</a></li>

        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container" style="margin-top:;">
      </div>
    </section>
    <section id="blog" class="blog">
      <div class="container">
        <div class="row">
        	<div class="col-lg-12 ">
        		<div class="sidebar" >
					<div class="uploadTitle">
        				<i  class="fa fa-th-list" aria-hidden="true" style="font-size:30px;"></i>CSscore
        			</div>
        				
        			<div style="margin-top:10px;max-height:500px;overflow:auto;width:100%;" >
	        					<table style="width:98%;text-align:left; " id="RRATable" class="table table-bordered table-hover dataTable cell_infor_table_detail" >
									
								</table>
        			</div>
        				
        			<div style="margin-top:10px;width:100%;height:600px;" id="methodspearman"></div>
					<div style="margin-top:10px;width:100%;height:800px;" id="methodTime"></div>
					
					
				<div class="uploadTitle">
        				<i  class="fa fa-th-list" aria-hidden="true" style="font-size:30px;"></i> View the results of a single method
        		</div>
        		<div  class="row " style="margin-top:20px;" id="view_sm">
	        		<div class="col-lg-4 ">
		        		<a  href="">
							<button class="button_style">Download1</button>
			        	</a>
	        		</div>
	        		<div class="col-lg-4 ">
		        		<a  href="">
							<button class="button_style" >Download2</button>
			        	</a>
	        		</div>
	        		<div class="col-lg-4 ">
	        			<a  href="">
							<button class="button_style" >Download3</button>
			        	</a>
	        		</div>
	        		
        		</div>
        		</div>
        	
        	
        	</div>
				
          		

        	</div>
        </div>

    </section>

  </main>


  <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>
<input name="UserTaskID"  id="UserTaskID" type="hidden" value=<%=request.getParameter("UserTaskID") %> >

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
<script src="js/exampleCSidentifyResultMult.js" type="text/javascript" charset="utf-8"></script>

<script>


</script>
</body>
</html>