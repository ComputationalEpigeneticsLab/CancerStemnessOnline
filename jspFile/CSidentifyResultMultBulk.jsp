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
          <li class="active drop-down"><a href="">CSscore</a>
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
        						<th class="ant-descriptions-item-label">Data type</th>
        						<td id="datatype" class="ant-descriptions-item-content"></td>
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
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label">Sample  file  </th>
        						<td id="samplefile" class="ant-descriptions-item-content"></td>
        						<td id="" class="ant-descriptions-item-content">
        						<a id="download_sample" href="">
									<button style="height:35px;width:100px; border:1px solid #B0477E;color:white; background:#B0477E;opacity:0.8;border-radius:10px;font-size:16px;">Download</button>
	        					</a>
        						</td>
        					</tr>
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label" id="dis_sample">No. of samples</th>
        						<td id="samplenum" class="ant-descriptions-item-content"></td>
        					</tr>
        					<tr class="ant-descriptions-row">
        						<th class="ant-descriptions-item-label">No. of genes</th>
        						<td id="genenum" class="ant-descriptions-item-content"></td>
        					</tr>
        				</table>
        			
        			</div>
        			<div class="uploadTitle">
        				<i  class="fa fa-th-list" aria-hidden="true" style="font-size:30px;"></i> Result 
        			</div>
        			
        			<div style=" margin-bottom: 30px;margin-top:30px;">
        				
        					<div >
        						<span>
									<strong style="font-size:20px;">Cancer stemness score </strong> 
									<span>
										<a id="csScoreDownload" href="download_loading.jsp?path=example/example_normal/Res_cellPredictDownload.txt&name=example_normal.txt" title="download table">
											<i class="fa fa-arrow-circle-o-down" aria-hidden="true" style="font-size:23px;" ></i>
										</a>									     		
									</span>
								</span>
        					</div>
        					<div style="margin-top:10px;max-height:500px;overflow:auto;width:100%;" >
	        					<table style="width:98%;text-align:left; " id="CSscoreTable" class="table table-bordered table-hover dataTable cell_infor_table_detail" >
									<thead >
										<tr>
											<th id="table_sample">Sample</th>
											<th>CSscore </th>
										</tr>
									</thead>
								</table>
        					</div>
        					<br/>
        					<div >
        						<span>
									<strong style="font-size:20px;" id="plot_sample">Distribution of sample CSscore </strong> 
								</span>
        					</div>
        					<div id="barplot"></div>
        				
        			</div>
        			
        			
        			<div id="" style="margin-top:10px;margin-bottom:10px;">
        				
        			
        			<div id="bulk">
	        			<div class="uploadTitle" >
	        				<i  class="fa fa-th-list" aria-hidden="true" style="font-size:30px;"></i> Clinical feature analysis
	        			</div>
	        			
	        			<div class="layui-tab layui-tab-card" id="bulkOption">
						  <ul class="layui-tab-title" style="font-size:18px;font-weight:550">
						    <li class="layui-this">Treatment history</li>
						    <li>Tumor stage</li>
						    <li>Sex</li>
						    <li>Smoke history</li>
						    <li>Alcohol history</li>
						    <li>Demographic</li>
						    
						    <li>TMB</li>
						    <li>Mutation</li>
						    <li>Diagnosis age</li>
						  </ul>
						  <div class="layui-tab-content" style="min-height: 500px;">
						    <div class="layui-tab-item layui-show">
								<div id="treatment_pie" class="imgleft"></div>
								<div id="treatment_violin" class="imgright"></div>
							</div>
						    <div class="layui-tab-item">
								<div id="tumor_stage_pie" class="imgleft"></div>
								<div id="tumor_stage_violin" class="imgright"></div>
						    </div>
						    <div class="layui-tab-item">
								<div id="sex_pie" class="imgleft"></div>
								<div id="sex_violin" class="imgright"></div>
						    </div>
						    <div class="layui-tab-item">
								<div id="smoke_history_pie" class="imgleft"></div>
								<div id="smoke_history_violin" class="imgright"></div>
						    </div>
						    <div class="layui-tab-item">
								<div id="alcohol_history_pie" class="imgleft"></div>
								<div id="alcohol_history_violin" class="imgright"></div>
						    </div>
						    <div class="layui-tab-item">
								<div id="demographic_pie" class="imgleft"></div>
								<div id="demographic_violin" class="imgright"></div>
						    </div>
						    <div class="layui-tab-item">
								<div id="TMB_bar" class="imgleft2"></div>
								<div id="" class="imgright2">
									<img  id="TMB_scatter" src="" alt="TMB scatter"  >
								</div>
						    </div>
						    <div class="layui-tab-item">
								<div id="Mutation_bar" class="imgleft2"></div>
								<div id="" class="imgright2">
									<img  id="Mutation_scatter" src="" alt="Mutation scatter"  >
								</div>
						    </div>
						    <div class="layui-tab-item">
								<div id="diagnosis_age_bar" class="imgleft2"></div>
								<div id="" class="imgright2">
									
									<img  id="diagnosis_age_scatter" src="" alt=" diagnosis age scatter"  >
									
								</div>
						    </div>
						  </div>
						</div>
        				
        			</div>
        			
        			
        			
        			
        			<br/>
        			<div style="text-align:left;">
        			<div class="uploadTitle">
        				<i  class="fa fa-th-list" aria-hidden="true" style="font-size:30px;"></i> Downstream analysis
        			</div>
        			<div> 
        				<p style="font-size:17px;margin-top:10px;">
        					Users can explore stemness-related signature genes, correlated functions and assess robustness of chose method. Besides, a stemness-related survival analysis will be performed if giving information.
        				
        				</p>
        			</div>
        			<div id="Submit" style="margin-top:20px;margin-left:44%">
							<input id="DownStreamSubmit"   type = "submit" value="Go" onclick="DownStreamSubmit()"
																	style="height:40px;width:80px; border:1px solid #969696; border-radius:5px;font-size:20px;transition: ease-in all 0.25s;font-weight:bold;" 
																	onfocus="this.className='input_on';this.οnmοuseοut=''" 
																	onblur="this.className='input_off';this.οnmοuseοut=function(){this.className='input_out'};" 
																	onmousemove="this.className='input_move'" 
																	onmouseout="this.className='input_out'"
																/>
						</div>
						<br/><br/>
					</div>
        		</div>
        	
        	</div>
				
          		

        	</div>
        </div>

    </section>

  </main>


  <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>
<input name="UserTaskID"  id="UserTaskID" type="hidden" value=<%=request.getParameter("UserTaskID") %> >
<input name="Method"  id="Method" type="hidden" value=<%=request.getParameter("Method") %> >

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
<script src="js/csIdentityResultMultBulk.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">




</script>
</body>
</html>