UserTaskID=document.getElementById("UserTaskID").value;
webpath="example/"+UserTaskID;
//webpath="example/single";
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
//	if (methods_end_re.dataType=="bulk"){datatype0="bulk RNA-seq"}else{datatype0="single-cell RNA-seq""}
//	document.getElementById("datatype").innerHTML= datatype0;
	document.getElementById("expfile").innerHTML= methods_end_re.ExpfileName;
	document.getElementById("samplefile").innerHTML= methods_end_re.SamplefileName;
	document.getElementById("samplenum").innerHTML= methods_end_re.SampleNumCancer+" (tumor)" + " / " + methods_end_re.SampleNumAll+" (all)";
	document.getElementById("genenum").innerHTML= methods_end_re.GeneNumAll;
	// table
	csScoreDateTable(webpath+"/"+methods_end_re.CStable_webName);
		//table download
		document.getElementById('csScoreDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.CStable_downloadName+"&name=CSscore.txt";
	
		
		if(methods_end_re.method=="StemID"){
			document.getElementById('download_exp').href ="download_loading.jsp?path=example/GSE115978_count_select.txt&name="+UserTaskID+"_Expression_Example.txt";
			}else{
				document.getElementById('download_exp').href ="download_loading.jsp?path=example/GSE115978_TPM_select.txt&name="+UserTaskID+"_Expression_Example.txt";
			}
			document.getElementById('download_sample').href ="download_loading.jsp?path=example/GSE115978__feature_use.txt&name="+UserTaskID+"_Sample_information_Example.txt";
			
		
		
		
		document.getElementById("dis_sample").innerHTML= "No. of cells";
		document.getElementById("table_sample").innerHTML= "Cells";
		document.getElementById("plot_sample").innerHTML= "Distribution of cell CSscore";
		plotyBraplot_single("barplot",methods_end_re.barplot_Num.split(","));
		//Sample_source
		if (methods_end_re.Sample_source_error=="no"){
		plotyPielot("Sample_source_pie",methods_end_re.Sample_source_value_pie.split(","),methods_end_re.Sample_source_label.split(","),methods_end_re.Sample_source_color.split(","),'Sample_source');
		plotyViolinplot("Sample_source_violin",webpath+"/"+methods_end_re.Sample_source_violin_filename,methods_end_re.Sample_source_label,methods_end_re.Sample_source_color,'Sample_source');
		}else{
			document.getElementById("Sample_source_exp").innerHTML= "No infor";
		}
		//Drug_treatment
		if (methods_end_re.Drug_treatment_error=="no"){
		plotyPielot("Drug_treatment_pie",methods_end_re.Drug_treatment_value_pie.split(","),methods_end_re.Drug_treatment_label.split(","),methods_end_re.Drug_treatment_color.split(","),'Drug_treatment');
		plotyViolinplot("Drug_treatment_violin",webpath+"/"+methods_end_re.Drug_treatment_violin_filename,methods_end_re.Drug_treatment_label,methods_end_re.Drug_treatment_color,'Drug_treatment');
		}else{
			document.getElementById("Drug_treatment_exp").innerHTML= "No infor";
		}
		//RNA_v
			document.getElementById("load_v").style.display="none";
			document.getElementById("img_v").src = webpath+"/RNA_v/RNA_v.png";
			document.getElementById("img_s").src = webpath+"/RNA_v/RNA_score.png";
			
	
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