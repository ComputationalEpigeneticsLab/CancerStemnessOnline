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
.methodDiscriptionDetail{margin-bottom:5px;}
#email_address_anno{
border-radius:10px;
height:80px;
width:520px;
color:white;
background:rgb(0,0,0,0.6);
z-index:1000;
position: absolute;
left: 92%;
top: 60%;
transform: translate(-50%, -50%);
text-align:center;
font-size:18px;
}
</style>
<%
String method=request.getParameter("method");
String type=request.getParameter("type");

%>
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
      <div class="container" style="margin-top:40px;">
        <h2><%=method %></h2>
        <div id="CytoTRACE_c" class="methodDiscription" style="display:none;">
        	<p class="methodDiscriptionDetail">CytoTRACE needs to input scRNA-seq data, convert the expression value into relative transcript number according to Census, and log it to obtain the expression profile of n gene *k cells. After that, the pearson correlation coefficient between the expression value of each gene and the gene count signature number was calculated, the top 200 most relevant genes were extracted, and the mean expression value of these genes in each cell was calculated to obtain GCS. After that, the top 1000 genes expressed in >5% of the cells with the largest variance were screened out, and the GCS was optimized using cell-cell correlation matrix and R package ‘nnls’. The cell stemness scores were normalized within 0 to 1.
        	</p > 
        	<p class="methodDiscriptionDetail">File format of expression profile:
        	<br/>I.The matrix must be genes (rows) by cells (columns). The row names should be the cell IDs and the column names should be the gene names.
        	<br/>II.The data must be delimited by tabs.
        	<br/>III.Uploaded data CAN NOT contain negative values. The normalization of TPM, FPKM, or RPKM are acceptable.
        	<br/>IV.Please DO NOT pre-filter the genes in the expression matrix.
        	
        	
        	</p>
        	<p class="methodDiscriptionDetail">
        	Column names of sample information file should be as same as example is.
        	</p>
        	<p class="methodDiscriptionPaper"> * : <a href="https://www.science.org/doi/full/10.1126/science.aax0249">
        	Gulati, G. et al. Single-cell transcriptional diversity is a hallmark of developmental potential. Science (New York, N.Y.) 367, 405-411, doi:10.1126/science.aax0249 (2020).
        	</a> </p>
										
        </div>
        <div id="SLICE_c" class="methodDiscription" style="display:none;">
        	<p class="methodDiscriptionDetail">
			SLICE, a novel algorithm that utilizes single-cell RNA-seq (scRNA-seq) to quantitatively measure cellular differentiation states based on single cell entropy and predict cell differentiation lineages via the construction of entropy directed cell trajectories.The cell stemness scores were normalized within 0 to 1.
			</p > 
        	<p class="methodDiscriptionDetail">File format of expression profile:
        	<br/>I.The matrix must be genes (rows) by cells (columns). The row names should be the cell IDs and the column names should be the gene names.
        	<br/>II.The data must be delimited by tabs.
        	<br/>III.Uploaded data CAN NOT contain negative values. The normalization of TPM, FPKM, or count are acceptable.
        	
        	</p>
        	<p class="methodDiscriptionDetail">
        	Column names of sample information file should be as same as example is.
        	</p>
        	<p class="methodDiscriptionPaper"> * : <a href="https://academic.oup.com/nar/article/45/7/e54/2725372?login=false">
        	Guo, M., Bao, E., Wagner, M., Whitsett, J. & Xu, Y. SLICE: determining cell differentiation and lineage based on single cell entropy. Nucleic acids research 45, e54, doi:10.1093/nar/gkw1278 (2017).
			</a> </p>
        </div>
        
        <div id="SCENT_c" class="methodDiscription" style="display:none;">
        	<p class="methodDiscriptionDetail">
			SCENT estimates the differentiation potential of a single cell by calculating the signal promiscuity or entropy of the cell transcriptome in the PPI interaction network. The cell stemness scores were normalized within 0 to 1. SCENT can be used to identify and quantify biologically relevant expression heterogeneity in single-cell populations, as well as to reconstruct cell-lineage trajectories from time-course data.
			</p > 
        	<p class="methodDiscriptionDetail">File format of expression profile:
        	<br/>I.The matrix must be genes (rows) by cells (columns). The row names should be the cell IDs and the column names should be the gene names.
        	<br/>II.The data must be delimited by tabs.
        	<br/>III.Uploaded data CAN NOT contain negative values. The normalization of TPM are acceptable.
        	</p>
        	<p class="methodDiscriptionDetail">
        	Column names of sample information file should be as same as example is.
        	</p>
        	<p class="methodDiscriptionPaper"> * : <a href="https://www.nature.com/articles/ncomms15599">
        	Teschendorff, A. & Enver, T. Single-cell entropy for accurate estimation of differentiation potency from a cell's transcriptome. Nature communications 8, 15599, doi:10.1038/ncomms15599 (2017).
			</a> </p>
        </div>
        <div id="StemID_c" class="methodDiscription" style="display:none;">
        	<p class="methodDiscriptionDetail">
			Pearson correlation coefficient of transcript measurement between cells is used as the distance metric to cluster the expression profile of single cells by k-medoids, and the cells are divided into different clusters. Then, in each cell, the entropy rate is calculated for each cell using the concept of entropy according to the number of transcripts of each gene in the cell and the total number of transcripts of the cell. Next, according to the results of cell clustering and entropy rate, a comprehensive entropy rate is calculated for each cell cluster according to the median and minimum values of the entropy rate of the cells in the cluster and the number of effective links in the cell cluster. The entropy rate is the final CSscore of cells in the cluster.The cell stemness scores were normalized within 0 to 1.
			</p > 
        	<p class="methodDiscriptionDetail">File format of expression profile:
        	<br/>I.The matrix must be genes (rows) by cells (columns). The row names should be the cell IDs and the column names should be the gene names.
        	<br/>II.The data must be delimited by tabs.
        	<br/>III.Only count value is acceptable.
        	</p>
        	<p class="methodDiscriptionDetail">
        	Column names of sample information file should be as same as example is.
        	</p>
        	<p class="methodDiscriptionPaper"> * : <a href="https://www.sciencedirect.com/science/article/pii/S1934590916300947?via%3Dihub">
				Grün, D. et al. De Novo Prediction of Stem Cell Identity using Single-Cell Transcriptome Data. Cell stem cell 19, 266-277, doi:10.1016/j.stem.2016.05.010 (2016).
			</a> </p>
        </div>
        
        <div id="StemSC_c" class="methodDiscription" style="display:none;">
        	<p class="methodDiscriptionDetail">
        	Firstly, the stemness-related genes was identified by selecting the genes significantly related to differentiation time. Then, 13 RNA-seq datasets from both the bulk and single-cell embryonic stem cell (ESC) samples were used to construct the reference relative expression orderings. Finally, the CSscore of a given sample was calculated as the percentage of gene pairs with the same REOs as the ESC samples.The cell stemness scores were normalized within 0 to 1.
			</p > 
        	<p class="methodDiscriptionDetail">File format of expression profile:
        	<br/>I.The matrix must be genes (rows) by cells (columns). The row names should be the cell IDs and the column names should be the gene names.
        	<br/>II.The data must be delimited by tabs.
        	<br/>III.Uploaded data CAN NOT contain negative values. The normalization of TPM, FPKM, RPKM or count are acceptable.
        	</p>
        	<p class="methodDiscriptionDetail">
        	Column names of sample information file should be as same as example is.
        	</p>
        	<p class="methodDiscriptionPaper"> * : <a href="https://stemcellres.biomedcentral.com/articles/10.1186/s13287-022-02803-5">
			Zheng, H. et al. StemSC: a cross-dataset human stemness index for single-cell samples. Stem cell research & therapy 13, 115, doi:10.1186/s13287-022-02803-5 (2022).
			</a> </p>
        </div>
        
      </div>
    </section>
    <section id="blog" class="blog">
      <div class="container">
        <div class="row">
        	<div class="col-lg-12 ">
        		<div class="sidebar" >
        			<div class="uploadTitle">
        				<i  class="fa fa-file-text-o" aria-hidden="true" style="font-size:30px;"></i> Data upload
        			</div>
        			
        			<div style="display: flex; margin-bottom: 30px;margin-top:30px;">
        				<div class="webserver-inputarea-left">
        					<div class="webserver-inputarea-tip">
        						<span>
									Expression profile
<!-- 									<span> -->
<!-- 										<i style="font-size:23px;" class="bx bx-info-circle"  ></i> -->
<!-- 									</span> -->
									
								</span>
        					</div>
        					<div class="article" >
														        	<div class="item">
															            <div class="addImg"  style="text-align:center;">															                
															                    <i  class="bx bx-cloud-upload bx" style="margin-top:60px; font-size:70px;"></i>															                
															            </div>
															            <input name="url" type="file" class="upload_input" id="upload_file_id" onchange="change(this)" />
															            <div class="preBlock">
															            	<table style="margin:auto;height: 100%;font-size:18px;display:none;" id="FileSuccessNameTable">
															            		<tr>
															            			<td>
															            				<i style="font-size:50px;" class="bx bx-file"  ></i>
															            				
															            			</td>
															            			<td style="width:10px;">
															            				<p> : </p>
															            			</td>
															            			<td>
													            						<p id="FileSuccessName" ></p>
													            					</td>
															            		</tr>
															            	</table>						                						             									
															            </div>
														            <div class="delete" id="del">×</div>
														        	</div>		       
							</div>
        				</div>
        				
        				<div class="webserver-inputarea-right">
        					<div class="webserver-inputarea-tip">
        						<span>
									 Sample information

									
								</span>
        					</div>
        					
        					<div class="article" >
														        	<div class="item">
															            <div class="addImg_symbol"  style="text-align:center;">															                
															                    <i  class="bx bx-cloud-upload bx" style="margin-top:60px; font-size:70px;"></i>															                
															            </div>
															            <input name="url" type="file" class="upload_input_symbol" id="upload_file_id_symbol" onchange="change_symbol(this)" />
															            <div class="preBlock_symbol">
															            	<table style="margin:auto;height: 100%;font-size:18px;display:none;" id="FileSuccessNameTable_symbol">
															            		<tr>
															            			<td>
															            				<i style="font-size:50px;" class="bx bx-file"  ></i>
															            				
															            			</td>
															            			<td style="width:10px;">
															            				<p> : </p>
															            			</td>
															            			<td>
													            						<p id="FileSuccessName_symbol" ></p>
													            					</td>
															            		</tr>
															            	</table>						                						             									
															            </div>
														            <div class="delete_symbol" id="del_symbol">×</div>
														        	</div>		       
							</div>
        					
        					
        				</div>
        			</div>
        			
        			
        			<div id="options">
        				
        				
        				<table style="margin-top:5px;font-size:20px;margin-left:-15px;border-collapse:separate; border-spacing:15px;">
        					<tr>
        						<td><div style="width:;"><p style="font-size:20px;font-weight:700;">Email address  </p></div> </td>
        						<td style="width:20px"></td>
        						<td >	
									<div style="width:500px;">
									<input class="qc_subTable_input1" type="text" id="email_address" name="email_address" lay-verify="title" autocomplete="off" placeholder=" Please input your email address" class="layui-input" >
									</div>								      			
								</td>
								
								<td valign="top">										      			
									<button id="choose_emil_select" class=""  type="button"   style="border-style: none;background:white;">
										<i style="font-size:20px;" class="bx bx-info-circle"  ></i>
									</button>
								</td>
        					</tr>
        					
<div id="email_address_anno" style="display:none;">
												<div style="width:96%;margin-left:2%;text-align:center;margin-top:20px;line-height:1.2;">
													<p >  The email address will be used to generate a unique job ID and notify you when the job is completed.</p>		
												</div>
</div>        					
        					
        				</table>
        				
        				<div id="Submit" style="margin-top:50px;text-align:center;margin-bottom:50px;">
        					<span>
								<input id="SubmitJob"   type = "submit" value="Submit" onclick="JobSubmit()"
																	style="height:40px;width:100px; border:1px solid #969696; border-radius:5px;font-size:20px;transition: ease-in all 0.25s;font-weight:bold;" 
																	onfocus="this.className='input_on';this.οnmοuseοut=''" 
																	onblur="this.className='input_off';this.οnmοuseοut=function(){this.className='input_out'};" 
																	onmousemove="this.className='input_move'" 
																	onmouseout="this.className='input_out'"
																/>
								<span>
									<button  class="" type="button" onclick="jobexample()"
													style="height:40px;width:100px; border:1px solid #969696; border-radius:5px;font-size:20px;transition: ease-in all 0.25s;font-weight:bold;" 
													onfocus="this.className='input_on';this.οnmοuseοut=''" 
													onblur="this.className='input_off';this.οnmοuseοut=function(){this.className='input_out'};" 
													onmousemove="this.className='input_move'" 
													onmouseout="this.className='input_out'">
													<a style='text-decoration:none;' href='#'>Example</a>
									</button>
								</span>
							</span>
						</div>
        				
        				
        				
<!--         				<div class="uploadTitle" style="margin-top:50px;"> -->
<!--         				<i   class="fa fa-search" aria-hidden="true" style="font-size:30px;"></i> Job Records -->
<!--         			</div> -->
        				
        			</div>
<div id="success_msg" style="display:none ;">
	<div style="text-align:right;">
		<a href='#' onclick="closeSuccess_msg()"> <i  class="bx bx-message-square-x bx-sm"></i></a>
				
	</div>
	<table style="text-align:left;margin-left:15px;width:100%;">
		<tr style="height:0px;"></tr>
		<tr>
			<td style="text-align:left;width:50px;"><i style="font-size:40px;" class='bx bx-loader bx-spin'></i></td>
			<td>
				<p id="jobID_show" style="font-size:20px;text-align:left;"></p>
			</td>
			
		</tr>
		<tr>
			<td></td>
			<td>
				<p  style="font-size:20px;text-align:left	;">
				You can wait here or we will email you after job complete.
				</p>
			</td>
		</tr>
	</table>
</div>       			
        		</div>
        	
        	</div>
				
          		

        	</div>
        </div>

    </section>

  </main>


  <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>
<input name="method"  id="method" type="hidden" value=<%=request.getParameter("method") %> >
<input name="type"  id="type" type="hidden" value=<%=request.getParameter("type") %> >

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
<script src="js/csIdentityUpload.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var timer=0;
$('#choose_emil_select').hover(function(){
    $('#email_address_anno').show();
    },function(){
    timer=setTimeout(function(){
        $('#email_address_anno').hide();
    },100);
});
$('#email_address_anno').mouseover(function(){
    //clearTimeout(timer);
    $('#email_address_anno').hide();
});
</script>
</body>
</html>