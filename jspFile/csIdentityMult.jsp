<%@ page import="Util.*" import="java.sql.*" import="java.util.ArrayList" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/loadingUse.css" rel="stylesheet">
<script type="text/javascript">

//document.onreadystatechange = subSomething;
//加载状态为complete时移除loading效果
// function subSomething() {
//     //当页面加载状态
//     if (document.readyState == "complete") {
//         //延迟一秒关闭loading
//         $('#loading').delay(500).hide(0);
        
//     }
// }

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
.leftStyle{margin-top:15px; cursor: pointer;font-size: 25px;}
.leftStyle:hover {color: #C4859D;}
.leftStyleActivate{margin-top:15px; cursor: pointer;color:#C4859D;font-size: 25px;}
.methodSelectDiv{width:100%;margin-left:0%;height:50px;background-color:#F5ECEF;opacity:;text-align:center;line-height:50px;margin-top:10px;}
.methodNameStyle{font-size:20px;cursor: pointer;}
.methodNameStyle:hover {color: #C4859D;}
.methodNameStyle_li{font-size:30px;color:#C4859D;}
.dis_m{font-size:16px !important;}
.methodName{font-size: 20px; cursor: pointer;}


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
              <li ><a href="csIdentity.jsp">Single method</a></li>
              <li class="active"><a href="csIdentityMult.jsp">Multiple method</a></li>
             
            </ul>
          </li>
          <li><a href="DownStream.jsp">Downstream</a></li>
          <li ><a href="data.jsp">Data</a></li>
          <li><a href="help.jsp">Help</a></li>

        </ul>
      </nav>

    </div>
  </header>
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container" style="margin-top:40px;">
        <h2>Upload data and choose methods to assess stemness scores</h2>
      </div>
    </section>
    <section id="blog" class="blog">
      <div class="container">
        <div class="row">
        	
				<div class="col-lg-4 ">
          			<div class="sidebar" style="padding: 10px;">
          			<h3><strong >Quick selection</strong></h3>
          				<div style="margin-left:5%;">
          				
          					<div id="singlenodel"  class="leftStyleActivate" >
	          					<h3><strong onclick="selectMethod('single')" style="font-size: 25px !important;">Single cell</strong></h3>
	          				</div>
	          				<div id="bulknodel" class="leftStyle">
	          					<h3><strong onclick="selectMethod('bulk')" style="font-size: 25px !important;">Bulk</strong></h3>
	          				</div>
	          				
	          				<div id="supervisednodel" class="leftStyle">
	          					<h3><strong onclick="selectMethod('supervised')" style="font-size: 25px !important;">Supervised method</strong></h3>
	          				</div>
	          				<div id="unsupervisednodel" class="leftStyle">
	          					<h3><strong onclick="selectMethod('unsupervised')" style="font-size: 25px !important;">Unsupervised method</strong></h3>
	          				</div>
          				</div>
          				
          				<br/>
          			</div>
          		</div>
          		<div class="col-lg-8 entries">
          			<div class="sidebar">
<!-- ### inputContent start################## -->          				
          				<div id="inputContent" style="max-height:;overflow:auto; ">
          					<h3><strong style="color:#C4859D;">Select methods</strong></h3>
          					<br/>
<!--           					<p class="methodDiscriptionFont">  -->
<!--           					Choose methods( Method performance here ). -->
<!--           					</p> -->
          					

   
          					
          					<div class="methodSelectDiv" >
          					
          						<strong class="methodName" title="Bulk / Supervised methods" onclick="SelectMethodsDiscription('mRNAsiInput')">mRNAsi</strong> 
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('mRNAsiInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="mRNAsiInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
				                
          					</div>
          					
 <!-- 			                StemnessIndex -->
			                <div class="methodSelectDiv">
			                
          						 <strong  class="methodName " title="Bulk / Supervised methods" onclick="SelectMethodsDiscription('StemnessIndexInput')"> StemnessIndex</strong> 
          						   
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemnessIndexInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemnessIndexInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
			              
			               
          				
          					
          					<div class="methodSelectDiv">
          						<strong  class="methodName " title="Single Cell/ Unsupervised methods" onclick="SelectMethodsDiscription('CytoTRACEInput')">CytoTRACE</strong> 
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('CytoTRACEInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="CytoTRACEInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					
			                
			                <div class="methodSelectDiv">
          						<strong  class="methodName " title="Single Cell/ Unsupervised methods" onclick="SelectMethodsDiscription('SLICEInput')">SLICE</strong> 
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('SLICEInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="SLICEInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					
			                
			                <div class="methodSelectDiv">
          						<strong  class="methodName " title="Single Cell/ Unsupervised methods" onclick="SelectMethodsDiscription('SCENTInput')">SCENT</strong> 
          						
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('SCENTInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="SCENTInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					
			                
			                <div class="methodSelectDiv">
          						<strong  class="methodName " title="Single Cell/ Unsupervised methods" onclick="SelectMethodsDiscription('StemIDInput')">StemID</strong> 
          						
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemIDInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemIDInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					
			                
			                <div class="methodSelectDiv">
          						<strong  class="methodName " title="Single Cell/ Supervised  methods" onclick="SelectMethodsDiscription('StemSCInput')">StemSC</strong> 
          						
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('StemSCInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="StemSCInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
          					</div>
          					
			                
			                <div class="methodSelectDiv">
          						
          						<strong  class="methodName " title="Bulk / Single Cell/ Unsupervised   methods" onclick="SelectMethodsDiscription('GSVAInput')">GSVA</strong> 
          						
          						<button  type="button" class="btn btn-tool" onclick="SelectMethodsDiscription('GSVAInput')" style="float: right; margin-right: 8px;margin-top:3px;">
				                	<i id="GSVAInput" class="fa fa-toggle-off" aria-hidden="true" style="font-size:30px;color:#C4859D;"></i>
				                </button>
				                
          					</div>
          					<article id="GSVAInputContent" class="entry entry-single" style='margin-top:-20px;width:100%;display:none;'>
	          					<div class="entry-content" >
		          					<blockquote>
					                  
					                  <table style="margin-top:5px;font-size:20px;margin-left:-75px;border-collapse:separate; border-spacing:15px;width:100%;">
			        					<tr id="gsvaOption">
											<td>
												<div  style="width:280px;"><p style="font-size:20px;font-weight:700">Stemness marker gene set </p></div>
											</td>
											
											<td style="width:10px"></td>
											<td>
												<div id="geneset" style="width:300px;"></div>
												
											</td>
											
			<!-- 								<td valign="top">										      			 -->
			<!-- 									<button id="choose_geneset" class=""  type="button"   style="border-style: none;background:white;"> -->
			<!-- 										<i style="font-size:20px;" class="bx bx-info-circle"  ></i> -->
			<!-- 									</button> -->
			<!-- 								</td> -->
										</tr>
			        				   </table>
					                  
					                </blockquote>
				                </div>
			                </article>
			                
			                
			               <br/><br/>
          				</div>
<!-- ### inputContent end################## -->

						<div id="Submit" style="margin-top:20px;text-align:center;margin-bottom:30px;margin-left:0px;">
        					<span>
								<input id="SubmitJob"   type = "submit" value="Submit" onclick="JobSubmit()"
																	style="height:40px;width:100px; border:1px solid #969696; border-radius:5px;font-size:20px;transition: ease-in all 0.25s;font-weight:bold;" 
																	onfocus="this.className='input_on';this.οnmοuseοut=''" 
																	onblur="this.className='input_off';this.οnmοuseοut=function(){this.className='input_out'};" 
																	onmousemove="this.className='input_move'" 
																	onmouseout="this.className='input_out'"
																/>
																
							</span>
							<span>
									<button  class="" type="button" onclick="jobexampleMult()"
													style="height:40px;width:100px; border:1px solid #969696; border-radius:5px;font-size:20px;transition: ease-in all 0.25s;font-weight:bold;" 
													onfocus="this.className='input_on';this.οnmοuseοut=''" 
													onblur="this.className='input_off';this.οnmοuseοut=function(){this.className='input_out'};" 
													onmousemove="this.className='input_move'" 
													onmouseout="this.className='input_out'">
													<a style='text-decoration:none;' href='#'>Example</a>
									</button>
								</span>
						</div>
          			</div>
          		</div>

        	</div>
        </div>

    </section>
    
<input name="mRNAsiInputMark"  id="mRNAsiInputMark" type="hidden" value='nonSelect' >
<input name="StemnessIndexInputMark"  id="StemnessIndexInputMark" type="hidden" value='nonSelect' >
<input name="CytoTRACEInputMark"  id="CytoTRACEInputMark" type="hidden" value='nonSelect' >
<input name="SLICEInputMark"  id="SLICEInputMark" type="hidden" value='nonSelect' >
<input name="SCENTInputMark"  id="SCENTInputMark" type="hidden" value='nonSelect' >
<input name="StemIDInputMark"  id="StemIDInputMark" type="hidden" value='nonSelect' >
<input name="StemSCInputMark"  id="StemSCInputMark" type="hidden" value='nonSelect' >
<input name="GSVAInputMark"  id="GSVAInputMark" type="hidden" value='nonSelect'  >

  </main>

  <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>

 
<script src="js/csIdentityMult.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">


</script>
</body>
</html>