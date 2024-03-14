function JobIDSubmit(){
//Signature threshold 
	var jobIDthreshold = xmSelect.get('#jobIDthreshold', true).getValue('valueStr');
	if (jobIDthreshold == "" || jobIDthreshold ==null) {
		alert("Please select a threshold for your job");
		return false;
	}
//job id   jobID
	datatype="";
	var jobID=document.getElementById("jobID").value.replace(/(^\s*)|(\s*$)/g, "");
	if (jobID == "" || jobID ==null) {
		alert("Please input your job ID");
		return false;
	}else{
		if(fileExists('upload/'+jobID+"/CS_re.txt")){
			//alert('upload/'+jobID+"/CS_re.txt");
			
			
		}else{
			alert("No such job ID");
			return false;
		}
	}
	
//clinical file
	var uploadFile = document.getElementById("upload_file_id_id_clinical");
//	 if ($("#upload_file_id_id_clinical").val() == "") {
//         alert("请选择文件后上传！");
//         return false;
//     } else {
//         alert("文件上传成功！");
//        
//     }
//    return false;
	
	//show tips
	$("#success_msg").show();
	document.getElementById("jobID_show").innerHTML= "Your job ID is ' "+jobID+" '";
	
    if ($("#upload_file_id_id_clinical").val() == "") {
		IDDownStreamRun(jobID,jobIDthreshold,"none");
	}else{
		let formData = new FormData();
		formData.append("file",uploadFile.files[0]);//文件
		formData.append("fileSize",uploadFile.files[0].size.toString());//文件大小
		formData.append("fileName",uploadFile.files[0].name);//文件名
		var maxsize=1024 * 1024 * 50; // 最大上传文件大小：50MB
		if(uploadFile.files[0].size.toString()> maxsize){
			alert("File too large !");
			return false;
		}
		
	//upload file
		var xmlHttp=new XMLHttpRequest();
		xmlHttp.onreadystatechange =function(){
		//处理返回的数据，更新当前页面
			if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
				var returnData=xmlHttp.responseText;
				var jsonobj=JSON.parse(returnData);
				if (jsonobj.uploadSyInfor=="success"){
					
					
					IDDownStreamRun(jobID,jobIDthreshold,uploadFile.files[0].name);
				}
				}
			}
		var param="foldName="+jobID;
		xmlHttp.open("POST","FileUploadSaveOnly?"+param,true);
		xmlHttp.send(formData);
	}
}

function IDDownStreamRun(jobID,threshold,clinicalFileName,datatype){
	var jobID=jobID;
	var threshold=threshold;
	var clinicalFileName=clinicalFileName;
	methods_end_re="";
	$.ajaxSettings.async = false;
	$.getJSON("upload/"+jobID+"/CS_re.txt", "", function(data_re) {
		methods_end_re=data_re;
	});

	datatype=methods_end_re.dataType;
	email_address=methods_end_re.email_address;

	//传参到 DownStreamRun.jsp
				var xmlHttpRun=new XMLHttpRequest();
				xmlHttpRun.onreadystatechange =function(){
					//处理返回的数据，更新当前页面
					if(xmlHttpRun.readyState == 4 && xmlHttpRun.status == 200){
						var returnDataRun=xmlHttpRun.responseText;
						var jsonobjRun=JSON.parse(returnDataRun);
						//judege
						if (jsonobjRun.error_attention=="no"){
							//发邮件第2阶段完成
							//alert("success  "+ datatype);
							//跳转到结果页面
							$("#success_msg").hide();
							if(datatype=="bulk"){
								window.location.href="DownStreamResultBulk.jsp?UserTaskID="+jobID;
								//email
								SendMail_success(email_address,jobID,"DownStreamResultBulk.jsp");
							}else{
								window.location.href="DownStreamResultSingle.jsp?UserTaskID="+jobID;
								//mail
								SendMail_success(email_address,jobID,"DownStreamResultSingle.jsp");
							}
						}else{
							//error email
							SendMail_error(email_address,jobID);
						}
							}
						}			
					var param_next="";
					param_next="UserTaskID="+jobID+"&threshold="+threshold+"&clinicalFileName="+clinicalFileName+"&datatype="+datatype;
				xmlHttpRun.open("get","DownStreamRun.jsp?"+param_next,true);
				xmlHttpRun.send();
}


////user own file
function userSubmit(){
	//useremail
	var useremail =document.getElementById("useremail").value.replace(/(^\s*)|(\s*$)/g, "");
	if(useremail == "" || useremail ==null){
		  alert("Please input email address for your research!");
			return false;
	  }else{
		  var reg = /^[0-9a-zA-Z_.-]+[@][0-9a-zA-Z_.-]+([.][a-zA-Z]+){1,2}$/;
		  if (!reg.test(useremail)) {
			  alert("Please input right address for your research!");
			  return false;
		  }
	  }
	//userfiletype
	var userfiletype = xmSelect.get('#userfiletype', true).getValue('valueStr');
	if (userfiletype == "" || userfiletype ==null) {
		alert("Please select a data type for your job");
		return false;
	}
	//userthreshold
	var userthreshold = xmSelect.get('#userthreshold', true).getValue('valueStr');
	if (userthreshold == "" || userthreshold ==null) {
		alert("Please select a threshold for your job");
		return false;
	}
	//score file
    var uploadFile = document.getElementById("upload_file_score");
    if ($("#upload_file_score").val() == "") {
		alert("Please upload Expression Data file for your search!");
		return false;
	}
    //symbol 文件的判断
	var uploadFile_symbol = document.getElementById("upload_file_id_user_clinical");
	if ($("#upload_file_id_user_clinical").val() == "") {
		alert("Please upload clinical infor file for your search!");
		return false;
	}
	//score file
    let formData = new FormData();
    formData.append("file",uploadFile.files[0]);//文件
    formData.append("fileSize",uploadFile.files[0].size.toString());//文件大小
    formData.append("fileName",uploadFile.files[0].name);//文件名
	//symbol文件
	let formData_symbol = new FormData();
	formData_symbol.append("file",uploadFile_symbol.files[0]);//文件
    formData_symbol.append("fileSize",uploadFile_symbol.files[0].size.toString());//文件大小
    formData_symbol.append("fileName",uploadFile_symbol.files[0].name);//文件名
	
	/////1.创建异步对象
    	var xmlHttp=new XMLHttpRequest();
    /////2.绑定事件
    	xmlHttp.onreadystatechange =function(){
    		//处理返回的数据，更新当前
    		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
    			var returnData=xmlHttp.responseText;
    			//console.log(returnData);
    			var jsonobj=JSON.parse(returnData);
    			var UserUploadFileName =jsonobj.filename;//文件名 全局变量
    			var UserUploadFileNamePath =jsonobj.filepath;//上传的路径全局变量
    			var UserTaskID=jsonobj.Randompathname;//上传的upload下的随机的文件名
				
    			//show tips
				$("#success_msg").show();
				document.getElementById("jobID_show").innerHTML= "Your job ID is ' "+UserTaskID+" '";
    			
				uploadUserSymbol(UserTaskID,formData_symbol,UserUploadFileName,uploadFile_symbol.files[0].name,userfiletype,useremail,userthreshold);
				}
			}
/////3.初始请求数据
    	var param_address="email_address="+useremail;
    	xmlHttp.open("POST","FileUploadSave?"+param_address,true);
    //文件用 post 传参
/////4.发起请求
    	xmlHttp.send(formData);
}

function uploadUserSymbol(foldName,fileFormData,fileNameEXP,fileNameSymbol,datatype,email_address,userthreshold){
	var foldName=foldName;
	var fileFormData=fileFormData;
	var fileNameEXP=fileNameEXP;
	var fileNameSymbol=fileNameSymbol;
	var datatype=datatype;
	var userthreshold=userthreshold;
	var email_address=email_address;
	//console.log(foldName+fileNameEXP+fileNameSymbol+datatype+userthreshold+userthreshold+email_address);
/////1.创建异步对象
	var xmlHttp=new XMLHttpRequest();
/////2.绑定事件
	xmlHttp.onreadystatechange =function(){
		//处理返回的数据，更新当前页面
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
			var returnData=xmlHttp.responseText;
			var jsonobj=JSON.parse(returnData);
			if (jsonobj.uploadSyInfor=="success"){
				
				//传参到 DownStreamRunUser.jsp
				var xmlHttpRun=new XMLHttpRequest();
				xmlHttpRun.onreadystatechange =function(){
					//处理返回的数据，更新当前页面
					if(xmlHttpRun.readyState == 4 && xmlHttpRun.status == 200){
						var returnDataRun=xmlHttpRun.responseText;
						var jsonobjRun=JSON.parse(returnDataRun);
						//judege
						if (jsonobjRun.error_attention=="no"){
							//发邮件第一阶段完成
							
							//跳转到结果页面
							$("#success_msg").hide();
							
							if(datatype=="bulk"){
								window.location.href="DownStreamResultBulkUser.jsp?UserTaskID="+foldName;
								//email
								SendMail_success(email_address,foldName,"DownStreamResultBulkUser.jsp");
							}else{
								window.location.href="DownStreamResultSingleUser.jsp?UserTaskID="+foldName;
								//maile
								SendMail_success(email_address,foldName,"DownStreamResultSingleUser.jsp");
							}
						}else{
							//error email
							SendMail_error(email_address,foldName);
						}
							}
						}			
					var param_next="";
					param_next="UserTaskID="+foldName+"&fileNameEXP="+fileNameEXP+"&fileNameSymbol="+fileNameSymbol+"&type="+datatype+"&email_address="+email_address+"&userthreshold="+userthreshold;
				xmlHttpRun.open("get","DownStreamRunUser.jsp?"+param_next,true);
				xmlHttpRun.send();
			}
				}
			}
/////3.初始请求数据
	//合并参数
	var param="foldName="+foldName;
	xmlHttp.open("POST","FileUploadSaveOnly?"+param,true);
	//文件用 post 传参
/////4.发起请求
	xmlHttp.send(fileFormData);
}









//////base method////
//判断文件是否存在
function fileExists(url){
	var isExists;
	$.ajax({
		url:url,
		async:false,
		type:'HEAD',
		//timeout:2000,
		error:function(){
		isExists=0;
		},
		success:function(){
		isExists=1;
		}
	});
	if(isExists==1){
	return true;
	}else{
	return false;
	}	
}

//// meg
function closeSuccess_msg(){
	document.getElementById("success_msg").style.display="none"
}



function SendMail_success(email_address,jobid,resultpage){
	var email_address=email_address;
	var jobid=jobid;
	var resultpage=resultpage;
	var xmlHttp=new XMLHttpRequest();
	xmlHttp.onreadystatechange =function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
			console.log("mail success");
				}
			}
	var RecipientAddress=email_address;
	var mailContent="Dear Cancer Stemness Oline user, your task is completed with "+jobid+" .\n You can check your results by clicking on the link : http://bio-bigdata.hrbmu.edu.cn/CancerStemnessOline/"+resultpage+"?UserTaskID="+jobid;
	var param="RecipientAddress="+RecipientAddress+"&mailContent="+mailContent;
	xmlHttp.open("get","MainSendMail?"+param,true);
	xmlHttp.send();
}



function SendMail_error(email_address,jobid){
	var email_address=email_address;
	var jobid=jobid;
	var xmlHttp=new XMLHttpRequest();
	xmlHttp.onreadystatechange =function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
			console.log("mail success");
				}
			}
	var RecipientAddress=email_address;
	var mailContent="Dear Cancer Stemness Oline user,something wrong with your task of "+jobid+", please check your upload file or parameters.";
	var param="RecipientAddress="+RecipientAddress+"&mailContent="+mailContent;
	xmlHttp.open("get","MainSendMail?"+param,true);
	xmlHttp.send();
}