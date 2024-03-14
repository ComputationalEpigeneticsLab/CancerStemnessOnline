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
.fontStyle3{font-size:20px;margin-bottom:20px;}


.img_wrap{
	display        : flex;
    align-items    : center;
    justify-content: center;
    }
.img_wrap img{
		   width     : auto;
           height    : auto;
           max-width : 98%;
           max-height: 98%;
	}
.img_wrap2{
	display        : flex;
    align-items    : center;
    justify-content: center;
    }
.img_wrap2 img{
		   width     : auto;
           height    : auto;
           max-width : 80%;
           max-height: 80%;
	}
.img_wrap3{
	display        : flex;
    align-items    : center;
    justify-content: center;
    }
.img_wrap3 img{
		   width     : auto;
           height    : auto;
           max-width : 70%;
           max-height: 70%;
	}
.img_wrap4{
	display        : flex;
    align-items    : center;
    justify-content: center;
    }
.img_wrap4 img{
		   width     : auto;
           height    : auto;
           max-width : 65%;
           max-height: 65%;
	}
#geneScatter_msg{
width:80%;

height:520px;
z-index:9999;
border-radius:10px;
-webkit-box-shadow: 0 0 10px #999999;
-moz-box-shadow: 0 0 10px #999999;
box-shadow: 0 0 10px #999999;
background-color: white;
text-align: center;
        position: absolute;
        left: 50%;
        top:12%;
        transform: translate(-50%, -50%);
}
#cellstateScatter_msg{
width:80%;

height:520px;
z-index:9999;
border-radius:10px;
-webkit-box-shadow: 0 0 10px #999999;
-moz-box-shadow: 0 0 10px #999999;
box-shadow: 0 0 10px #999999;
background-color: white;
text-align: center;
        position: absolute;
        left: 50%;
        top:35%;
        transform: translate(-50%, -50%);
}

#hallmarkerScatter_msg{
width:80%;

height:520px;
z-index:9999;
border-radius:10px;
-webkit-box-shadow: 0 0 10px #999999;
-moz-box-shadow: 0 0 10px #999999;
box-shadow: 0 0 10px #999999;
background-color: white;
text-align: center;
        position: absolute;
        left: 50%;
        top:35%;
        transform: translate(-50%, -50%);
}
#immScatter_msg{
width:80%;

height:520px;
z-index:9999;
border-radius:10px;
-webkit-box-shadow: 0 0 10px #999999;
-moz-box-shadow: 0 0 10px #999999;
box-shadow: 0 0 10px #999999;
background-color: white;
text-align: center;
        position: absolute;
        left: 50%;
        top:35%;
        transform: translate(-50%, -50%);
}



.imgleft2{
width:50%;
float:left;
min-height:100px;
}
.imgleft2 img{
		   width     : auto;
           height    : auto;
           max-width : 99%;
           max-height: 99%;
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
           max-width : 99%;
           max-height: 99%;
	}
.imgleft{
width:49%;
float:left;
min-height:100px;
}
.imgright{
width:49%;
min-height:100px;
float:right;
}

.cell_infor_min_height{
min-height:500px;
margin-left:10px;
margin-bottom:20px;
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
          <li class="active"><a href="DownStream.jsp">Downstream</a></li>
          <li ><a href="data.jsp">Data</a></li>
          <li><a href="help.jsp">Help</a></li>

        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container" >
     
        
      </div>
    </section>
    <section id="blog" class="blog">
      <div class="container">
        <div class="row">
        	<div class="col-lg-12 ">
        		<div class="sidebar" >
        			<div id="overview">
	        			<div class="uploadTitle">
	        				<i  class="fa fa-file-text-o" aria-hidden="true" style="font-size:30px;"></i> Job overview
	        			</div>
	        			<div class="ant-descriptions-view" style="margin-top:10px;margin-bottom:20px;">
	        				<table style="width:100%">
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label">Job ID</th>
        						<td id="jobid" class="ant-descriptions-item-content"></td>
        					</tr>
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label">Algorithm</th>
        						<td id="method" class="ant-descriptions-item-content"></td>
        					</tr>
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label">Threshold of correlation</th>
        						<td id="corrthreshold" class="ant-descriptions-item-content"></td>
        					</tr>
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label">Data type</th>
        						<td id="datatype" class="ant-descriptions-item-content">single-cell RNA-seq</td>
        					</tr>
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label">Expression  file  </th>
        						<td id="expfile" class="ant-descriptions-item-content"></td>
        						<td id="" class="ant-descriptions-item-content">
        						<a id="download_exp" href="">
									<button style="height:35px;width:100px; border:1px solid #B0477E;color:white; background:#B0477E;opacity:0.8;border-radius:10px;font-size:16px;">Download</button>
	        					</a>
        						</td>
        					</tr>
<!--         					<tr class="ant-descriptions-row"> -->
<!--         						<th class="ant-descriptions-item-label">Sample  file  </th> -->
<!--         						<td id="samplefile" class="ant-descriptions-item-content"></td> -->
<!--         					</tr> -->
        					
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label">No. of cells</th>
        						<td id="samplenum" class="ant-descriptions-item-content"></td>
        					</tr>
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label">No. of genes</th>
        						<td id="genenum" class="ant-descriptions-item-content"></td>
        					</tr>
        				</table>
	        			
	        			</div>
        			</div>
        			
        			<div id="signature" style="margin-top:20px;">
        				<div class="uploadTitle">
	        				<i  class="fa fa-file-text-o" aria-hidden="true" style="font-size:30px;"></i> stemness-related signature
	        				<a id="signatureContentDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
								<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
							</a>
	        				
	        		
	        			</div>
        				<div id="signatureContent" style="margin-top:20px;width:98%;text-align:left; margin-left:1%;margin-bottom:20px;">
        					<table style="text-align:left;font-size:16px;" id="signatureTable" class="table table-bordered table-hover dataTable cell_infor_table_detail" >
									<thead style="text-align:left;font-size:18px;">
										<tr>
											<th>Gene </th>
											<th>R value</th>
											<th>P value</th>
											<th>FDR</th>
											<th>Detail</th>
										</tr>
									</thead>
								</table>
<div id="geneScatter_msg" style="display:none;">
	<div style="text-align:right;">
		<a href='#' onclick="closegeneScatter_msg()"> <i  class="bx bx-message-square-x bx-sm"></i></a>
	</div>
									<span>
										<strong style="font-size:20px;"> sctter plot of <font style="color:red;" id="sctter_gene_name"> AIMP1</font> </strong>
										<span>
											<a id="geneScatterPlotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
												<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
											</a>									     		
										</span>
									</span>
	<div class="img_wrap4">
		<img  id="geneScatterPlot" src="upload/2ZZ3LdJ4P8_111@qq.com/DownStream/scatter/AIMP1_scatter.png" alt="strem gene Scatter Plot"  >
	</div>
</div>								
        					<div id="sigGeneheatmap" style="margin-top:20px;">
        						
        						<span>
									<strong class="fontStyle3">The expression heatmap of top 50 signature genes</strong>
									<span>
										<a id="stremgeneplotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
											<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
										</a>									     		
									</span>
								</span>
        						<div  class="img_wrap">
									<img  id="stremgeneplot" src="smiley-2.gif" alt="strem gene expression between samples"  >
        						</div>
        						
        						<br/>
        						<span>
									
									<span>
									<strong class="fontStyle3">The tSNE plot based on stemness-related signature genes</strong>
									<span>
										<a id="stremgenetsneplotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
											<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
										</a>									     		
									
								</span>
        						<div  class="img_wrap4">
									<img  id="stremgenetsneplot" src="smiley-2.gif" alt="strem gene tsne between cells"  >
        						</div>
        					</div>
        				</div>
        			</div>
        			
        			<div id="function" style="margin-top:20px;">
        				<div class="uploadTitle">
	        				<i  class="fa fa-file-text-o" aria-hidden="true" style="font-size:30px;"></i> Function analysis
	        			</div>
        				<div class="layui-tab layui-tab-card">
						  <ul class="layui-tab-title">
						    <li class="layui-this" style="font-size:20px;font-weight:550;"> Cancer Hallmark</li>
						    <li style="font-size:20px;font-weight:550;">Immune Pathway</li>
						     <li style="font-size:20px;font-weight:550;">Cell State</li>
						  </ul>
						  <div class="layui-tab-content" >
						    <div class="layui-tab-item layui-show" >
						    	<div id="CancerhallmarkerAll" style="margin-left:10px;">
							    	<span>
										
											<a id="CancerhallmarkerTableDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
												<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
											</a>									     		
										
									</span>
								<br/><br/>
								<div>
									<table style="text-align:left;font-size:16px;width:100%;" id="CancerhallmarkerTable" class="table table-bordered table-hover dataTable cell_infor_table_detail" >
										<thead style="text-align:left;font-size:18px;">
											<tr>
												<th style="width:;">Hallmark</th>
												<th >Function</th>
												<th >R value</th>
												<th >P value</th>
												<th >FDR</th>
												<th>Detail</th>

											</tr>
										</thead>
									</table>

<div id="hallmarkerScatter_msg" style="display:none;">
	<div style="text-align:right;">
		<a href='#' onclick="closehallmarkerScatter_msg()"> <i  class="bx bx-message-square-x bx-sm"></i></a>
	</div>
									<span>
										<strong style="font-size:20px;"> sctter plot of <font style="color:red;" id="sctter_hallmarker_name"> AIMP1</font> </strong>
										<span>
											<a id="hallmarkerScatterPlotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
												<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
											</a>									     		
										</span>
									</span>
	<div class="img_wrap4">
		<img  id="hallmarkerScatterPlot" src="upload/2ZZ3LdJ4P8_111@qq.com/DownStream/scatter/AIMP1_scatter.png" alt="hallmarker Scatter Plot"  >
	</div>
</div>								
								</div>
								<br/>
									<div>
										<span>
											<strong class="fontStyle3">The heatmap for functional terms of cancer hallmarks</strong>
											<span>
												<a id="hallmarkerCorrPlotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
													<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
												</a>									     		
											</span>
										</span>
										<div id="" class="img_wrap">
											<img  id="hallmarkerCorrPlot" src="" alt="hallmarker GSVA Corr Plot"  >
										</div>
									</div>
									<div>
										<span>
											<strong class="fontStyle3">The visualization of associations among cancer stemness and cancer hallmarks</strong>
											<span>
												<a id="hallmarkerSpermanlotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
													<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
												</a>									     		
											</span>
										</span>
										<div id="" class="img_wrap2">
											<img  id="hallmarkerSpermanlot" src="" alt="hallmarker Sperman Plot"  >
										</div>
									</div>
									<br/>
								</div>
								
							</div>
						    <div class="layui-tab-item">
								<div id="immAll" style="margin-left:10px;">
									<span>
										
											<a id="immTableDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
												<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
											</a>									     		
										
									</span>
								<br/><br/>
									<table style="text-align:left;font-size:16px;width:100%;" id="immTable" class="table table-bordered table-hover dataTable cell_infor_table_detail" >
										<thead style="text-align:left;font-size:18px;">
											<tr>
												<th>Cell type</th>
												<th >R value</th>
												<th >P value</th>
												<th >FDR</th>
												<th>Detail</th>
											</tr>
										</thead>
									</table>
<div id="immScatter_msg" style="display:none;">
	<div style="text-align:right;">
		<a href='#' onclick="closeimmScatter_msg()"> <i  class="bx bx-message-square-x bx-sm"></i></a>
	</div>
									<span>
										<strong style="font-size:20px;"> sctter plot of <font style="color:red;" id="sctter_imm_name"> AIMP1</font> </strong>
										<span>
											<a id="immScatterPlotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
												<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
											</a>									     		
										</span>
									</span>
	<div class="img_wrap4">
		<img  id="immScatterPlot" src="upload/2ZZ3LdJ4P8_111@qq.com/DownStream/scatter/AIMP1_scatter.png" alt="Immune cell Scatter Plot"  >
	</div>
</div>								
								<br/>
									<div>
										<span>
											<strong class="fontStyle3">
											The heatmap for functional terms of immune pathway
											</strong>
											<span>
												<a id="immCorrPlotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
													<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
												</a>									     		
											</span>
										</span>
										<div id="" class="img_wrap">
											<img  id="immCorrPlot" src="" alt="hallmarker GSVA Corr Plot"  >
										</div>
									</div>
									<div>
										<span>
											<strong class="fontStyle3">The visualization of associations among cancer stemness and immune pathway </strong>
											<span>
												<a id="immSpermanlotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
													<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
												</a>									     		
											</span>
										</span>
										<div id="" class="img_wrap3">
											<img  id="immSpermanlot" src="" alt="hallmarker Sperman Plot"  >
										</div>
									</div>
									<br/>
								</div>


							</div>
 							<div class="layui-tab-item">
 								<div id="cellstateAll" style="margin-left:10px;">
									<span>
										
											<a id="cellstateTableDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
												<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
											</a>									     		
										
									</span>
								<br/><br/>
									<table style="text-align:left;font-size:16px;width:100%;" id="cellstateTable" class="table table-bordered table-hover dataTable cell_infor_table_detail" >
										<thead style="text-align:left;font-size:18px;">
											<tr>
												<th>Cell type</th>
												<th >R value</th>
												<th >P value</th>
												<th >FDR</th>
												<th>Detail</th>
											</tr>
										</thead>
									</table>
<div id="cellstateScatter_msg" style="display:none;">
	<div style="text-align:right;">
		<a href='#' onclick="closecellstateScatter_msg()"> <i  class="bx bx-message-square-x bx-sm"></i></a>
	</div>
									<span>
										<strong style="font-size:20px;"> sctter plot of <font style="color:red;" id="sctter_cellstate_name"> AIMP1</font> </strong>
										<span>
											<a id="cellstateScatterPlotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
												<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
											</a>									     		
										</span>
									</span>
	<div class="img_wrap4">
		<img  id="cellstateScatterPlot" src="upload/2ZZ3LdJ4P8_111@qq.com/DownStream/scatter/AIMP1_scatter.png" alt="cellstate Scatter Plot"  >
	</div>
</div>								
								<br/>
									<div>
										<span>
											<strong class="fontStyle3">The heatmap for functional terms of cell state</strong>
											<span>
												<a id="cellstateCorrPlotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
													<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
												</a>									     		
											</span>
										</span>
										<div id="" class="img_wrap">
											<img  id="cellstateCorrPlot" src="" alt="cellstate GSVA Corr Plot"  >
										</div>
									</div>
									<div>
										<span>
											<strong class="fontStyle3">The visualization of associations among cancer stemness and cell state
</strong>
											<span>
												<a id="cellstateSpermanlotDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
													<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
												</a>									     		
											</span>
										</span>
										<div id="" class="img_wrap3">
											<img  id="cellstateSpermanlot" src="" alt="cellstate Sperman Plot"  >
										</div>
									</div>
									<br/>
								</div>
 							
 							</div>
						  </div>
						</div>
        			</div>
        			
        			<div id="cell_cell_com" style="margin-top:20px;">
        				<div class="uploadTitle">
	        				<i  class="fa fa-file-text-o" aria-hidden="true" style="font-size:30px;"></i> Communications to immune cells
	        				<span>
												<a id="italkTableDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
													<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
												</a>									     		
											</span>
	        			</div>
	        			
        				<div style="margin-top:10px;margin-bottom:20px;" id="cell_cell_content">
        			
										
	        					<table style="text-align:left;font-size:16px;width:100%;margin-top:10px;" id="italkTable" class="table table-bordered table-hover dataTable cell_infor_table_detail" >
										<thead style="text-align:left;font-size:18px;">
											<tr>
												<th>Sending Cell Type</th>
												<th>Ligand</th>
												<th>Receiving Cell Type</th>
												<th>Receptor</th>
												<th>Function</th>
												<th>Score</th>
											</tr>
										</thead>
									</table>
									<div class="cell_infor_min_height"   id="italk_cellcell_river_father">
								              	<div style="" id="italk_cellcell_river"></div>
								     </div>
								     <div class="cell_infor_min_height"   id="italk_cellcell_circos_father">
								              	<div style="" id="italk_cellcell_circos"></div>
								      </div>
	        			</div>
        			</div>
        			
        			<div id="method_compare">
        				<div class="uploadTitle">
	        				<i  class="fa fa-file-text-o" aria-hidden="true" style="font-size:30px;"></i> Robustness evaluation
	        				<span>
										<a id="method_compareTableDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
											<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
										</a>									     		
									</span>
	        			</div>
	        			
								
								<div id="jobid_compare" style="margin-top:10px;margin-left:10px;margin-bottom:50px;">
									<div id="both_all" style="">
										<table style="text-align:left;font-size:16px;width:100%;" id="method_compareTable" class="table table-bordered table-hover dataTable cell_infor_table_detail" >
											<thead style="text-align:left;font-size:18px;">
												<tr>
													<th style="">Sample </th>
													<th id="basemethod">basemethod</th>
													<th >Supervised_StemSC</th>
													<th >Unsupervised_CytoTRACE</th>
													
												</tr>
											</thead>
										</table>
										<br/>
										<div id="both_img_l" class="imgleft2">
											<img  id="method_compareTable_left" src="" alt=" mRNAsi scatter"  >
										</div>
										<div id="both_img_r" class="imgright2">
											<img  id="method_compareTable_right" src="" alt=" CytoTRACE scatter"  >
										</div>
									</div>
									<div id="mRNAsi_all" style="display:none;">
										<table style="text-align:left;font-size:16px;width:100%;" id="method_compareTable_mRNAsi" class="table table-bordered table-hover dataTable cell_infor_table_detail" >
											<thead style="text-align:left;font-size:18px;">
												<tr>
													<th style="width:;">Sample </th>
													<th id="basemethod1">basemethod</th>
													<th >Unsupervised_CytoTRACE</th>
	
												</tr>
											</thead>
											
										</table>
										<div id="mRNAsi_img" class="img_wrap4"  >
											<img  id="method_compareTable_mRNAsi_img" src="" alt=" CytoTRACE scatter"  >
										</div>
									
									</div>
									<div id="CytoTRACE_all" style="display:none;">
										<table style="text-align:left;font-size:16px;width:100%;" id="method_compareTable_CytoTRACE" class="table table-bordered table-hover dataTable cell_infor_table_detail" >
											<thead style="text-align:left;font-size:18px;">
												<tr>
													<th style="width:;">Sample </th>
													<th id="basemethod2">basemethod</th>
													<th >  Supervised_StemSC</th>
												</tr>
											</thead>
										</table>
										<div id="CytoTRACE_img" class="img_wrap4" >
											<img  id="method_compareTable_CytoTRACE_img" src="" alt=" mRNAsi scatter"  >
										</div>
									</div>
								</div>
	        			
        			</div>
        			
        			
        			<div class="uploadTitle" style="margin-bottom:50px;">
        			<a href="exampleDownStreamResultBulk.jsp">
	        				<i class="fa fa-eye" aria-hidden="true" style="font-size:30px;"></i> View example of bulk data
	        				</a>
	        			</div>
        			
        			
        		</div>
        	
        	</div>
				
          		

        	</div>
        </div>

    </section>

  </main>


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
<script src="js/exampledownstreamResultSingle.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

</script>
</body>
</html>