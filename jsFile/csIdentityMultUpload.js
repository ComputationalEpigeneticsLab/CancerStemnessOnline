methodSelect=document.getElementById("methodSelect").value;
stemnessGeneSet=document.getElementById("stemnessGeneSet").value;
methods=methodSelect.split(",");

data_org = [
			{"value": "mRNAsi", "title": "mRNAsi"},
			{"value": "StemnessIndex", "title": "StemnessIndex"},
			{"value": "CytoTRACE", "title": "CytoTRACE"},
			{"value": "SLICE", "title": "SLICE"},
			{"value": "SCENT", "title": "SCENT"},
			{"value": "StemID", "title": "StemID"},
			{"value": "StemSC", "title": "StemSC"},
			{"value": "GSVA", "title": "GSVA"}
			];
if(methods.indexOf("GSVA")!=-1){
	stemnessGeneSet=stemnessGeneSet;
	data_org = [
			{"value": "mRNAsi", "title": "mRNAsi"},
			{"value": "StemnessIndex", "title": "StemnessIndex"},
			{"value": "CytoTRACE", "title": "CytoTRACE"},
			{"value": "SLICE", "title": "SLICE"},
			{"value": "SCENT", "title": "SCENT"},
			{"value": "StemID", "title": "StemID"},
			{"value": "StemSC", "title": "StemSC"},
			{"value": "GSVA", "title": "GSVA", "disabled": true}
			];
	//GSVAgenesetXML(stemnessGeneSet);
}else{
	//document.getElementById("gsvaOption").style.display="none";
}


ShuttleFrame(methods,data_org);
//穿梭框
function ShuttleFrame(selectMethods,data_org){
	var data_select=[];
	for(var m0 of selectMethods){
		data_select.push(m0);
	}
	//console.log(data_select);
	layui.use(function(){
		var transfer = layui.transfer;
		var data = [
					{"value": "mRNAsi", "title": "mRNAsi"},
					{"value": "StemnessIndex", "title": "StemnessIndex"},
					{"value": "CytoTRACE", "title": "CytoTRACE"},
					{"value": "SLICE", "title": "SLICE"},
					{"value": "SCENT", "title": "SCENT"},
					{"value": "StemID", "title": "StemID"},
					{"value": "StemSC", "title": "StemSC"},
					{"value": "GSVA", "title": "GSVA"}
					];
		// 渲染
		transfer.render({
			elem: '#methodsSelect',
			id:'methodsSelect',//用来获取右侧选择的value
			data: data,
			title:['Unselect Methods','Select Methods'],
			//showSearch:true,
			//width:300,
			//height:400,
			text: {
			  none: 'no method here', // 没有数据时的文案
			  searchNone: 'no result' // 搜索无匹配数据时的文案
			},
			value: data_select
		  });
	});
}


//upload
//File upload
//点击添加文件
$(document).on('click', '.addImg', function(){
  $(this).parent().find('.upload_input').click();
});
//点击删除选中的文件
$(document).on('click', '.delete', function(){
	  $("#FileSuccessNameTable").hide();
  $(this).parent().find('input').val('');
  //$(this).parent().find('img.preview').attr("src","img/base.png");
  //IE9以下
  $(this).parent().find('img.preview').css("filter","");
  $(this).hide();
  $(this).parent().find('.addImg').show();
  //$("#preview").show();
  //document.getElementById("successBack").innerHTML="";
  
});
//选择图片
function change(file) {
  //预览
  var pic = $(file).parent().find(".preview");
  //添加按钮
  var addImg = $(file).parent().find(".addImg");
  //删除按钮
  var deleteImg = $(file).parent().find(".delete");

  var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();
		
  // 判断文件类型
  if(ext!='txt'&&ext!='csv'){
      if (ext != '') {
          alert("The upload file format must be TXT or CSV！");
      }
      return;
  }else{
	  
	  //打开删除按钮
	      deleteImg.show();
	  //关闭初始图像
	      addImg.hide();
	    //获取文件名
	  var uploadFileName = document.getElementById("upload_file_id").files[0].name;
	      	if (uploadFileName.length>20){
	      		uploadFileName=uploadFileName.substring(0,10)+"..."+ext;
	      	}
	  //alert(uploadFileName.length);
	  //传递文件名并显示
	  document.getElementById("FileSuccessName").innerHTML=uploadFileName;
	  $("#FileSuccessNameTable").show();   	  	           
  }

}


//upload symbol
//File upload
//点击添加文件
$(document).on('click', '.addImg_symbol', function(){
$(this).parent().find('.upload_input_symbol').click();
});
//点击删除选中的文件
$(document).on('click', '.delete_symbol', function(){
	  $("#FileSuccessNameTable_symbol").hide();
$(this).parent().find('input').val('');
//$(this).parent().find('img.preview').attr("src","img/base.png");
//IE9以下
$(this).parent().find('img.preview').css("filter","");
$(this).hide();
$(this).parent().find('.addImg_symbol').show();
//$("#preview").show();
//document.getElementById("successBack_symbol").innerHTML="";

});
//选择图片
function change_symbol(file) {
//预览
var pic = $(file).parent().find(".preview_symbol");
//添加按钮
var addImg = $(file).parent().find(".addImg_symbol");
//删除按钮
var deleteImg = $(file).parent().find(".delete_symbol");

var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();
		
// 判断文件类型
if(ext!='txt'&&ext!='csv'){
    if (ext != '') {
        alert("The upload file format must be TXT or CSV！");
    }
    return;
}else{
	  
	  //打开删除按钮
	      deleteImg.show();
	  //关闭初始图像
	      addImg.hide();
	    //获取文件名
	  var uploadFileName = document.getElementById("upload_file_id_symbol").files[0].name;
	      	if (uploadFileName.length>20){
	      		uploadFileName=uploadFileName.substring(0,10)+"..."+ext;
	      	}
	  //alert(uploadFileName.length);
	  //传递文件名并显示
	  document.getElementById("FileSuccessName_symbol").innerHTML=uploadFileName;
	  $("#FileSuccessNameTable_symbol").show();
}

}

function GSVAgenesetXML(geset){

	var geneset = xmSelect.render({
		el: '#geneset',
		direction: 'up',//向上展开
		name: 'geneset',//表单的name属性
		size: 'small',//选中的之后显示的字的大小
	  theme: {color: '#C4859D',},//主题颜色
	  tips: 'Please select a gene set for you jobs',
	  style: {
			marginLeft: '0px',
			borderRadius: '10px',
			height: '35px',
			border: '1px solid #C7C7C7',
		
		},
		radio: true,
		clickClose: true,
		data: [
	{name: 'Ben_Eed_targets', value: 'Ben_Eed_targets'},
	{name: 'Ben_ES_exp1', value: 'Ben_ES_exp1'},
	{name: 'Ben_ES_exp2', value: 'Ben_ES_exp2'},
	{name: 'Ben_ES_TFs', value: 'Ben_ES_TFs'},
	{name: 'Ben_H3K27_bound', value: 'Ben_H3K27_bound'},
	{name: 'Ben_Myc_targets1', value: 'Ben_Myc_targets1'},
	{name: 'Ben_Myc_targets2', value: 'Ben_Myc_targets2'},
	{name: 'Ben_Nanog_targets', value: 'Ben_Nanog_targets'},
	{name: 'Ben_NOS_targets', value: 'Ben_NOS_targets'},
	{name: 'Ben_NOS_TFs', value: 'Ben_NOS_TFs'},
	{name: 'Ben_Oct4_targets', value: 'Ben_Oct4_targets'},
	{name: 'Ben_PRC2_targets', value: 'Ben_PRC2_targets'},
	{name: 'Ben_Sox2_targets', value: 'Ben_Sox2_targets'},
	{name: 'Ben_Suz12_targets', value: 'Ben_Suz12_targets'},
	{name: 'Kim_ES_TFs_ref_m2h', value: 'Kim_ES_TFs_ref_m2h'},
	{name: 'Kim_et_al_core_m2h', value: 'Kim_et_al_core_m2h'},
	{name: 'Kim_et_al_Myc_m2h', value: 'Kim_et_al_Myc_m2h'},
	{name: 'Kim_et_al_PRC_m2h', value: 'Kim_et_al_PRC_m2h'},
	{name: 'Mizuno_iPSC118', value: 'Mizuno_iPSC118'},
	{name: 'Mizuno_iPSC340', value: 'Mizuno_iPSC340'},
	{name: 'Palme_SCGS', value: 'Palme_SCGS'},
	{name: 'Shats_et_al_CSR', value: 'Shats_et_al_CSR'},
	{name: 'Shats_et_al_iPS', value: 'Shats_et_al_iPS'},
	{name: 'VeneziaHSC_cPsig_m2h', value: 'VeneziaHSC_cPsig_m2h'},
	{name: 'VeneziaHSC_ES_m2h', value: 'VeneziaHSC_ES_m2h'},
	{name: 'Yan_CD133_GBM_up', value: 'Yan_CD133_GBM_up'},
	
	{name: 'Zhang_Stem_Sig', value: 'Zhang_Stem_Sig'},
	
			
		],
		on: function(data){//监听					                            		
			//arr:  当前多选已选中的数据
			//var arr = data.arr;
			//console.log(arr);
			//console.log(arr[0]["value"]);
			//change, 此次选择变化的数据,数组
			//var change = data.change;
			//isAdd, 此次操作是新增还是删除
			//var isAdd = data.isAdd;
			//var slectvalue=arr[0]["value"];
			
			
		}
		
				
	})
	// 赋值
	geneset.setValue([
				{name: geset, value: geset},
				])


}

var geneset = xmSelect.render({
		el: '#geneset',
		direction: 'up',//向上展开
		name: 'geneset',//表单的name属性
		size: 'small',//选中的之后显示的字的大小
	  theme: {color: '#C4859D',},//主题颜色
	  tips: 'Please select a gene set for you jobs',
	  style: {
			marginLeft: '0px',
			borderRadius: '10px',
			height: '35px',
			border: '1px solid #C7C7C7',
		
		},
		radio: true,
		clickClose: true,
		data: [
	{name: 'Ben_Eed_targets', value: 'Ben_Eed_targets'},
	{name: 'Ben_ES_exp1', value: 'Ben_ES_exp1'},
	{name: 'Ben_ES_exp2', value: 'Ben_ES_exp2'},
	{name: 'Ben_ES_TFs', value: 'Ben_ES_TFs'},
	{name: 'Ben_H3K27_bound', value: 'Ben_H3K27_bound'},
	{name: 'Ben_Myc_targets1', value: 'Ben_Myc_targets1'},
	{name: 'Ben_Myc_targets2', value: 'Ben_Myc_targets2'},
	{name: 'Ben_Nanog_targets', value: 'Ben_Nanog_targets'},
	{name: 'Ben_NOS_targets', value: 'Ben_NOS_targets'},
	{name: 'Ben_NOS_TFs', value: 'Ben_NOS_TFs'},
	{name: 'Ben_Oct4_targets', value: 'Ben_Oct4_targets'},
	{name: 'Ben_PRC2_targets', value: 'Ben_PRC2_targets'},
	{name: 'Ben_Sox2_targets', value: 'Ben_Sox2_targets'},
	{name: 'Ben_Suz12_targets', value: 'Ben_Suz12_targets'},
	{name: 'Kim_ES_TFs_ref_m2h', value: 'Kim_ES_TFs_ref_m2h'},
	{name: 'Kim_et_al_core_m2h', value: 'Kim_et_al_core_m2h'},
	{name: 'Kim_et_al_Myc_m2h', value: 'Kim_et_al_Myc_m2h'},
	{name: 'Kim_et_al_PRC_m2h', value: 'Kim_et_al_PRC_m2h'},
	{name: 'Mizuno_iPSC118', value: 'Mizuno_iPSC118'},
	{name: 'Mizuno_iPSC340', value: 'Mizuno_iPSC340'},
	{name: 'Palme_SCGS', value: 'Palme_SCGS'},
	{name: 'Shats_et_al_CSR', value: 'Shats_et_al_CSR'},
	{name: 'Shats_et_al_iPS', value: 'Shats_et_al_iPS'},
	{name: 'VeneziaHSC_cPsig_m2h', value: 'VeneziaHSC_cPsig_m2h'},
	{name: 'VeneziaHSC_ES_m2h', value: 'VeneziaHSC_ES_m2h'},
	{name: 'Yan_CD133_GBM_up', value: 'Yan_CD133_GBM_up'},
	{name: 'Zhang_Stem_Sig', value: 'Zhang_Stem_Sig'},
	
	{name: 'none', value: 'none'},
			
		],
		on: function(data){//监听					                            		
			//arr:  当前多选已选中的数据
			//var arr = data.arr;
			//console.log(arr);
			//console.log(arr[0]["value"]);
			//change, 此次选择变化的数据,数组
			//var change = data.change;
			//isAdd, 此次操作是新增还是删除
			//var isAdd = data.isAdd;
			//var slectvalue=arr[0]["value"];
			
			
		}
		
				
	})
	// 赋值
	geneset.setValue([
				{name: stemnessGeneSet, value: stemnessGeneSet},
				])



var chrselect = xmSelect.render({
		el: '#chrselect',
		direction: 'up',//向上展开
		name: 'chrselect',//表单的name属性
		size: 'small',//选中的之后显示的字的大小
	  theme: {color: '#C4859D',},//主题颜色
	  tips: 'Please select a gene set for you jobs',
	  style: {
			marginLeft: '0px',
			borderRadius: '10px',
			height: '35px',
			border: '1px solid #C7C7C7',
		
		},
		radio: true,
		clickClose: true,
		data: [
	{name: 'hg38', value: 'hg38',selected: true},
	{name: 'hg19', value: 'hg19'},
	{name: 'none', value: 'none'},
			
		],
		on: function(data){//监听					                            		
			//arr:  当前多选已选中的数据
			//var arr = data.arr;
			//console.log(arr);
			//console.log(arr[0]["value"]);
			//change, 此次选择变化的数据,数组
			//var change = data.change;
			//isAdd, 此次操作是新增还是删除
			//var isAdd = data.isAdd;
			//var slectvalue=arr[0]["value"];
			
			
		}
		
				
	})

	
function JobSubmit_1(){
	//获取穿梭框右侧的数据
	var transfer = layui.transfer;
	var methodsSelect_next_arr = transfer.getData('methodsSelect');
	if ((methodsSelect_next_arr.length)<2){
		alert("Please select at least two method for your job !");
		return false;
	}
	var methodsSelect_next="";
	for (var m0_arr of methodsSelect_next_arr){
		methodsSelect_next=methodsSelect_next+","+m0_arr.value;
	}
	methodsSelect_next=methodsSelect_next.substr(1,methodsSelect_next.length-1);
	methodsSelect_next_arr=methodsSelect_next.split(",")
	
	//GSVA geneset
	var geneset="";
	if(methodsSelect_next_arr.indexOf("GSVA")!=-1){
		geneset = xmSelect.get('#geneset', true).getValue('valueStr');
		  if (geneset == "" || geneset == null || geneset == "none") {
				alert("Please select a gene set for your job !");
				return false;
			}
	}
	//Genome
	var genome="";
	genome=xmSelect.get('#chrselect', true).getValue('valueStr');
	if (genome == "" || genome == null ) {
		alert("Please select a type of genome for your job !");
		return false;
	}
	// file type StemID 不是是除了count之外的
	var filetype="";
	filetype=xmSelect.get('#filetype', true).getValue('valueStr');
	if (filetype == "" || filetype == null ) {
		alert("Please select a type of file for your job !");
		return false;
	}
	if(methodsSelect_next_arr.indexOf("StemID")!=-1){
		if (filetype !="count"){
			alert("The StemID method must use count expression profile.");
			return false;
		}
	}
	//表达谱文件的判断
    var uploadFile = document.getElementById("upload_file_id");
    var file_e = uploadFile.value;
    if (file_e == "" || file_e ==null ) {
		alert("Please upload Expression Data file for your search!");
		return false;
	}
    //symbol 文件的判断
	var uploadFile_symbol = document.getElementById("upload_file_id_symbol");
	var file_s = uploadFile_symbol.value;
	if (file_s == "" || file_s ==null ) {
		alert("Please upload symbol infor file for your search!");
		return false;
	}
	//表达谱文件
    let formData = new FormData();
    formData.append("file",uploadFile.files[0]);//文件
    formData.append("fileSize",uploadFile.files[0].size.toString());//文件大小
    formData.append("fileName",uploadFile.files[0].name);//文件名
	//symbol文件
	let formData_symbol = new FormData();
	formData_symbol.append("file",uploadFile_symbol.files[0]);//文件
    formData_symbol.append("fileSize",uploadFile_symbol.files[0].size.toString());//文件大小
    formData_symbol.append("fileName",uploadFile_symbol.files[0].name);//文件名

    var maxsize=1024 * 1024 * 500; // 最大上传文件大小：500MB
    if(uploadFile.files[0].size.toString()> maxsize){
    	alert("File too large !");
    	return false;
    }
	if(uploadFile_symbol.files[0].size.toString()> maxsize){
    	alert("File too large !");
    	return false;
    }
	// email
	var email_address=document.getElementById("email_address").value.replace(/(^\s*)|(\s*$)/g, "");
	  if(email_address == "" || null){
		  alert("Please input email address for your research!");
			return false;
	  }else{
		  var reg = /^[0-9a-zA-Z_.-]+[@][0-9a-zA-Z_.-]+([.][a-zA-Z]+){1,2}$/;
		  if (!reg.test(email_address)) {
			  alert("Please input right address for your research!");
			  return false;
		  }
	  }
	// file upload to web
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
				uploadSymbol(UserTaskID,formData_symbol,UserUploadFileName,uploadFile_symbol.files[0].name,methodsSelect_next,filetype,email_address,geneset,genome);
				}
			}
/////3.初始请求数据
    	var param_address="email_address="+email_address;
    	xmlHttp.open("POST","FileUploadSave?"+param_address,true);
    //文件用 post 传参
/////4.发起请求
    	xmlHttp.send(formData);
}

				
function JobSubmit(){
	
	//method & type
	var method=document.getElementById("method").value;
	var type=document.getElementById("type").value;
	if(type=="all"){
		type=xmSelect.get('#filetype', true).getValue('valueStr');
		if (type == "" || type ==null ) {
			alert("Please select a file type your job !");
			return false;
		}
	}
	//表达谱文件的判断
    var uploadFile = document.getElementById("upload_file_id");
    var file_e = uploadFile.value;
    if (file_e == "" || file_e ==null ) {
		alert("Please upload Expression Data file for your search!");
		return false;
	}
    //symbol 文件的判断
	var uploadFile_symbol = document.getElementById("upload_file_id_symbol");
	var file_s = uploadFile_symbol.value;
	if (file_s == "" || file_s ==null ) {
		alert("Please upload symbol infor file for your search!");
		return false;
	}
	//表达谱文件
    let formData = new FormData();
    formData.append("file",uploadFile.files[0]);//文件
    formData.append("fileSize",uploadFile.files[0].size.toString());//文件大小
    formData.append("fileName",uploadFile.files[0].name);//文件名
	//symbol文件
	let formData_symbol = new FormData();
	formData_symbol.append("file",uploadFile_symbol.files[0]);//文件
    formData_symbol.append("fileSize",uploadFile_symbol.files[0].size.toString());//文件大小
    formData_symbol.append("fileName",uploadFile_symbol.files[0].name);//文件名

    var maxsize=1024 * 1024 * 500; // 最大上传文件大小：500MB
    if(uploadFile.files[0].size.toString()> maxsize){
    	alert("File too large !");
    	return false;
    }
	if(uploadFile_symbol.files[0].size.toString()> maxsize){
    	alert("File too large !");
    	return false;
    }
	// email
	var email_address=document.getElementById("email_address").value.replace(/(^\s*)|(\s*$)/g, "");
	  if(email_address == "" || null){
		  alert("Please input email address for your research!");
			return false;
	  }else{
		  var reg = /^[0-9a-zA-Z_.-]+[@][0-9a-zA-Z_.-]+([.][a-zA-Z]+){1,2}$/;
		  if (!reg.test(email_address)) {
			  alert("Please input right address for your research!");
			  return false;
		  }
	  }
	//geneset
	  var geneset ="";
	  if (method=="GSVA"){
		  geneset = xmSelect.get('#geneset', true).getValue('valueStr');
		  if (geneset == "" || geneset == null ) {
				alert("Please select a gene set for your job !");
				return false;
			}
	  }
	  
	// file upload to web
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
				uploadSymbol(UserTaskID,formData_symbol,UserUploadFileName,uploadFile_symbol.files[0].name,method,type,email_address,geneset);
				}
			}
/////3.初始请求数据
    	var param_address="email_address="+email_address;
    	xmlHttp.open("POST","FileUploadSave?"+param_address,true);
    //文件用 post 传参
/////4.发起请求
    	xmlHttp.send(formData);
}


function uploadSymbol(foldName,fileFormData,fileNameEXP,fileNameSymbol,method,type,email_address,geneset,genome){
	var foldName=foldName;
	var fileFormData=fileFormData;
	var fileNameEXP=fileNameEXP;
	var fileNameSymbol=fileNameSymbol;
	var method=method;
	var type=type;
	var geneset=geneset;
	var genome=genome;
	var method_arr=method.split(",");
/////1.创建异步对象
	var xmlHttp=new XMLHttpRequest();
/////2.绑定事件
	xmlHttp.onreadystatechange =function(){
		//处理返回的数据，更新当前页面
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
			var returnData=xmlHttp.responseText;
			var jsonobj=JSON.parse(returnData);
			if (jsonobj.uploadSyInfor=="success"){
				
				//传参到CSidentifyRun.jsp
				var xmlHttpRun=new XMLHttpRequest();
				xmlHttpRun.onreadystatechange =function(){
					//处理返回的数据，更新当前页面
					if(xmlHttpRun.readyState == 4 && xmlHttpRun.status == 200){
						var returnDataRun=xmlHttpRun.responseText;
						var jsonobjRun=JSON.parse(returnDataRun);
						//judege
						if (jsonobjRun.error_attention=="no"){
							//跳转到结果页面
							$("#success_msg").hide();
							//window.location.href="CSidentifyResult.jsp?UserTaskID="+foldName;
							window.location.href="CSidentifyResultMult.jsp?UserTaskID="+foldName;
							
							
							//发邮件success
							SendMail_success_mult(email_address,foldName,"CSidentifyResultMult.jsp");
						}else{
							//error mail
							SendMail_error(email_address,foldName);
						}
							}
						}			
					var param_next="";
					param_next="UserTaskID="+foldName+"&fileNameEXP="+fileNameEXP+"&fileNameSymbol="+fileNameSymbol+"&method="+method+"&type="+type+"&email_address="+email_address+"&geneset="+geneset+"&genome="+genome;
				xmlHttpRun.open("get","CSidentifyRunMult.jsp?"+param_next,true);
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

function closeSuccess_msg(){
	document.getElementById("success_msg").style.display="none"
}




var filetype = xmSelect.render({
	el: '#filetype',
	direction: 'up',//向上展开
	name: 'filetype',//表单的name属性
	size: 'small',//选中的之后显示的字的大小
  theme: {color: '#C4859D',},//主题颜色
  tips: 'Please select a  type of file jobs',
  style: {
		marginLeft: '0px',
		borderRadius: '10px',
		height: '35px',
		border: '1px solid #C7C7C7',
	
	},
	radio: true,
	clickClose: true,
	data: [
			{name: 'Count', value: 'count',selected: true},
			{name: 'TPM', value: 'tpm'},,
			{name: 'FPKM', value: 'fpkm'},
			//{name: 'RPKM', value: 'rpkm'},
	],
	on: function(data){//监听					                            		
		//arr:  当前多选已选中的数据
		//var arr = data.arr;
		//console.log(arr);
		//console.log(arr[0]["value"]);
		//change, 此次选择变化的数据,数组
		//var change = data.change;
		//isAdd, 此次操作是新增还是删除
		//var isAdd = data.isAdd;
		//var slectvalue=arr[0]["value"];
		
		
	}
})


function SendMail_success_mult(email_address,jobid,resultpage){
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
	var mailContent="Dear Cancer Stemness Online user, your task is completed with "+jobid+" .\n You can check your results by clicking on the link : http://bio-bigdata.hrbmu.edu.cn/CancerStemnessOline/"+resultpage+"?UserTaskID="+jobid;
	var param="RecipientAddress="+RecipientAddress+"&mailContent="+mailContent;
	xmlHttp.open("get","MainSendMail?"+param,true);
	xmlHttp.send();
}

function SendMail_success(email_address,jobid,resultpage,method){
	var email_address=email_address;
	var jobid=jobid;
	var resultpage=resultpage;
	var method=method;
	var xmlHttp=new XMLHttpRequest();
	xmlHttp.onreadystatechange =function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
			console.log("mail success");
				}
			}
	var RecipientAddress=email_address;
	var mailContent="Dear Cancer Stemness Online user, your task is completed with "+jobid+" .\n You can check your results by clicking on the link : http://bio-bigdata.hrbmu.edu.cn/CancerStemnessOline/"+resultpage+"?UserTaskID="+jobid+"&method="+method;
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
	var mailContent="Dear Cancer Stemness Online user,something wrong with your task of "+jobid+", please check your upload file or parameters.";
	var param="RecipientAddress="+RecipientAddress+"&mailContent="+mailContent;
	xmlHttp.open("get","MainSendMail?"+param,true);
	xmlHttp.send();
}

function jobexampleMult(){
		window.location.href="exampleCSidentifyResultMult.jsp?UserTaskID=single";
}

