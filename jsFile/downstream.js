var jobIDthreshold = xmSelect.render({
	el: '#jobIDthreshold',
	direction: 'up',//向上展开
	name: 'jobIDthreshold',//表单的name属性
	size: 'large',//选中的之后显示的字的大小
  theme: {color: '#C4859D',},//主题颜色
  tips: 'Please select a reshold for you jobs',
  style: {
	  	marginTop: '5px',
		marginLeft: '20px',
		borderRadius: '8px',
		height: '45px',
		border: '1px solid #C7C7C7',
	
	},
	radio: true,
	clickClose: true,
	data: [
			{name: '0.3', value: '0.3'},
			{name: '0.4', value: '0.4'},
			{name: '0.5', value: '0.5',selected: true},
			{name: '0.6', value: '0.6'},
			{name: '0.7', value: '0.7'},
			{name: '0.8', value: '0.8'},
			{name: '0.9', value: '0.9'},
		
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


var userfiletype = xmSelect.render({
	el: '#userfiletype',
	direction: 'up',//向上展开
	name: 'userfiletype',//表单的name属性
	size: 'large',//选中的之后显示的字的大小
  theme: {color: '#C4859D',},//主题颜色
  tips: 'Please select a file type for you jobs',
  style: {
	  	marginTop: '5px',
		marginLeft: '20px',
		borderRadius: '8px',
		height: '45px',
		border: '1px solid #C7C7C7',
	
	},
	radio: true,
	clickClose: true,
	data: [
			{name: 'Bulk', value: 'bulk'},
				{name: 'Single cell', value: 'single',selected: true},
		
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

var userthreshold = xmSelect.render({
	el: '#userthreshold',
	direction: 'up',//向上展开
	name: 'userthreshold',//表单的name属性
	size: 'large',//选中的之后显示的字的大小
  theme: {color: '#C4859D',},//主题颜色
  tips: 'Please select a reshold for you jobs',
  style: {
	  	marginTop: '5px',
		marginLeft: '20px',
		borderRadius: '8px',
		height: '45px',
		border: '1px solid #C7C7C7',
	
	},
	radio: true,
	clickClose: true,
	data: [
{name: '0.3', value: '0.3'},
{name: '0.4', value: '0.4'},
{name: '0.5', value: '0.5',selected: true},
{name: '0.6', value: '0.6'},
{name: '0.7', value: '0.7'},
{name: '0.8', value: '0.8'},
{name: '0.9', value: '0.9'},
		
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

/////////////file upload///////////
//id clinical
$(document).on('click', '.addImg_id_clinical', function(){
$(this).parent().find('.upload_input_id_clinical').click();
});
//点击删除选中的文件
$(document).on('click', '.delete_id_clinical', function(){
		  $("#FileSuccessNameTable_id_clinical").hide();
	$(this).parent().find('input').val('');
	//$(this).parent().find('img.preview').attr("src","img/base.png");
	//IE9以下
	$(this).parent().find('img.preview').css("filter","");
	$(this).hide();
	$(this).parent().find('.addImg_id_clinical').show();
	//$("#preview").show();
	//document.getElementById("successBack_id_clinical").innerHTML="";

});
//选择图片
function change_id_clinical(file) {
	//预览
	var pic = $(file).parent().find(".preview_id_clinical");
	//添加按钮
	var addImg = $(file).parent().find(".addImg_id_clinical");
	//删除按钮
	var deleteImg = $(file).parent().find(".delete_id_clinical");
	
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
		  var uploadFileName = document.getElementById("upload_file_id_id_clinical").files[0].name;
		      	if (uploadFileName.length>40){
		      		uploadFileName=uploadFileName.substring(0,10)+"..."+ext;
		      	}
		  //alert(uploadFileName.length);
		  //传递文件名并显示
		  document.getElementById("FileSuccessName_id_clinical").innerHTML=uploadFileName;
		  $("#FileSuccessNameTable_id_clinical").show();
	}

}



//uesr score File upload
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
		  var uploadFileName = document.getElementById("upload_file_score").files[0].name;
		      	if (uploadFileName.length>40){
		      		uploadFileName=uploadFileName.substring(0,10)+"..."+ext;
		      	}
		  //alert(uploadFileName.length);
		  //传递文件名并显示
		  document.getElementById("FileSuccessName").innerHTML=uploadFileName;
		  $("#FileSuccessNameTable").show();   	  	           
	}

}
///// usr clinical file upload
$(document).on('click', '.addImg_user_clinical', function(){
	$(this).parent().find('.upload_input_user_clinical').click();
	});
	//点击删除选中的文件
	$(document).on('click', '.delete_user_clinical', function(){
		  $("#FileSuccessNameTable_user_clinical").hide();
	$(this).parent().find('input').val('');
	//$(this).parent().find('img.preview').attr("src","img/base.png");
	//IE9以下
	$(this).parent().find('img.preview').css("filter","");
	$(this).hide();
	$(this).parent().find('.addImg_user_clinical').show();
	//$("#preview").show();
	//document.getElementById("successBack_user_clinical").innerHTML="";

	});
	//选择图片
	function change_user_clinical(file) {
	//预览
	var pic = $(file).parent().find(".preview_user_clinical");
	//添加按钮
	var addImg = $(file).parent().find(".addImg_user_clinical");
	//删除按钮
	var deleteImg = $(file).parent().find(".delete_user_clinical");

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
		  var uploadFileName = document.getElementById("upload_file_id_user_clinical").files[0].name;
		      	if (uploadFileName.length>40){
		      		uploadFileName=uploadFileName.substring(0,10)+"..."+ext;
		      	}
		  //alert(uploadFileName.length);
		  //传递文件名并显示
		  document.getElementById("FileSuccessName_user_clinical").innerHTML=uploadFileName;
		  $("#FileSuccessNameTable_user_clinical").show();
	}

	}



