function showResult(foldName){
	var foldName=foldName;
	var webpath="data/"+foldName;

	methods_end_re="";
	$.ajaxSettings.async = false;
	$.getJSON(webpath+"/CS_re.txt", "", function(data_re) {
		methods_end_re=data_re;
	});
	if(methods_end_re.stopMessage=="no"){
	//document.getElementById("jobid").innerHTML= methods_end_re.JobID;
	document.getElementById("method").innerHTML= methods_end_re.method;
	if (methods_end_re.dataType=="bulk"){datatype0="bulk RNA-seq"}else{datatype0="single-cell RNA-seq"}
	document.getElementById("datatype").innerHTML= datatype0;
	//document.getElementById("expfile").innerHTML= methods_end_re.ExpfileName;
	//document.getElementById("samplefile").innerHTML= methods_end_re.SamplefileName;
	document.getElementById("samplenum").innerHTML= methods_end_re.SampleNumCancer;
	//document.getElementById("genenum").innerHTML= methods_end_re.GeneNumAll;
	// table
	csScoreDateTable(webpath+"/CSscore_infor_table.txt");
	
	if(methods_end_re.dataType=="bulk"){
		plotyBraplot("barplot",methods_end_re.barplot_Num.split(","));
	}else{
		document.getElementById("sample_name").innerHTML= "Cell";
		document.getElementById("dis_sample").innerHTML= "No. of cells";
		plotyBraplot_single("barplot",methods_end_re.barplot_Num.split(","));
	}
	}
	
}

function csScoreDateTable(path){
	var path=path;
	if ($('#CSscoreTable').hasClass('dataTable')) {
		var oTable = $("#CSscoreTable").dataTable();
		oTable.fnClearTable();  //清空数据
		oTable.fnDestroy();  //销毁datatable
    }
	$(document).ready(function() {
		$('#CSscoreTable').DataTable( {
		"deferRender": true,//big data
		"bProcessing": true, //显示是否加载 
		"paginationType": "full_numbers",//详细分页组，可以支持直接跳转到某页 
		//'paging': false,
		"serverSide": false,      //后台处理分页则为true  
		"aaSorting": [[ 1, "desc" ]],
		'ordering'  :true,
		//'retrieve': true,
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