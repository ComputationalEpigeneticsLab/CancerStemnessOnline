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
   <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  

  <!-- Template Main JS File -->

<script src="layui/layui.js"></script>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />

<title>Cancer Stemness Online </title>
</head>
<style>
.ant-descriptions-view{border: 1px solid #f0f0f0;}
.ant-descriptions-row{border-bottom: 1px solid #f0f0f0;}
.ant-descriptions-item-label{width:20%;padding: 8px 16px;background-color: #fafafa;border-right: 1px solid #f0f0f0;color: rgba(0,0,0,.85);font-weight: 400;font-size: 16px;line-height: 1.5715;text-align: start;}
.ant-descriptions-item-content{padding: 8px 16px;border-right: none;display: table-cell;-webkit-flex: 1 1;flex: 1 1;color: #000;font-size: 16px;line-height: 1.5715;word-break: break-word;overflow-wrap: break-word;}
.fontStyle3{font-size:20px;margin-bottom:20px;}
.layui-collapse {
	margin-left:20px;
	margin-right:20px;	
    border-width: 0;
    border-color: none;

    
}
.layui-colla-item{
/* height:50px; */
}
.layui-colla-title{
border-radius:10px;
margin-top:10px;
background: #e3e9f0;
/* height:50px; */
}
.layui-colla-title:hover{
background: #404040;
transition: ease-in all 0.5s;
color: 	#AEEEEE;

}
.layui-colla-item{
 border-color: white;
 border-style: none;
 background-color:white;
 border-radius:20px;
 margin-left:-0px;
 }
 .layui-colla-content{
  border-top-width: 0; 
  border-top-style: none; 
  background-color:white;
 

 }
 .font1{font-size:25px;font-weight:550;margin-left:10px;}
 .font_tableLeft{margin-left:2px;font-size:20px;color:;}
 .font_tableRight{margin-left:2px;font-size:18px;color:black;}
 p.font_underline {
  text-decoration: underline;
  text-decoration-color: #3366ff; 
}

 
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
          <li class="  drop-down"><a href="">CSscore</a>
            <ul>
              <li><a href="csIdentity.jsp">Single method</a></li>
              <li><a href="csIdentityMult.jsp">Multiple method</a></li>
             
            </ul>
          </li>
          <li><a href="DownStream.jsp">Downstream</a></li>
          <li ><a href="data.jsp">Data</a></li>
          <li class="active"><a href="help.jsp">Help</a></li>

        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container" ">
      </div>
    </section>
    <section id="blog" class="blog">
      <div class="container">
        <div class="row">
        	
				<div class="col-lg-12 ">
          			<div class="sidebar" >
	          			<div class="layui-collapse">
						  <div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">Home</p>
						    </h2>
						    <div class="layui-colla-content layui-show">
<!-- 						    	 layui-show -->
						    
						    	<object data="img/help/1.svg" type="image/svg+xml"></object> 
						    
						    </div>
						  </div>
						  <div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">CSscore single method</p>
						    </h2>
						    <div class="layui-colla-content ">
						    	<object data="img/help/2.svg" type="image/svg+xml"></object> 
						    </div>
						    <div class="layui-colla-content ">
						    	<object data="img/help/3.svg" type="image/svg+xml"></object> 
						    </div>
						    <div class="layui-colla-content ">
						    	<object data="img/help/4.svg" type="image/svg+xml"></object> 
						    </div>
						    
						  </div>
						  
						  
						  <div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">CSscore multiple method</p>
						    </h2>
						    <div class="layui-colla-content ">
						    	<object data="img/help/M1.svg" type="image/svg+xml"></object> 
						    </div>
						    <div class="layui-colla-content ">
						    	<object data="img/help/M2.svg" type="image/svg+xml"></object> 
						    </div>
						    <div class="layui-colla-content ">
						    	<object data="img/help/M3.svg" type="image/svg+xml"></object> 
						    </div>
						    <div class="layui-colla-content ">
						    	<object data="img/help/M4.svg" type="image/svg+xml"></object> 
						    </div>
						    
						  </div>
						  
						  <div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">Downstream-submit</p>
						    </h2>
						    <div class="layui-colla-content ">
						    	<object data="img/help/Downstream-submit.svg" type="image/svg+xml"></object> 
						    </div>
						  </div>
						  
						  <div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">Downstream-result</p>
						    </h2>
						    <div class="layui-colla-content ">
						    	<object data="img/help/Downstream-result.svg" type="image/svg+xml"></object> 
						    </div>
						  </div>
						  <div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">Data</p>
						    </h2>
						    <div class="layui-colla-content ">
						    	<object data="img/help/data.svg" type="image/svg+xml"></object> 
						    </div>
						  </div>
						  
						  
						  
						  <div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">Methods select & source</p>
						    </h2>
						    <div class="layui-colla-content ">
						    
						    <h3 >Methods applicable to <font style="color:black;font-weight:550;">Count</font> <font style="font-size:20px;">(raw count)</font></h3>
						    <div class="ant-descriptions-view" style="margin-top:20px;margin-bottom:20px;margin-left:10px;">
						    	<table style="width:100%">
						    		<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft" style="color:black;font-weight:550;font-size:22px;">	Method   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
												<p  class="font_tableRight" style="color:black;font-weight:550;font-size:22px;">Description
												</p>
											</td>
											
			        				</tr>
			        				
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	CytoTRACE   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
												CytoTRACE predicts the differentiation and developmental potential of each cell by assessing the number of detectably expressed genes per cell or gene counts, and eventually calculate a score which is higher in stem cell
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	SLICE   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											SLICE quantitatively measures cellular differentiation states based on single cell entropy by assuming that entropy is negatively correlated with cell differentiation state. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	SCENT   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											SCENT estimates the differentiation potential of a single cell by calculating the signal promiscuity or entropy of the cell transcriptome in the PPI interaction network. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	StemID   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											StemID assesses stem cells among all detectable cell types within a population by utilizing tree topology and transcriptome composition. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	StemSC   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											StemSC represents the percentage of gene pairs with the same relative expression orderings as the reference of embryonic stem cell samples. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	GSVA   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											The score of single cell gene set enrichment analysis (ssGSEA) for our manually collected stemness-related signatures. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	mRNAsi   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											mRNAsi is a transcriptome stemness index to evaluate the stemness based on the one-class logistic regression machine learning algorithm to extract transcriptomic feature sets derived from non-transformed pluripotent stem cells and their differentiated progeny. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	StemnessIndex   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											StemnessIndex provides an absolute index to evaluate stemness by comparing the relative expression orderings of the stem cell samples and the normal adult samples from different tissues. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
						    	</table>
						    </div>
						    
						    <h3 >Methods applicable to <font style="color:black;font-weight:550;">TPM</font><font style="font-size:20px;">(Transcript per Kilobase per Million mapped reads)</font>  </h3>
						    <div class="ant-descriptions-view" style="margin-top:20px;margin-bottom:20px;margin-left:10px;">
						    	<table style="width:100%">
						    		<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft" style="color:black;font-weight:550;font-size:22px;">	Method   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
												<p  class="font_tableRight" style="color:black;font-weight:550;font-size:22px;">Description
												</p>
											</td>
											
			        				</tr>
			        				
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	CytoTRACE   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
												CytoTRACE predicts the differentiation and developmental potential of each cell by assessing the number of detectably expressed genes per cell or gene counts, and eventually calculate a score which is higher in stem cell
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	SLICE   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											SLICE quantitatively measures cellular differentiation states based on single cell entropy by assuming that entropy is negatively correlated with cell differentiation state. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	SCENT   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											SCENT estimates the differentiation potential of a single cell by calculating the signal promiscuity or entropy of the cell transcriptome in the PPI interaction network. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	StemSC   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											StemSC represents the percentage of gene pairs with the same relative expression orderings as the reference of embryonic stem cell samples. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	GSVA   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											The score of single cell gene set enrichment analysis (ssGSEA) for our manually collected stemness-related signatures. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	mRNAsi   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											mRNAsi is a transcriptome stemness index to evaluate the stemness based on the one-class logistic regression machine learning algorithm to extract transcriptomic feature sets derived from non-transformed pluripotent stem cells and their differentiated progeny. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	StemnessIndex   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											StemnessIndex provides an absolute index to evaluate stemness by comparing the relative expression orderings of the stem cell samples and the normal adult samples from different tissues. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
						    	</table>
						    </div>
						    
						    <h3 >Methods applicable to <font style="color:black;font-weight:550;">FPKM</font> <font style="font-size:20px;">(Fragments Per Kilobase of exon model per Million mapped fragments)</font> </h3>
						    <div class="ant-descriptions-view" style="margin-top:20px;margin-bottom:20px;margin-left:10px;">
						    	<table style="width:100%">
						    		<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft" style="color:black;font-weight:550;font-size:22px;">	Method   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
												<p  class="font_tableRight" style="color:black;font-weight:550;font-size:22px;">Description
												</p>
											</td>
											
			        				</tr>
			        				
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	CytoTRACE   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
												CytoTRACE predicts the differentiation and developmental potential of each cell by assessing the number of detectably expressed genes per cell or gene counts, and eventually calculate a score which is higher in stem cell
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	SLICE   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											SLICE quantitatively measures cellular differentiation states based on single cell entropy by assuming that entropy is negatively correlated with cell differentiation state. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	SCENT   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											SCENT estimates the differentiation potential of a single cell by calculating the signal promiscuity or entropy of the cell transcriptome in the PPI interaction network. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	StemSC   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											StemSC represents the percentage of gene pairs with the same relative expression orderings as the reference of embryonic stem cell samples. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	GSVA   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											The score of single cell gene set enrichment analysis (ssGSEA) for our manually collected stemness-related signatures. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	mRNAsi   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											mRNAsi is a transcriptome stemness index to evaluate the stemness based on the one-class logistic regression machine learning algorithm to extract transcriptomic feature sets derived from non-transformed pluripotent stem cells and their differentiated progeny. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
			        				
			        				<tr class="ant-descriptions-row">
			        					<th class="ant-descriptions-item-label">
			        						<p  class="font_tableLeft">	StemnessIndex   </p>
			        					</th>
			        					<td class="ant-descriptions-item-content">
											<p  class="font_tableRight">
											StemnessIndex provides an absolute index to evaluate stemness by comparing the relative expression orderings of the stem cell samples and the normal adult samples from different tissues. Higher scores imply the higher stemness
											</p>
										</td>
			        				</tr>
						    	</table>
						    </div>
						    <h3 >Methods source </h3>
						    	<div class="ant-descriptions-view" style="margin-top:10px;margin-bottom:20px;">
			        				<table style="width:100%">
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Method   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
												<p  class="font_tableRight">	Source </p>
											</td>
											<th class="ant-descriptions-item-label" style="width:100px;">
			        							<p  class="font_tableLeft">	Speed   </p>
			        						</th>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	CytoTRACE   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.science.org/doi/full/10.1126/science.aax0249">
												<p  class="font_tableRight font_underline">	Single-cell transcriptional diversity is a hallmark of developmental potential </p>
												</a>
											</td>
											
											<th class="ant-descriptions-item-label" >
			        							<p  class="font_tableLeft">	Fast   </p>
			        						</th>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	SLICE   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href=" https://academic.oup.com/nar/article/45/7/e54/2725372?login=false">
												<p  class="font_tableRight font_underline">SLICE: determining cell differentiation and lineage based on single cell entropy
												 </p>
												</a>
											</td>
											<th class="ant-descriptions-item-label" >
			        							<p  class="font_tableLeft">	Mediun   </p>
			        						</th>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	SCENT   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ncomms15599">
												<p  class="font_tableRight font_underline">Single-cell entropy for accurate estimation of differentiation potency from a cell's transcriptome </p>
												</a>
											</td>
											<th class="ant-descriptions-item-label" >
			        							<p  class="font_tableLeft">	Slow   </p>
			        						</th>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	StemID   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a  href="https://www.sciencedirect.com/science/article/pii/S1934590916300947?via%3Dihub">
												<p  class="font_tableRight font_underline">De Novo Prediction of Stem Cell Identity using Single-Cell Transcriptome Data </p>
												</a>
											</td>
											<th class="ant-descriptions-item-label" >
			        							<p  class="font_tableLeft">	Slow   </p>
			        						</th>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	mRNAsi   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.sciencedirect.com/science/article/pii/S0092867418303581?via%3Dihub">
												<p  class="font_tableRight font_underline">Machine Learning Identifies Stemness Features Associated with Oncogenic Dedifferentiation</p>
												</a>
											</td>
											<th class="ant-descriptions-item-label" >
			        							<p  class="font_tableLeft">	Fast   </p>
			        						</th>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	StemSC   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://stemcellres.biomedcentral.com/articles/10.1186/s13287-022-02803-5">
												<p  class="font_tableRight font_underline">StemSC: a cross-dataset human stemness index for single-cell samples </p>
												</a>
											</td>
											<th class="ant-descriptions-item-label" >
			        							<p  class="font_tableLeft">	Fast   </p>
			        						</th>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	StemnessIndex   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://academic.oup.com/bib/article-abstract/22/2/2151/5771212?redirectedFrom=fulltext&login=false">
												<p  class="font_tableRight font_underline">An absolute human stemness index associated with oncogenic dedifferentiation</p>
												</a>
											</td>
											<th class="ant-descriptions-item-label" >
			        							<p  class="font_tableLeft">	Fast   </p>
			        						</th>
			        					</tr>

			        					
			        				</table>
			        			
			        			</div>
						    
						    </div>
						  </div>
						  
						  
						  <div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">Stemness marker gene set </p>
						    </h2>
						    <div class="layui-colla-content ">
								<div class="ant-descriptions-view" style="margin-top:10px;margin-bottom:20px;">
			        				<table style="width:100%">
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Gene set </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							
												<p  class="font_tableRight">Publication</p>
												
											</td>
											<td class="ant-descriptions-item-label" style="width:100px;">
			        							<p  class="font_tableLeft">Data </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:200px;">
			        							
												<p  class="font_tableRight">Range</p>
												
											</td>
											
			        						
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_Eed_targets </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
												 </p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_ES_exp1 </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_ES_exp2 </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_ES_TFs </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_H3K27_bound </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_Myc_targets1 </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_Myc_targets2 </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_Nanog_targets </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_NOS_targets </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_NOS_TFs </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_Oct4_targets </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_PRC2_targets </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_Sox2_targets </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Ben_Suz12_targets </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.nature.com/articles/ng.127">
												<p  class="font_tableRight font_underline">
													An embryonic stem cell-like gene expression signature in poorly differentiated aggressive human tumors
													
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2008/5/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Kim_ES_TFs_ref_m2h </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://genomemedicine.biomedcentral.com/articles/10.1186/gm291">
												<p  class="font_tableRight font_underline">
													Embryonic stem cell-specific signatures in cancer: insights into genomic regulatory networks and implications for medicine
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2011/11/29 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Kim_et_al_core_m2h </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://genomemedicine.biomedcentral.com/articles/10.1186/gm291">
												<p  class="font_tableRight font_underline">
													Embryonic stem cell-specific signatures in cancer: insights into genomic regulatory networks and implications for medicine
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2011/11/29 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Kim_et_al_Myc_m2h </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://genomemedicine.biomedcentral.com/articles/10.1186/gm291">
												<p  class="font_tableRight font_underline">
													Embryonic stem cell-specific signatures in cancer: insights into genomic regulatory networks and implications for medicine
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2011/11/29 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Kim_et_al_PRC_m2h </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://genomemedicine.biomedcentral.com/articles/10.1186/gm291">
												<p  class="font_tableRight font_underline">
													Embryonic stem cell-specific signatures in cancer: insights into genomic regulatory networks and implications for medicine
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2011/11/29 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Palme_SCGS </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://genomebiology.biomedcentral.com/articles/10.1186/gb-2012-13-8-r71">
												<p  class="font_tableRight font_underline">
												A gene expression profile of stem cell pluripotentiality and differentiation is conserved across diverse solid and hematopoietic cancers
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	2012/8/21 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Zhang_Stem.Sig </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-022-01050-w">
												<p  class="font_tableRight font_underline">
												Integrated analysis of single-cell and bulk RNA sequencing data reveals a pan-cancer stemness signature predicting immunotherapy response
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft"> 2022/4/29 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Pan-cancer </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Yan_CD133_GBM_up </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://www.pnas.org/doi/10.1073/pnas.1018696108?url_ver=Z39.88-2003&rfr_id=ori:rid:crossref.org&rfr_dat=cr_pub%20%200pubmed">
												<p  class="font_tableRight font_underline">
												A CD133-related gene expression signature identifies an aggressive glioblastoma subtype with excessive mutations
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft"> 2011/1/25 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">GBM </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Mizuno_iPSC118 </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://pubmed.ncbi.nlm.nih.gov/21149740/">
												<p  class="font_tableRight font_underline">
												Inactivation of p53 in breast cancers correlates with stem cell transcriptional signatures
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft"> 2010/12/28 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">BRCA </p>
											</td>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Mizuno_iPSC340 </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://pubmed.ncbi.nlm.nih.gov/21149740/">
												<p  class="font_tableRight font_underline">
												Inactivation of p53 in breast cancers correlates with stem cell transcriptional signatures
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft"> 2010/12/28 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">BRCA </p>
											</td>
			        					</tr>
			        					
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Shats_et_al_iPS </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://genomebiology.biomedcentral.com/articles/10.1186/gb-2012-13-8-r71">
												<p  class="font_tableRight font_underline">
												A gene expression profile of stem cell pluripotentiality and differentiation is conserved across diverse solid and hematopoietic cancers
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft"> 2011/3/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">BRCA </p>
											</td>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Shats_et_al_CSR </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://genomebiology.biomedcentral.com/articles/10.1186/gb-2012-13-8-r71">
												<p  class="font_tableRight font_underline">
												A gene expression profile of stem cell pluripotentiality and differentiation is conserved across diverse solid and hematopoietic cancers
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft"> 2011/3/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">BRCA </p>
											</td>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	VeneziaHSC_cPsig_m2h </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.0020301">
												<p  class="font_tableRight font_underline">
												Molecular signatures of proliferation and quiescence in hematopoietic stem cells
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft"> 2004/10/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Hematopoietic stem cells </p>
											</td>
			        					</tr>
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	VeneziaHSC_ES_m2h </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<a href="https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.0020301">
												<p  class="font_tableRight font_underline">
												Molecular signatures of proliferation and quiescence in hematopoietic stem cells
												</p>
												</a>
											</td>
											<td class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft"> 2004/10/1 </p>
			        						</td>
			        						<td class="ant-descriptions-item-content" style="width:100px;">
												<p  class="font_tableRight">Hematopoietic stem cells </p>
											</td>
			        					</tr>
			        					
			        					
			        					
			        				</table>
			        			
			        			</div>
							</div>
						  </div>
						<div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">Methods comparison  </p>
						    </h2>
						    <div class="layui-colla-content ">
						    	<h3 style="">Accuracy of  methods using gold standard data </h3>
						    	<object data="img/help/accuracy.svg" type="image/svg+xml"></object> 
						    	
						    	<a href="https://pubmed.ncbi.nlm.nih.gov/30388455/">   Jerby-Arnon L, Shah P, Cuoco MS, Rodman C, Su MJ, Melms JC, Leeson R, Kanodia A, Mei S, Lin JR, Wang S, Rabasha B, Liu D, Zhang G, Margolais C, Ashenberg O, Ott PA, Buchbinder EI, Haq R, Hodi FS, Boland GM, Sullivan RJ, Frederick DT, Miao B, Moll T, Flaherty KT, Herlyn M, Jenkins RW, Thummalapalli R, Kowalczyk MS, Cañadas I, Schilling B, Cartwright ANR, Luoma AM, Malu S, Hwu P, Bernatchez C, Forget MA, Barbie DA, Shalek AK, Tirosh I, Sorger PK, Wucherpfennig K, Van Allen EM, Schadendorf D, Johnson BE, Rotem A, Rozenblatt-Rosen O, Garraway LA, Yoon CH, Izar B, Regev A. A Cancer Cell Program Promotes T Cell Exclusion and Resistance to Checkpoint Blockade. Cell. 2018 Nov 1;175(4):984-997.e24. doi: 10.1016/j.cell.2018.09.006. PMID: 30388455; PMCID: PMC6410377.</a>
						    </div>
						  </div>
						  <div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">Remove batch and identify tumor cells </p>
						    </h2>
						    <div class="layui-colla-content ">
						    	<h3 style="">Batch remove</h3>
						    		<div class="ant-descriptions-view" style="margin-top:20px;margin-bottom:20px;margin-left:10px;">
								    	<table style="width:100%">
								    		<tr class="ant-descriptions-row">
					        						<th class="ant-descriptions-item-label">
					        							<p  class="font_tableLeft" style="color:black;font-weight:550;font-size:22px;">	Method   </p>
					        						</th>
					        						<td class="ant-descriptions-item-content">
														<p  class="font_tableRight" style="color:black;font-weight:550;font-size:22px;">Source
														</p>
													</td>
													
					        				</tr>
					        				
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	FastMNN   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
					        						<a href="https://www.nature.com/articles/nbt.4091">
														<p  class="font_tableRight font_underline">
														Batch effects in single-cell RNA-sequencing data are corrected by matching mutual nearest neighbors
														</p>
													</a>
												</td>
					        				</tr>
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	Seurat v3 (CCA and RPCA)   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.sciencedirect.com/science/article/pii/S0092867419305598?via%3Dihub">
														<p  class="font_tableRight font_underline">
															Comprehensive Integration of Single-Cell Data
														</p>
													</a>
												</td>
					        				</tr>
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	scVI   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.nature.com/articles/s41592-018-0229-2">
														<p  class="font_tableRight font_underline">
															Deep generative modeling for single-cell transcriptomics
														</p>
													</a>
												</td>
					        				</tr>
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	scANVI   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.embopress.org/doi/full/10.15252/msb.20209620">
														<p  class="font_tableRight font_underline">
															Probabilistic harmonization and annotation of single‐cell transcriptomics data with deep generative models
														</p>
													</a>
												</td>
					        				</tr>
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	Scanorama   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.nature.com/articles/s41587-019-0113-3">
														<p  class="font_tableRight font_underline">
															Efficient integration of heterogeneous single-cell transcriptomes using Scanorama
														</p>
													</a>
												</td>
					        				</tr>
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	BBKNN   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://academic.oup.com/bioinformatics/article/36/3/964/5545955?login=false">
														<p  class="font_tableRight font_underline">
															BBKNN: fast batch alignment of single cell transcriptomes
														</p>
													</a>
												</td>
					        				</tr>
					        				
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	LIGER   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.sciencedirect.com/science/article/pii/S0092867419305045?via%3Dihub">
														<p  class="font_tableRight font_underline">
															Single-Cell Multi-omic Integration Compares and Contrasts Features of Brain Cell Identity
														</p>
													</a>
												</td>
					        				</tr>
					        				
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	Conos   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.nature.com/articles/s41592-019-0466-z">
														<p  class="font_tableRight font_underline">
															Joint analysis of heterogeneous single-cell RNA-seq dataset collections
														</p>
													</a>
												</td>
					        				</tr>
					        				
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	SAUCIE   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.nature.com/articles/s41592-019-0576-7">
														<p  class="font_tableRight font_underline">
															Exploring single-cell data with deep multitasking neural networks
														</p>
													</a>
												</td>
					        				</tr>
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	ComBat   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://academic.oup.com/biostatistics/article/8/1/118/252073?login=false">
														<p  class="font_tableRight font_underline">
															Adjusting batch effects in microarray expression data using empirical Bayes methods 
														</p>
													</a>
												</td>
					        				</tr>
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	DESC   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.nature.com/articles/s41467-020-15851-3">
														<p  class="font_tableRight font_underline">
															Deep learning enables accurate clustering with batch effect removal in single-cell RNA-seq analysis
														</p>
													</a>
												</td>
					        				</tr>
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	trVAE   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://academic.oup.com/bioinformatics/article/36/Supplement_2/i610/6055927">
														<p  class="font_tableRight font_underline">
															Conditional out-of-distribution generation for unpaired data using transfer VAE
														</p>
													</a>
												</td>
					        				</tr>
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	scGen   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.nature.com/articles/s41592-019-0494-8">
														<p  class="font_tableRight font_underline">
															scGen predicts single-cell perturbation responses
														</p>
													</a>
												</td>
					        				</tr>
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	Harmony   </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.nature.com/articles/s41592-019-0619-0">
														<p  class="font_tableRight font_underline">
															Fast, sensitive and accurate integration of single-cell data with Harmony
														</p>
													</a>
												</td>
					        				</tr>
					        				
								    	</table>
								    </div>
						    	<h3 style="">Identify tumor cells</h3>
						    		<div class="ant-descriptions-view" style="margin-top:20px;margin-bottom:20px;margin-left:10px;">
								    	<table style="width:100%">
						    		
						    				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	  inferCNV </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.science.org/doi/10.1126/science.1254257">
														<p  class="font_tableRight font_underline">
															Single-cell RNA-seq highlights intratumoral heterogeneity in primary glioblastoma
														</p>
													</a>
												</td>
					        				</tr>
					        				
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft">	  Copykat </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.nature.com/articles/s41587-020-00795-2">
														<p  class="font_tableRight font_underline">
															Delineating copy number and clonal substructure in human tumors from single-cell transcriptomes
														</p>
													</a>
												</td>
					        				</tr>
					        				
					        				<tr class="ant-descriptions-row">
					        					<th class="ant-descriptions-item-label">
					        						<p  class="font_tableLeft ">	  Numbat </p>
					        					</th>
					        					<td class="ant-descriptions-item-content">
													<a href="https://www.nature.com/articles/s41587-022-01468-y">
														<p  class="font_tableRight font_underline">
															Haplotype-aware analysis of somatic copy number variations from single-cell transcriptomes
														</p>
													</a>
												</td>
					        				</tr>
					        				
								    	</table>
								    </div>
						    </div>
						  </div>
<!-- 						  ///////////////// -->
						  <div class="layui-colla-item">
						    <h2 class="layui-colla-title">
						    	<p class="font1">Contact </p>
						    </h2>
						    <div class="layui-colla-content ">
						    	<h3 style="">Please contact us when you have any questions in Cancer Stemness Online.</h3>
						    	<div class="ant-descriptions-view" style="margin-top:10px;margin-bottom:20px;">
			        				<table style="width:100%">
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Juan Xu,   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
												<p  class="font_tableRight">	Email  : xujuanbiocc@ems.hrbmu.edu.cn </p>
											</td>
			        					</tr>
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Yongsheng li,   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<p  class="font_tableRight">	Email  : liyongsheng@hainmc.edu.cn </p>
			        						</td>
			        					</tr>
<!-- 			        					<tr class="ant-descriptions-row"> -->
<!-- 			        						<th class="ant-descriptions-item-label"> -->
<!-- 			        							<p  class="font_tableLeft">	Xia Li,   </p> -->
<!-- 			        						</th> -->
<!-- 			        						<td class="ant-descriptions-item-content"> -->
<!-- 			        							<p  class="font_tableRight">	Email  : lixia@hrbmu.edu.cn </p> -->
<!-- 			        						</td> -->
<!-- 			        					</tr> -->
			        					
			        					<tr class="ant-descriptions-row">
			        						<th class="ant-descriptions-item-label">
			        							<p  class="font_tableLeft">	Laboratory,   </p>
			        						</th>
			        						<td class="ant-descriptions-item-content">
			        							<p class="font_tableRight">	Email  : bioinformatics2021@163.com </p>
			        						</td>
			        					</tr>
			        					
			        				</table>
			        			
			        			</div>
						    
						    </div>
						  </div>
						  
<!-- //////////////////////////  -->
						
						</div>
						 
						<script>
						
						layui.use('element', function(){
						  var element = layui.element;
						  
						  //…
						});
						</script>
          			</div>
          		</div>
          	

        	</div>
        </div>

    </section>

  </main>



  <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>

  <!-- Vendor JS Files -->
 

<script type="text/javascript">


</script>
</body>
</html>