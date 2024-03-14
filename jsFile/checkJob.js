
function check_job(){
	var UserTaskID=document.getElementById("home_task_id").value.replace(/(^\s*)|(\s*$)/g, "");
	if (UserTaskID == "" || null) {
		alert("Please input your job ID");
		return false;
	}
	var xmlHttp=new XMLHttpRequest();
	xmlHttp.onreadystatechange =function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
		document.getElementById("jodDetail").style.display="block";
			var returnData=xmlHttp.responseText;
			var jsonobj=JSON.parse(returnData);
			console.log(jsonobj);
				if (jsonobj.error_attention=="no"){
					
					jobtype=jsonobj.jobtype;
					jobstate=jsonobj.jobstate;
					//
					//up
					if(jobtype=="up"){
						//alert("up");
						document.getElementById("up_id").innerHTML=UserTaskID;
						document.getElementById("down_id").innerHTML=UserTaskID;
						if(jobstate=="success"){
							document.getElementById('up_sate_a').href ="CSidentifyResult.jsp?UserTaskID="+UserTaskID;
							document.getElementById("up_sate").innerHTML="View result";
							
							document.getElementById('down_sate_a').href ="DownStream.jsp?UserTaskID="+UserTaskID;
							document.getElementById("down_sate").innerHTML="GO & start analyze";
						}else if (jobstate=="run"){
							document.getElementById("up_sate").innerHTML="Continue analysis";
							document.getElementById("down").style.display="none";
						}else{
							document.getElementById("up_sate").innerHTML="Error!";
							document.getElementById("down").style.display="none";
						}
					}
					//id down
					if(jobtype== "idbulkdown" || jobtype== "idsingledown"){
						//alert("id");
						document.getElementById("up_id").innerHTML=UserTaskID;
						document.getElementById("down_id").innerHTML=UserTaskID;
						if(jobstate=="success"){
							document.getElementById('up_sate_a').href ="CSidentifyResult.jsp?UserTaskID="+UserTaskID;
								document.getElementById("up_sate").innerHTML="View result";
							if(jobtype== "idbulkdown"){
								document.getElementById('down_sate_a').href ="DownStreamResultBulk.jsp?UserTaskID="+UserTaskID;
							}else{
								document.getElementById('down_sate_a').href ="DownStreamResultSingle.jsp?UserTaskID="+UserTaskID;
							}
							document.getElementById("down_sate").innerHTML="View result";
						}else if (jobstate=="run"){
							///
							if(fileExists('upload/'+UserTaskID+"/CS_re.txt")){
								document.getElementById('up_sate_a').href ="CSidentifyResult.jsp?UserTaskID="+UserTaskID;
								document.getElementById("up_sate").innerHTML="View result";
							}else{
								document.getElementById("up_sate").innerHTML="Error!";
							}
							////
							document.getElementById("down_sate").innerHTML="Continue analysis";
						}else{
							///
							if(fileExists('upload/'+UserTaskID+"/CS_re.txt")){
								document.getElementById('up_sate_a').href ="CSidentifyResult.jsp?UserTaskID="+UserTaskID;
								document.getElementById("up_sate").innerHTML="View result";
							}else{
								document.getElementById("up_sate").innerHTML="Error!";
							}
							////
							document.getElementById("down_sate").innerHTML="Error!";
						}
					}
					//user down
					if(jobtype=="Userbulkdown" || jobtype== "Usersingledown"){
						//alert("user");
						document.getElementById("up").style.display="none";
						document.getElementById("down_id").innerHTML=UserTaskID;
						if(jobstate=="success"){
							if(jobtype== "Userbulkdown"){
								document.getElementById('down_sate_a').href ="DownStreamResultBulkUser.jsp?UserTaskID="+UserTaskID;
							}else{
								document.getElementById('down_sate_a').href ="DownStreamResultSingleUser.jsp?UserTaskID="+UserTaskID;
							}
							document.getElementById("down_sate").innerHTML="View result";
						}else if (jobstate=="run"){
							document.getElementById("down_sate").innerHTML="Continue analysis";
						}else{
							document.getElementById("down_sate").innerHTML="Error!";
						}
					}
					// user mult
					if(jobtype=="multdown"){
						document.getElementById("down").style.display="none";
						if(jobstate=="success"){
							if(fileExists('upload/'+UserTaskID+"/time.txt")){
								document.getElementById("up_id").innerHTML=UserTaskID;
								document.getElementById('up_sate_a').href ="CSidentifyResultMult.jsp?UserTaskID="+UserTaskID;
								document.getElementById("up_sate").innerHTML="View result";
							}else{
								document.getElementById("up_sate").innerHTML="Error! No such ID";
							}
						}else if (jobstate=="run"){
							
							document.getElementById("up_id").innerHTML=UserTaskID;
							document.getElementById("up_sate").innerHTML="Continue analysis";
						}else{
							document.getElementById("up_id").innerHTML=UserTaskID;
							document.getElementById("up_sate").innerHTML="Error!";
						}
					}
				}else{
					//
					document.getElementById("jodDetail_table").style.display="none";
					document.getElementById("jodDetail").innerHTML="No such job ID, you can check your job id ID submit a task first";
				}
				}
			}

	
	xmlHttp.open("get","jobState.jsp?UserTaskID="+UserTaskID,true);

	xmlHttp.send();
}


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