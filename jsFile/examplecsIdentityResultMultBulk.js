UserTaskID=document.getElementById("UserTaskID").value;
MethodName=document.getElementById("Method").value;
//webpath="upload/"+UserTaskID+"/"+MethodName;
if(MethodName.includes("GSVA")){
	webpath="example/multifunction/"+UserTaskID+"/GSVA/"+MethodName.substr(5,MethodName.length-1);
}else{
webpath="example/multifunction/"+UserTaskID+"/"+MethodName;
}
methods_end_re="";
$.ajaxSettings.async = false;
$.getJSON(webpath+"/CS_re.txt", "", function(data_re) {
	methods_end_re=data_re;
});
//console.log(methods_end_re);
if(methods_end_re.stopMessage=="no"){
	//job over view
	document.getElementById("jobid").innerHTML= methods_end_re.JobID;
	document.getElementById("method").innerHTML= methods_end_re.method;
	var datatype0="";
	if (methods_end_re.dataType=="bulk"){datatype0="bulk RNA-seq"}else{datatype0="single-cell RNA-seq"}
	document.getElementById("datatype").innerHTML= datatype0;
	document.getElementById("expfile").innerHTML= methods_end_re.ExpfileName;
	document.getElementById("samplefile").innerHTML= methods_end_re.SamplefileName;
	document.getElementById("samplenum").innerHTML= methods_end_re.SampleNumCancer+" (tumor)" + " / " + methods_end_re.SampleNumAll+" (all)";
	document.getElementById("genenum").innerHTML= methods_end_re.GeneNumAll;
	
	document.getElementById('download_exp').href ="download_loading.jsp?path=example/select_TCGA_LUAD_exp_TPM.txt&name="+MethodName+"_Expression_Example.txt";
	document.getElementById('download_sample').href ="download_loading.jsp?path=example/TCGA_LUAD_feature_use.txt&name="+MethodName+"_Sample_information_Example.txt";
	// table
	csScoreDateTable(webpath+"/"+methods_end_re.CStable_webName);
		//table download
		document.getElementById('csScoreDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.CStable_downloadName+"&name=CSscore.txt";
	//barplot
		plotyBraplot("barplot",methods_end_re.barplot_Num.split(","));
	//samble infor
	//treatment_history
	if (methods_end_re.treatment_history_error=="no"){
		plotyPielot("treatment_pie",methods_end_re.treatment_history_value_pie.split(","),methods_end_re.treatment_history_label.split(","),methods_end_re.treatment_history_color.split(","),'treatment_history');
		plotyViolinplot("treatment_violin",webpath+"/"+methods_end_re.treatment_history_violin_filename,methods_end_re.treatment_history_label,methods_end_re.treatment_history_color,'treatment_history');
	}else{
		document.getElementById("treatment_exp").innerHTML= "No infor";
	}
	//tumor_stage
	if (methods_end_re.tumor_stage_error=="no"){
		plotyPielot("tumor_stage_pie",methods_end_re.tumor_stage_value_pie.split(","),methods_end_re.tumor_stage_label.split(","),methods_end_re.tumor_stage_color.split(","),'tumor_stage');
		plotyViolinplot("tumor_stage_violin",webpath+"/"+methods_end_re.tumor_stage_violin_filename,methods_end_re.tumor_stage_label,methods_end_re.tumor_stage_color,'tumor_stage');
	}else{
		document.getElementById("tumor_stage_exp").innerHTML= "No infor";
	}
	//sex
	if (methods_end_re.sex_error=="no"){
		plotyPielot("sex_pie",methods_end_re.sex_value_pie.split(","),methods_end_re.sex_label.split(","),methods_end_re.sex_color.split(","),'sex');
		plotyViolinplot("sex_violin",webpath+"/"+methods_end_re.sex_violin_filename,methods_end_re.sex_label,methods_end_re.sex_color,'sex');
	}else{
		document.getElementById("sex_exp").innerHTML= "No infor";
	}
	//smoke_history
	if (methods_end_re.smoke_history_error=="no"){
		plotyPielot("smoke_history_pie",methods_end_re.smoke_history_value_pie.split(","),methods_end_re.smoke_history_label.split(","),methods_end_re.smoke_history_color.split(","),'smoke_history');
		plotyViolinplot("smoke_history_violin",webpath+"/"+methods_end_re.smoke_history_violin_filename,methods_end_re.smoke_history_label,methods_end_re.smoke_history_color,'smoke_history');
	}else{
		document.getElementById("smoke_history_exp").innerHTML= "No infor";
	}
	//alcohol_history
	if (methods_end_re.alcohol_history_error=="no"){
		plotyPielot("alcohol_history_pie",methods_end_re.alcohol_history_value_pie.split(","),methods_end_re.alcohol_history_label.split(","),methods_end_re.alcohol_history_color.split(","),'alcohol_history');
		plotyViolinplot("alcohol_history_violin",webpath+"/"+methods_end_re.alcohol_history_violin_filename,methods_end_re.alcohol_history_label,methods_end_re.alcohol_history_color,'alcohol_history');
	}else{
		document.getElementById("alcohol_history_exp").innerHTML= "No infor";
	}
	//demographic
	if (methods_end_re.demographic_error=="no"){
		plotyPielot("demographic_pie",methods_end_re.demographic_value_pie.split(","),methods_end_re.demographic_label.split(","),methods_end_re.demographic_color.split(","),'demographic');
		plotyViolinplot("demographic_violin",webpath+"/"+methods_end_re.demographic_violin_filename,methods_end_re.demographic_label,methods_end_re.demographic_color,'demographic');
	}else{
		document.getElementById("demographic_exp").innerHTML= "No infor";
	}
	
	//diagnosis_age
	if (methods_end_re.diagnosis_age_error=="no"){
		plotyBraplot_2("diagnosis_age_bar",methods_end_re.diagnosis_age_value.split(","),methods_end_re.diagnosis_age_label.split(","),'The number of Samples belonging to each age of diagnosis ');
		document.getElementById("diagnosis_age_scatter").src = webpath+"/"+methods_end_re.diagnosis_age_scatter_p;
	}else{
		document.getElementById("diagnosis_age_exp").innerHTML= "No infor";
	}
	//TMB
	if (methods_end_re.TMB_error=="no"){
		plotyBraplot_2("TMB_bar",methods_end_re.TMB_value.split(","),methods_end_re.TMB_label.split(","),'The number of Samples belonging to each age of diagnosis ');
		document.getElementById("TMB_scatter").src = webpath+"/"+methods_end_re.TMB_scatter_p;
	}else{
		document.getElementById("TMB_exp").innerHTML= "No infor";
	}
	//Mutation
	if (methods_end_re.Mutation_error=="no"){
		plotyBraplot_2("Mutation_bar",methods_end_re.Mutation_value.split(","),methods_end_re.Mutation_label.split(","),'The number of Samples belonging to each age of diagnosis ');
		document.getElementById("Mutation_scatter").src = webpath+"/"+methods_end_re.Mutation_scatter_p;
	}else{
		document.getElementById("Mutation_exp").innerHTML= "No infor";
	}
	
}

function DownStreamSubmit(){
	var UserTaskID=document.getElementById("UserTaskID").value;
	window.location.href="DownStream.jsp?UserTaskID="+UserTaskID;
}



function plotyBraplot_2(divName,y_values,x_lab,title){
	var width=$("#bulk").width();
	$("#"+divName).css("width",width*0.5);
	var div=divName;
	var y_num=y_values;
	//x_lab=['0 - 0.1', '0.1 - 0.2', '0.2 - 0.3', '0.3 - 0.4', '0.4 - 0.5', '0.5 - 0.6', '0.6 - 0.7', '0.7 - 0.8', '0.8 - 0.9', '0.9 - 1'];
	//自定义 hovertext
	var text1=[];
	for (var j=0;j<x_lab.length;j++){
	text1.push("  Group :  "+x_lab[j]+"   <br>"+" Sample Number : "+y_num[j]+"  ");
	}
	var trace1 = {
	  x: x_lab,
	  y: y_num,
	  hovertext :text1,
	  hoverinfo :"text",
	  marker:{
		color: ["#CBB2BA" ,"#C29CA8", "#B98696" ,"#B07084", "#A75A72", "#9E4460", "#952E4E" ,"#8C183D"]
	  },
	  type: 'bar'
	};
	var data = [trace1];
	var layout = {
			//margin: {"t": -80,"r": 5}, //饼图边缘距离画布上下左右边界的距离，单位px
//			xaxis: {
//		        title: 'Group'
//		        	},
		yaxis: {
	         //range: [0, 8],
	        title: 'No. of Samples' ,
	        zeroline: true
	        	},
		height: 420,
		//title: title,
		font: {size: 15}
			};
Plotly.newPlot(div, data, layout);
}

function plotyViolinplot(divName,path,labels,color,title) {
	var width=$("#bulk").width();
	$("#"+divName).css("width",width*0.58);
	var celltype_all=labels.split(",");
	var color_all=color.split(",");
	var style_all=[];
	for (var i=0;i<celltype_all.length;i++)
		{ 	var json0={};
			var json_value={};
			var json_color={};
			json_color["color"]=color_all[i];
			json_value["line"]=json_color;
			json0["target"]=celltype_all[i];
			json0["value"]=json_value;
			style_all.push(json0);
		}
	/////
	d3.csv(path, function(err, rows){
	  function unpack(rows, key) {
	  return rows.map(function(row) { return row[key]; });
	  }

	var data = [{
	  type: 'violin',
	  x: unpack(rows, 'violin_x'),
	  y: unpack(rows, 'violin_y'),
	  points: 'none',//all，none
	  box: {
	    visible: true
	  },
	  meanline: {
	    visible: true
	  },
	  transforms: [{
	  	 type: 'groupby',
		 groups: unpack(rows, 'violin_x'),
		styles: style_all
		 
		}]
	}]

	var layout = {
height: 400,
	  //title: title,
	  font: {size: 15},
	  yaxis: {
		  //range: [0, 7800],
		title:'CSscore',
	    zeroline: true
	  }
	}

	Plotly.newPlot(divName, data, layout);
	});
	/////
}
function plotyPielot(divName,value,labels,color,title){
	var width=$("#bulk").width();
	$("#"+divName).css("width",width*0.4);
	//自定义 hovertext
	var text1=[];
	for (var j=0;j<value.length;j++){
	text1.push(" Class :  "+labels[j]+"   <br>"+"Sample number : "+value[j]+"  ");
	}
	var data = [{
			values: value,
			labels: labels,
			  hovertext :text1,
			  hoverinfo :"text",
			marker: {
				colors: color},
			type: 'pie'
				}];
		var layout = {
	  height: 400,
	  //width: 500,
	//title: title,
	  showlegend: false,
	  font: {size: 15}
	   
	  
	};

	Plotly.newPlot(divName, data, layout);
}


function csScoreDateTable(path){
	var path=path;
	$(document).ready(function() {
		$('#CSscoreTable').DataTable( {
		"deferRender": true,//big data
		"bProcessing": true, //显示是否加载 
		"paginationType": "full_numbers",//详细分页组，可以支持直接跳转到某页 
		//'paging': false,
		"serverSide": false,      //后台处理分页则为true  
		"aaSorting": [[ 1, "desc" ]],
		'ordering'  :true,
		'ajax': path,
		'columns':[{'data':'samplename'},
					{'data':'score'}
					]
		} );  
		} );
}


function plotyBraplot(divName,numList){
	var div=divName;
	var y_num=numList;
	x_lab=['0 - 0.1', '0.1 - 0.2', '0.2 - 0.3', '0.3 - 0.4', '0.4 - 0.5', '0.5 - 0.6', '0.6 - 0.7', '0.7 - 0.8', '0.8 - 0.9', '0.9 - 1'];
	
	//自定义 hovertext
	var text1=[];
	for (var j=0;j<x_lab.length;j++){
	text1.push(" Score Group :  "+x_lab[j]+"   <br>"+" Sample Number : "+y_num[j]+"  ");
	}
	var trace1 = {
	  x: x_lab,
	  y: y_num,
	  hovertext :text1,
	  hoverinfo :"text",
	  marker:{
		color: ["#DEDEDE","#D4C8CC" ,"#CBB2BA" ,"#C29CA8", "#B98696" ,"#B07084", "#A75A72", "#9E4460", "#952E4E" ,"#8C183D"]
	  },
	  type: 'bar'
	};
	var data = [trace1];
	var layout = {
		yaxis: {
	         //range: [0, 8],
	        title: 'No. of Samples' ,
	        zeroline: true
	        	},
		height: 600,
		title: '',
		font: {size: 15}
			};
Plotly.newPlot(div, data, layout);
}

function plotyBraplot_single(divName,numList){
	var div=divName;
	var y_num=numList;
	x_lab=['0 - 0.1', '0.1 - 0.2', '0.2 - 0.3', '0.3 - 0.4', '0.4 - 0.5', '0.5 - 0.6', '0.6 - 0.7', '0.7 - 0.8', '0.8 - 0.9', '0.9 - 1'];
	
	//自定义 hovertext
	var text1=[];
	for (var j=0;j<x_lab.length;j++){
	text1.push(" Score Group :  "+x_lab[j]+"   <br>"+" Cell Number : "+y_num[j]+"  ");
	}
	var trace1 = {
	  x: x_lab,
	  y: y_num,
	  hovertext :text1,
	  hoverinfo :"text",
	  marker:{
		color: ["#DEDEDE","#D4C8CC" ,"#CBB2BA" ,"#C29CA8", "#B98696" ,"#B07084", "#A75A72", "#9E4460", "#952E4E" ,"#8C183D"]
	  },
	  type: 'bar'
	};
	var data = [trace1];
	var layout = {
		yaxis: {
	         //range: [0, 8],
	        title: 'No. of Cells' ,
	        zeroline: true
	        	},
		height: 600,
		title: '',
		font: {size: 15}
			};
Plotly.newPlot(div, data, layout);
}