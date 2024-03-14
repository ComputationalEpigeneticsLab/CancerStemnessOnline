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
left: 95%;
top: 61%;
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
        
        <div id="mRNAsi_c" class="methodDiscription" style="display:none;">
        	<p class="methodDiscriptionDetail">
        	First, stem cells were extracted to build a model by one-class logistic regression machine learning algorithm. Then, regression coefficients of transcriptome of stemness were obtained. Then, a given sample can be assessed based on the reference model. And a CSscore represents the correlation between the given sample and reference. The cell stemness scores were normalized within 0 to 1.
			</p > 
        	<p class="methodDiscriptionDetail">File format of expression profile:
        	<br/>I.The matrix must be genes (rows) by cells (columns). The row names should be the cell IDs and the column names should be the gene names.
        	<br/>II.The data must be delimited by tabs.
        	<br/>III.Uploaded data CAN NOT contain negative values. The normalization of TPM is acceptable.
        	</p>
        	<p class="methodDiscriptionDetail">
        	Column names of sample information file should be as same as example is.
        	</p>
        	<p class="methodDiscriptionPaper"> * : <a href="https://www.sciencedirect.com/science/article/pii/S0092867418303581?via%3Dihub">
        	Malta, T. et al. Machine Learning Identifies Stemness Features Associated with Oncogenic Dedifferentiation. Cell 173, 338-354.e315, doi:10.1016/j.cell.2018.03.034 (2018).
			</a> </p>
        </div>
		
		<div id="StemnessIndex_c" class="methodDiscription" style="display:none;">
        	<p class="methodDiscriptionDetail">
        	First, stem cell samples and normal samples from different tissues are used to develop the stemness index based on REO (relative expression orders),
        	 and gene pairs with certain expression orders (Gi &gt; Gj or Gi &lt; Gj) are retained in at least 99% of stem cell samples. REO (Gi &lt; Gj or Gi &gt; Gj) with orders inversion in at least 99% of normal adult tissue samples is taken as reference REO. Finally, the CSscore is the ratio of gene pairs with the same expression orders as the reference REOs to the total number of reference REOs. The cell stemness scores were normalized within 0 to 1.
			</p > 
        	<p class="methodDiscriptionDetail">File format of expression profile:
        	<br/>I.The matrix must be genes (rows) by cells (columns). The row names should be the cell IDs and the column names should be the gene names.
        	<br/>II.The data must be delimited by tabs.
        	<br/>III.Uploaded data CAN NOT contain negative values. The normalization of TPM, FPKM, RPKM or count are acceptable.
        	</p>
        	<p class="methodDiscriptionDetail">
        	Column names of sample information file should be as same as example is.
        	</p>
        	<p class="methodDiscriptionPaper"> * : <a href="https://academic.oup.com/bib/article-abstract/22/2/2151/5771212?redirectedFrom=fulltext&login=false">
			Zheng, H. et al. An absolute human stemness index associated with oncogenic dedifferentiation. Briefings in bioinformatics 22, 2151-2160, doi:10.1093/bib/bbz174 (2021).
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
        				<div>
        					<span>
        						<span style="font-size:25px;font-weight:580;">
        						<i class="fa fa-cog" aria-hidden="true" style="font-size:25px;"></i> Options
        						</span>
        					</span>
        				</div>
        				
        				<table style="margin-top:5px;font-size:20px;margin-left:2%;border-collapse:separate; border-spacing:15px;">
        					<tr>
        						<td><div style="width:;"><p style="font-size:20px;">Email address : </p></div> </td>
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
        					
        					
        					
        				</table>
<div id="email_address_anno" style="display:none;">
												<div style="width:96%;margin-left:2%;text-align:center;margin-top:20px;line-height:1.2;">
													<p >  The email address will be used to generate a unique job ID and notify you when the job is completed.</p>		
												</div>
</div>         				
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
									<button  class="" type="button" onclick="jobexampleBulk()"
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
				<p  style="font-size:20px;text-align:left;">
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