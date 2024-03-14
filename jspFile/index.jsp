<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="descriptison">
  <meta content="" name="keywords">
<link href="img/logo.png" rel="icon">

<link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">

  <!-- Google Fonts -->
<!-- <link rel="stylesheet" href="css/fonts.google.css"> -->
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
   <!-- 引入layui  -->
<link rel="stylesheet" type="text/css" href="css/layui.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />

<title>Cancer Stemness Online </title>
</head>
<style>
.ant-descriptions-view{border: 1px solid #f0f0f0;}
.ant-descriptions-row{border-bottom: 1px solid #f0f0f0;}
.ant-descriptions-item-label{width:15%;padding: 8px 16px;background-color: #fafafa;border-right: 1px solid #f0f0f0;color: rgba(0,0,0,.85);font-weight: 400;font-size: 16px;line-height: 1.5715;text-align: start;}
.ant-descriptions-item-content{text-align:center;padding: 8px 16px;border-right: none;display: table-cell;-webkit-flex: 1 1;flex: 1 1;color: #000;font-size: 16px;line-height: 1.5715;word-break: break-word;overflow-wrap: break-word;}
.ant-descriptions-item-content1{text-align:center;width:50%;border-right: 1px solid #f0f0f0;padding: 8px 16px;display: table-cell;-webkit-flex: 1 1;flex: 1 1;color: #000;font-size: 16px;line-height: 1.5715;word-break: break-word;overflow-wrap: break-word;}

.img_wrap3{
margin-top:10px;
	display        : flex;
    align-items    : center;
    justify-content: center;
    }
.img_wrap3 input{
		   width     : auto;
           height    : auto;
           max-width : 70%;
           max-height: 70%;
	}
</style>
<body>
<!-- <script src="http://www.mobancss.com/include/new/ggad2_728x90.js"></script> -->
<!-- <div class="adcenter"></div> -->


  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top " style="color:#3E3A39;">
    <div class="container d-flex align-items-center">

      <a href="index.jsp" > 
      
	<img src="img/logo1.png"   height="80">
      
       </a>
        <h1 class="logo mr-auto"></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block" >
        <ul >
          <li class="active"><a href="index.jsp">Home</a></li>
<!--           <li><a href="csIdentity.jsp">CSscore</a></li> -->
          <li class="drop-down"><a href="">CSscore</a>
            <ul>
              <li><a href="csIdentity.jsp">Single method</a></li>
              <li><a href="csIdentityMult.jsp">Multiple method</a></li>
             
            </ul>
          </li>
          <li><a href="DownStream.jsp">Downstream</a></li>
          <li><a href="data.jsp">Data</a></li>
<!--           <li><a href="#portfolio">Portfolio</a></li> -->
<!--           <li><a href="#team">Team</a></li> -->
<!--           <li><a href="blog.html">Blog</a></li> -->
<!--           <li class="drop-down"><a href="">Drop Down</a> -->
<!--             <ul> -->
<!--               <li><a href="#">Drop Down 1</a></li> -->
<!--               <li class="drop-down"><a href="#">Deep Drop Down</a> -->
<!--                 <ul> -->
<!--                   <li><a href="#">Deep Drop Down 1</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 2</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 3</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 4</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 5</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
<!--               <li><a href="#">Drop Down 2</a></li> -->
<!--               <li><a href="#">Drop Down 3</a></li> -->
<!--               <li><a href="#">Drop Down 4</a></li> -->
<!--             </ul> -->
<!--           </li> -->
          <li><a href="help.jsp">Help</a></li>

        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
<!--       <h3>Welcome to <strong>CSplorer</strong></h3> -->
      <h1 style="color:black;">Cancer Stemness Online </h1>
      <h2 style="font-size:32px;color:black;margin-top:10px;">A web server for scoring cancer stemness and associations with immune response</h2>
      <a href="#services" class="btn-get-started scrollto"  style="font-size:20px;color:black;">Get Started</a>
    </div>
  </section><!-- End Hero -->

  <main id="main">
    <section id="services" class="services">
      <div class="container">
        <div >
          <h2><i class="fa fa-tags" aria-hidden="true" style="font-size:25px;margin-right:10px;margin-bottom:10px;"></i><strong>Overview</strong></h2>
          <p style="font-size:22px;font-weight:500;line-height:1.3;letter-spacing:1px;">
	        The progression of cancer is accompanied by the gradual loss of a differentiated phenotype and acquisition of progenitor and stem-cell-like features. Moreover, cancer stemness has also been reported to be the potential culprit in immunotherapy resistance. The Cancer Stemness Online webserver integrates 8 cancer stemness scores (CSscores) methods and 27 signature gene sets associated with stemness to reveal the relationship between stemness and cancer. Downstream analysis is further performed from five different aspects. Moreover, to save user’s running time, the Cancer Stemness Online webserver has pre-processed public available transcriptome data over 40 cancer types.
	        </p>
        </div>
        <div style="margin-top:20px;">
          <h2><i class="fa fa-tags" aria-hidden="true" style="font-size:25px;margin-right:10px;margin-bottom:10px;"></i><strong>CSscore</strong></h2>
          <h3><strong> Upload data and choose method to assess stemness scores</strong></h3>
          <div id="csscore" >
          	<object data="img/csscore.svg" type="image/svg+xml"></object> 
          </div>
          <p style="font-size:22px;font-weight:500;line-height:1.3;letter-spacing:1px;">
          To assess the CSscores based on bulk or single-cell RNA-seq data, we have integrated 5 unsupervised methods and 3 supervised methods, which evaluated the differentiation level based on transcriptional complexity or similarity to the reference profiles of stem cells. Basic statistical analysis was provided to visualize the distribution of CSscores and its association with clinical features. The additional trajectory inference analysis was provided for scRNA-seq data.
	          </p>
         <div class="img_wrap3">
	         <a href="csIdentity.jsp">
					<button style="height:48px;width:180px; border:1px solid #B0477E;color:white; background:#B0477E;opacity:0.8;border-radius:10px;font-size:22px;">Single method</button>
	        	</a>
	        <a href="csIdentityMult.jsp">
					<button style="margin-left:10px;height:48px;width:180px; border:1px solid #B0477E;color:white; background:#B0477E;opacity:0.8;border-radius:10px;font-size:22px;">Multiple method</button>
	        	</a>
         </div>
        </div>
		
		<div style="margin-top:40px;">
			 <h2><i class="fa fa-tags" aria-hidden="true" style="font-size:25px;margin-right:10px;margin-bottom:10px;"></i><strong>Downstream</strong></h2>
	         <h3><strong> Downstream analysis for exploring signature genes and correlation with cancer immunity</strong></h3>
			<div id="analyse" >
				<object data="img/analyse.svg" type="image/svg+xml"></object> 
			</div>
<!-- 			<h3><strong> Specific for scRNA-seq data</strong></h3> -->
<!-- 			<div> -->
<!-- 				<object data="img/3.svg" type="image/svg+xml"></object>  -->
<!-- 			</div> -->
			<br/>
			 <p style="font-size:22px;font-weight:500;line-height:1.3;letter-spacing:1px;">
		       After obtaining CSscores, users can perform five types of downstream analyses.<br/>
				I &nbsp;) identifying signature genes of cancer stemness; <br/>
				II ) exploring the association with cancer hallmarks; <br/>
				III) exploring the association with immune response and communications with immune cells; <br/>
				IV) investigating the contributions for patient survival;  <br/>
				V )  the robustness analysis of cancer stemness.
		       </p>
			<br/>
			<div class="img_wrap3">
		         <a href="DownStream.jsp">
					<button style="height:48px;width:80px; border:1px solid #B0477E;color:white; background:#B0477E;opacity:0.8;border-radius:10px;font-size:22px;">GO</button>
	        	</a>
	         </div>
         
        </div>
        
        <div style="margin-top:40px;">
        	<h2><i class="fa fa-tags" aria-hidden="true" style="font-size:25px;margin-right:10px;margin-bottom:10px;"></i><strong>Data</strong></h2>
			<h3><strong>CSscores for commonly-used public cancer datasets</strong></h3>
			<br/>
			<p style="font-size:22px;font-weight:500;line-height:1.3;letter-spacing:1px;">
			For convenience, the pre-processed results were provided for public available transcriptome data over 40 cancer types from TCGA, ICGC or GEO. You can simply select the cancer type, transcriptome data, and the method of cancer stemness to obtain the results.
			</p>
			<br/>
			<div class="img_wrap3">
				<a href="data.jsp">
					<button style="height:48px;width:80px; border:1px solid #B0477E;color:white; background:#B0477E;opacity:0.8;border-radius:10px;font-size:22px;">GO</button>
	        	</a>
	         </div>
        </div>
        
		<div style="margin-top:40px;">
			<h2><i class="fa fa-tags" aria-hidden="true" style="font-size:25px;margin-right:10px;margin-bottom:10px;"></i><strong>Check Job</strong></h2>
			<h3><strong>A returned job ID for checking details</strong></h3>
			<p style="font-size:22px;font-weight:500;line-height:1.3;letter-spacing:1px;">
				To save time, users can submit task and close the page. An email will remind you that the work has been completed. By inputting your job ID here, the results will be shown.
			</p>
			 <table style="width:60%;text-align:left;margin-top:20px;"  >
              	<tr>
              		<td>
              			<input style="height:45px;border-radius:5px;border: 1px solid #C7C7C7;text-align:left;font-size:20px;" type="text" id="home_task_id" name="home_task_id" lay-verify="title" autocomplete="off" placeholder="Input job ID" class="layui-input" >
              		</td>
              		<td style="width:5px;"></td>
              		<td>
              		<i id="searchJobID" class="bx bx-search-alt" style="font-size:35px;color:#B0477E;cursor:pointer;" onclick="check_job()"></i>
              		</td>
              	</tr>
              </table>
              
             
              	<div id="jodDetail" class="ant-descriptions-view" style="margin-top:20px;margin-bottom:20px;display:none;">
	        			<table style="width:100%;" id="jodDetail_table">
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label" style="font-size:22px;font-weight:550;text-align:center;">Job</th>
        						<td id="" class="ant-descriptions-item-content1" >Job ID</td>
        						<td id="" class="ant-descriptions-item-content" >Job state</td>
        					</tr>
        					<tr class="ant-descriptions-row" id="up">
        						<th class="ant-descriptions-item-label" style="font-weight:550;text-align:center;">CSscore</th>
        						<td id="up_id" class="ant-descriptions-item-content1">21</td>
        						<td id="" class="ant-descriptions-item-content">
									<a id="up_sate_a" href="">
									<button id="up_sate" style="height:40px;width:90%; border:1px solid #B0477E;color:white; background:#B0477E;opacity:0.8;border-radius:10px;font-size:15px;"></button>
	        						</a>
								</td>
        					</tr>
        					<tr class="ant-descriptions-row" id="down">
        						<th class="ant-descriptions-item-label" style="font-weight:550;text-align:center;">Downstream </th>
        						<td id="down_id" class="ant-descriptions-item-content1">3</td>
        						<td id="" class="ant-descriptions-item-content">
        							<a id="down_sate_a" href="">
									<button id="down_sate" style="height:40px;width:90%; border:1px solid #B0477E;color:white; background:#B0477E;opacity:0.8;border-radius:10px;font-size:15px;"></button>
	        						</a>
        						</td>
        					</tr>
        					
        				</table>
	        			
	        			</div>
              
              
		</div>

      </div>
    </section><!-- End Services Section -->

  </main><!-- End #main -->
<div style="height:220px;"></div>
  <!-- ======= Footer ======= -->
  <footer id="footer">


    <div class="container d-md-flex py-4">

      <div class="mr-md-auto text-center text-md-left">
      <table>
      	<tr>
      		<td>
      			<div class="copyright" style="font-size:20px;">
          			&copy; Copyright 2024 <strong><span>Cancer Stemness Online</span></strong>. Harbin Medical University 
        		</div>
      		</td>
      		<td style="width:30px;"></td>
      		<td>
      			<div style="height:140px;width:150px;margin-top:-50px;">
					<script type="text/javascript" src="//rf.revolvermaps.com/0/0/6.js?i=5zxw0wjmz9b&amp;m=7&amp;c=e63100&amp;cr1=ffffff&amp;f=arial&amp;l=0&amp;bv=90&amp;lx=-420&amp;ly=420&amp;hi=20&amp;he=7&amp;hc=a8ddff&amp;rs=80" async="async"></script>
				</div>
      		</td>
      	</tr>
      </table>
         
        
      </div>
     
    </div>
  </footer><!-- End Footer -->


<!--   <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a> -->

  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
<!-- <script type="text/javascript" language="javascript" src="js/layui.js"></script> -->
<!-- <script src="js/layer.js"></script> -->

<!-- <script type="text/javascript" language="javascript" src="js/base/d3.min.js"></script> -->
<script src="js/checkJob.js"></script>
</body>
</html>