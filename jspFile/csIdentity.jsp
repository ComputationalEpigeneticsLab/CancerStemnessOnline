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
<link rel="stylesheet" href="css/fonts.google.css">
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

<script src="js/xm-select.js" type="text/javascript" charset="utf-8"></script>
<script src="js/echarts.js" type="text/javascript" charset="utf-8"></script>
 <script src="js/layer.js"></script>
<script src="layui/layui.js"></script>
<link rel="stylesheet" type="text/css" href="css/tool.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />

<title>Cancer Stemness Online </title>
</head>
<style>
.methodDiscriptionFont{font-size:18px;font-weight:520;}
.leftStyle{margin-top:15px; cursor: pointer;}
.leftStyle:hover {color: #C4859D;}
.leftStyleActivate{margin-top:15px; cursor: pointer;color:#C4859D;}
.methodSelectDiv{width:100%;margin-left:0%;height:50px;background-color:#F5ECEF;opacity:;text-align:center;line-height:50px;margin-top:10px;}
.methodNameStyle{font-size:20px;cursor: pointer;}
.methodNameStyle:hover {color: #C4859D;}
.methodNameStyle_li{font-size:30px;color:#C4859D;}
.dis_m{font-size:16px !important;}
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
<!--           <li class="active"><a href="csIdentity.jsp">CSscore</a></li> -->
          
          <li class="active drop-down"><a href="">CSscore</a>
            <ul>
              <li class="active"><a href="csIdentity.jsp">Single method</a></li>
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
      <div class="container" style="margin-top:40px;">
        <h2>Upload data and choose method to assess stemness scores</h2>
      </div>
    </section>
    <section id="blog" class="blog">
      <div class="container">
        <div class="row">
        	
				<div class="col-lg-4 ">
          			<div class="sidebar" >
          				<div style="margin-left:10%;">
          					<div id="nodel"  class="leftStyleActivate" >
	          					<h3><strong onclick="changeMethod('nodel')">By Model Type</strong></h3>
	          				</div>
	          				<div id="input" class="leftStyle">
	          					<h3><strong onclick="changeMethod('input')">By Input Type</strong></h3>
	          				</div>
	          				
          				</div>
          				<br/>
          			</div>
          		</div>
          		<div class="col-lg-8 entries">
          			<div class="sidebar">
<!-- ### modelContent start################## -->
          				<div id="nodelContent">
          					<h3><strong style="color:#C4859D;">By Model Type</strong></h3>
          					<br/>
          					<p class="methodDiscriptionFont"> 
          					The methods are categorized into 'Unsupervised' and 'Supervised' according to the calculation model type.
          					</p>
          					<br/>
          					<h3><strong >Unsupervised methods</strong></h3>
          					
          					<div class="methodSelectDiv">
          						<a href="csIdentityUploadSingle.jsp?method=CytoTRACE&type=single" class="methodNameStyle"><strong>CytoTRACE</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('CytoTRACE')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="CytoTRACE" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="CytoTRACEContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    CytoTRACE predicts the differentiation and developmental potential of each cell by assessing the number of detectably expressed genes per cell or gene counts, and eventually calculate a score which is higher in stem cell.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUploadSingle.jsp?method=SLICE&type=single" class="methodNameStyle"><strong>SLICE</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('SLICE')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="SLICE" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="SLICEContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p  class="dis_m">
					                    SLICE quantitatively measures cellular differentiation states based on single cell entropy by assuming that entropy is negatively correlated with cell differentiation state. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUploadSingle.jsp?method=SCENT&type=single" class="methodNameStyle"><strong>SCENT</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('SCENT')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="SCENT" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="SCENTContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                     SCENT estimates the differentiation potential of a single cell by calculating the signal promiscuity or entropy of the cell transcriptome in the PPI interaction network. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUploadSingle.jsp?method=StemID&type=single" class="methodNameStyle"><strong>StemID</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemID')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemID" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="StemIDContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    StemID assesses stem cells among all detectable cell types within a population by utilizing tree topology and transcriptome composition. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=GSVA&type=all" class="methodNameStyle"><strong>GSVA</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('gsvaSingle')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="gsvaSingle" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="gsvaSingleContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    The score of single cell gene set enrichment analysis (ssGSEA) for our manually collected stemness-related signatures. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
          					
          					
			                
			                <br/>
			                <h3><strong >Supervised methods</strong></h3>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUploadBulk.jsp?method=mRNAsi&type=bulk" class="methodNameStyle"><strong>mRNAsi</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('mRNAsi')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="mRNAsi" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="mRNAsiContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    mRNAsi is a transcriptome stemness index to evaluate the stemness based on the one-class logistic regression machine learning algorithm to extract transcriptomic feature sets derived from non-transformed pluripotent stem cells and their differentiated progeny. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
							<div class="methodSelectDiv">
          						<a href="csIdentityUploadSingle.jsp?method=StemSC&type=single" class="methodNameStyle"><strong>StemSC</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemSC')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemSC" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="StemSCContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    StemSC represents the percentage of gene pairs with the same relative expression orderings as the reference of embryonic stem cell samples. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUploadBulk.jsp?method=StemnessIndex&type=bulk" class="methodNameStyle"> <strong>StemnessIndex</strong>   </a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemnessIndex')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemnessIndex" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
			                <article id="StemnessIndexContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p  class="dis_m">
					                   StemnessIndex provides an absolute index to evaluate stemness by comparing the relative expression orderings of the stem cell samples and the normal adult samples from different tissues. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                <br/><br/>
          				</div>
<!-- ### odelContent end################## -->
<!-- ### inputContent start################## -->          				
          				<div id="inputContent" style="display:none;max-height:;overflow:auto; ">
          					<h3><strong style="color:#C4859D;">By Input Type</strong></h3>
          					<br/>
          					<p class="methodDiscriptionFont"> 
          					Users can choose method by the type of uploading data.
          					</p>
          					<br/>
          					<h3><strong >Bulk</strong></h3>
          					
          					<div class="methodSelectDiv">
          						<a href="csIdentityUploadBulk.jsp?method=mRNAsi&type=bulk" class="methodNameStyle"><strong>mRNAsi</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('mRNAsiInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="mRNAsiInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="mRNAsiInputContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                     mRNAsi is a transcriptome stemness index to evaluate the stemness based on the one-class logistic regression machine learning algorithm to extract transcriptomic feature sets derived from non-transformed pluripotent stem cells and their differentiated progeny. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
 <!-- 			                StemnessIndex -->
			                <div class="methodSelectDiv">
          						<a href="csIdentityUploadBulk.jsp?method=StemnessIndex&type=bulk" class="methodNameStyle"> <strong>StemnessIndex</strong>   </a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemnessIndexInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemnessIndexInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
			                <article id="StemnessIndexInputContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                   StemnessIndex provides an absolute index to evaluate stemness by comparing the relative expression orderings of the stem cell samples and the normal adult samples from different tissues. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                <div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=GSVA&type=bulk" class="methodNameStyle"><strong>GSVA</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('gsvaInputbulk')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="gsvaInputbulk" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="gsvaInputbulkContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    The score of single cell gene set enrichment analysis (ssGSEA) for our manually collected stemness-related signatures. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <br/>
          					<h3><strong >Single cell</strong></h3>
          					
          					<div class="methodSelectDiv">
          						<a href="csIdentityUploadSingle.jsp?method=CytoTRACE&type=single" class="methodNameStyle"><strong>CytoTRACE</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('CytoTRACEInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="CytoTRACEInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="CytoTRACEInputContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    CytoTRACE predicts the differentiation and developmental potential of each cell by assessing the number of detectably expressed genes per cell or gene counts, and eventually calculate a score which is higher in stem cell.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUploadSingle.jsp?method=SLICE&type=single" class="methodNameStyle"><strong>SLICE</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('SLICEInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="SLICEInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="SLICEInputContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    SLICE quantitatively measures cellular differentiation states based on single cell entropy by assuming that entropy is negatively correlated with cell differentiation state. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUploadSingle.jsp?method=SCENT&type=single" class="methodNameStyle"><strong>SCENT</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('SCENTInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="SCENTInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="SCENTInputContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    SCENT estimates the differentiation potential of a single cell by calculating the signal promiscuity or entropy of the cell transcriptome in the PPI interaction network. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUploadSingle.jsp?method=StemID&type=single" class="methodNameStyle"><strong>StemID</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemIDInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemIDInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="StemIDInputContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    StemID assesses stem cells among all detectable cell types within a population by utilizing tree topology and transcriptome composition. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUploadSingle.jsp?method=StemSC&type=single" class="methodNameStyle"><strong>StemSC</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemSCinput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemSCinput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="StemSCinputContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    StemSC represents the percentage of gene pairs with the same relative expression orderings as the reference of embryonic stem cell samples. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                <div class="methodSelectDiv">
          						<a href="csIdentityUpload.jsp?method=GSVA&type=single" class="methodNameStyle"><strong>GSVA</strong></a>
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('gsvaInputsingle')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="gsvaInputsingle" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					<article id="gsvaInputsingleContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content">
		          					<blockquote>
					                  <i class="icofont-quote-left quote-left"></i>
					                  <p class="dis_m">
					                    The score of single cell gene set enrichment analysis (ssGSEA) for our manually collected stemness-related signatures. Higher scores imply the higher stemness.
					                  </p>
					                  <i class="las la-quote-right quote-right"></i>
					                  <i class="icofont-quote-right quote-right"></i>
					                </blockquote>
				                </div>
			                </article>
			                
			                
			               <br/><br/>
          				</div>
<!-- ### inputContent end################## -->

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
 
<script src="js/csIdentity.js" type="text/javascript" charset="utf-8"></script>
<script src="js/csTree.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

</script>
<script type="text/javascript">


</script>
</body>
</html>