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
.fontStyle1{font-size:25px;min-width:300px;font-weight:500;margin-bottom:10px;}
.fontStyle2{font-size:25px;margin-bottom:20px;}
.title1{font-size:25px;margin-top:0px;font-weight:580;margin-left:10px;}

.inputText{
border: 1px solid #C7C7C7;border-radius:7px;height:45px;width:100%;
}
.input2{width:80%;margin-left:20px;margin-top:10px;}
.selectone{width:80%;}
.fileuploadCSS1 {
            border: 1px solid #C7C7C7;
			border-radius:5px;
			margin-left:10px;
            height: 150px;
            width:80%;
            margin-left:20px;
            margin-top:10px;
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
          <li class=" drop-down"><a href="">CSscore</a>
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
      <div class="container" style="margin-top:40px;">
        <h2>Downstream analysis for exploring signature genes and correlation with cancer immunity</h2>
      </div>
    </section>
    <section id="blog" class="blog">
      <div class="container">
        <div class="row">
        	<div class="col-lg-12 " >
        		
        		<div  style="margin-top:-10px;">
        			
        			<div class="layui-tab layui-tab-card">
					  <ul class="layui-tab-title" >
					    <li class="layui-this"> <font class="fontStyle1">Job ID</font> </li>
					    <li> <font class="fontStyle1">Your own file</font> </li>
					  </ul>
					  <div class="layui-tab-content" style="min-height:100px;">
					    <div class="layui-tab-item layui-show">
					    	<div style="margin-left:10%;">
								<div id="jobIDinput">
									<span>
										<font class="title1"> Job ID</font>
									</span>
									<div class="input2">
										<input class="inputText" type="text" id="jobID" name="jobID" lay-verify="title" autocomplete="off" placeholder=" Please input or Paste  your job ID" class="layui-input" >
									</div>
								</div>
								<div id="jobIDsignature" style="margin-top:10px;">
									<span>
										<font class="title1"> Threshold for stemness signature</font>
<!-- 										<span> -->
<!-- 											<i style="font-size:20px;" class="bx bx-info-circle"  ></i> -->
<!-- 										</span> -->
									</span>
									<div id="jobIDthreshold"  class="selectone"></div>
								</div>
								<div id="jobIDclinical" style="margin-top:10px;">
									<span>
										<font class="title1"> Clinical data (optional)</font>
										
									</span>
									<div class="fileuploadCSS1" >
															<div class="item">
															            <div class="addImg_id_clinical"  style="text-align:center;">															                
															                    <i  class="bx bx-cloud-upload bx" style="margin-top:50px; font-size:70px;"></i>															                
															            </div>
															            <input name="url" type="file" class="upload_input_id_clinical" id="upload_file_id_id_clinical" onchange="change_id_clinical(this)" />
															            <div class="preBlock_id_clinical">
															            	<table style="margin:auto;height: 100%;font-size:18px;display:none;" id="FileSuccessNameTable_id_clinical">
															            		<tr>
															            			<td>
															            				<i style="font-size:50px;" class="bx bx-file"  ></i>
															            				
															            			</td>
															            			<td style="width:10px;">
															            				<p> : </p>
															            			</td>
															            			<td>
													            						<p id="FileSuccessName_id_clinical" ></p>
													            					</td>
															            		</tr>
															            	</table>						                						             									
															            </div>
														            <div class="delete_id_clinical" id="del_id_clinical">×</div>
														      </div>		       
									</div>
								</div>
								
								<div id="jobIDsubmit" style="margin-top:50px;margin-left:10px;margin-bottom:50px;">
									<span>
										<input id="JobIDSubmit"   type = "submit" value="Submit" onclick="JobIDSubmit()"
																	style="height:40px;width:100px; border:1px solid #969696; border-radius:5px;font-size:20px;transition: ease-in all 0.25s;font-weight:bold;" 
																	onfocus="this.className='input_on';this.οnmοuseοut=''" 
																	onblur="this.className='input_off';this.οnmοuseοut=function(){this.className='input_out'};" 
																	onmousemove="this.className='input_move'" 
																	onmouseout="this.className='input_out'"
																/>
										<span>
										
											<button  class="" type="button" onclick="viewexample()"
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
								
							</div>
						</div>
					    <div class="layui-tab-item">
							<div style="margin-left:10%;">
								<div id="userEmail">
									<span>
										<font class="title1"> Email address</font>
										
									</span>
									<div style="" class="input2">
										<input class="inputText" type="text" id="useremail" name="useremail" lay-verify="title" autocomplete="off" placeholder=" Please input  your email address" class="layui-input" >
									</div>
								</div>
								
								<div id="" style="margin-top:10px;">
									<span>
										<font class="title1"> Data type</font>
										
									</span>
									<div id="userfiletype" class="selectone"></div>
								</div>
								
								<div id="userSignature" style="margin-top:10px;">
									<span>
										<font class="title1"> Threshold for stemness signature</font>
										
									</span>
									<div id="userthreshold" class="selectone"></div>
								</div>
								
								<div id="userCSscore" style="margin-top:10px;">
									<span>
										<font class="title1"> Expression profile</font>
										
									</span>
									<div class="fileuploadCSS1" >
										<div class="item">
											<div class="addImg"  style="text-align:center;">															                
												<i  class="bx bx-cloud-upload bx" style="margin-top:30px; font-size:70px;"></i>															                
											</div>
											<input name="url" type="file" class="upload_input" id="upload_file_score" onchange="change(this)" />
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
								
								
								<div id="userclinical" style="margin-top:10px;">
									<span>
										<font class="title1">  Sample information</font>
										
									</span>
									<div class="fileuploadCSS1" >
													<div class="item">
															            <div class="addImg_user_clinical"  style="text-align:center;">															                
															                    <i  class="bx bx-cloud-upload bx" style="margin-top:50px; font-size:70px;"></i>															                
															            </div>
															            <input name="url" type="file" class="upload_input_user_clinical" id="upload_file_id_user_clinical" onchange="change_user_clinical(this)" />
															            <div class="preBlock_user_clinical">
															            	<table style="margin:auto;height: 100%;font-size:18px;display:none;" id="FileSuccessNameTable_user_clinical">
															            		<tr>
															            			<td>
															            				<i style="font-size:50px;" class="bx bx-file"  ></i>
															            				
															            			</td>
															            			<td style="width:10px;">
															            				<p> : </p>
															            			</td>
															            			<td>
													            						<p id="FileSuccessName_user_clinical" ></p>
													            					</td>
															            		</tr>
															            	</table>						                						             									
															            </div>
														            <div class="delete_user_clinical" id="del_user_clinical">×</div>
														</div>		       
									</div>
								</div>
								
								<div id="usersubmit" style="margin-top:50px;margin-left:10px;margin-bottom:50px;">
									<span>
										<input id="userSubmit"   type = "submit" value="Submit" onclick="userSubmit()"
																	style="height:40px;width:100px; border:1px solid #969696; border-radius:5px;font-size:20px;transition: ease-in all 0.25s;font-weight:bold;" 
																	onfocus="this.className='input_on';this.οnmοuseοut=''" 
																	onblur="this.className='input_off';this.οnmοuseοut=function(){this.className='input_out'};" 
																	onmousemove="this.className='input_move'" 
																	onmouseout="this.className='input_out'"
																/>
										<span>
										
											<button  class="" type="button" onclick="viewexample_user()"
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
							</div>
						</div>
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
<script src="js/downstream.js" type="text/javascript" charset="utf-8"></script>
<script src="js/downstreamSubmit.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
var UserTaskID=document.getElementById("UserTaskID").value;
console.log(UserTaskID);
if( UserTaskID == '' || UserTaskID == null || UserTaskID == "null") {
    //console.log("no");  // true
}else{
	document.getElementById("jobID").value=UserTaskID;
}

function viewexample(){
	window.location.href="exampleDownStreamResultBulk.jsp";
}
function viewexample_user(){
	var userfiletype = xmSelect.get('#userfiletype', true).getValue('valueStr');
	if (userfiletype == "" || null) {
		alert("Please select a data type for your job");
		return false;
	}
	if(userfiletype=="bulk"){
	window.location.href="exampleDownStreamResultBulkUser.jsp";
	}else{
		window.location.href="exampleDownStreamResultSingleUser.jsp";
	}
}
</script>
</body>
</html>