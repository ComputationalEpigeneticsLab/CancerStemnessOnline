UserTaskID=document.getElementById("UserTaskID").value;
webpath="example/multifunction/"+UserTaskID;


methods_single=["CytoTRACE","SLICE","SCENT","StemID","GSVA","StemSC"];
methods_bulk=["mRNAsi","StemnessIndex","GSVA"];
mult_re="";
$.ajaxSettings.async = false;
$.getJSON(webpath+"/time.txt", "", function(data_re) {
	mult_re=data_re;
});


//console.log('GSVA_ASDFF'.substr(5,'GSVA_ASDFF'.length-1));
//
methods=mult_re["methodName"].split(",");
methodsTime=mult_re["methodTime"].split(",");
//table
var colnames=mult_re["methodName"].split(",");
colnames.push("RRA_p");
colnames.push("RRA_rank");
colnames.unshift('samplename');

var path=webpath+"/score_RRA_dataTable.txt";
autoColTable(path,colnames,'RRATable');
//plot
var x=mult_re["methodName"].split(",");
var y=mult_re["spearman_corr"].split(",");
var p=mult_re["spearman_corr_p"].split(",");
bubble_plot_speram(x,y,p,'Spearman correlation coefficient between method and RRA','methodspearman');
bar_h(methodsTime,methods,'Time of method','methodTime');

//view
var href="";
var html_inner="";
for (var i=0;i<methods.length;i++){
	if(methods[i].includes("GSVA")){
		if(mult_re["data_type"]=="count"){
			href="exampleCSidentifyResultMultSingle.jsp?UserTaskID="+UserTaskID+"&Method="+methods[i];
			html_inner=html_inner+'<div class="col-lg-4 "><a  href='+href+'><button class="button_style">'+methods[i]+'</button></a></div>';
		}else{
			href="exampleCSidentifyResultMultBulk.jsp?UserTaskID="+UserTaskID+"&Method="+methods[i];
			html_inner=html_inner+'<div class="col-lg-4 "><a  href='+href+'><button class="button_style">'+methods[i]+'</button></a></div>';
		}
	}else{
		if(methods_single.indexOf(methods[i])!=-1){
			href="exampleCSidentifyResultMultSingle.jsp?UserTaskID="+UserTaskID+"&Method="+methods[i];
			html_inner=html_inner+'<div class="col-lg-4 "><a  href='+href+'><button class="button_style">'+methods[i]+'</button></a></div>';
		}else{
			href="exampleCSidentifyResultMultBulk.jsp?UserTaskID="+UserTaskID+"&Method="+methods[i];
			html_inner=html_inner+'<div class="col-lg-4 "><a  href='+href+'><button class="button_style">'+methods[i]+'</button></a></div>';
		}
	}
}
document.getElementById("view_sm").innerHTML=html_inner;

///////////// table ///////

function autoColTable(path,colnames,div){
	//colnames：会写到页面上，colname和匹配文件中的key。
	var table_inner="<thead ><tr class='table_head1'>";
	var columns=[];
	for (var i=0;i<colnames.length;i++){
		if(colnames[i]=="samplename"){
		table_inner=table_inner+"<th>Sample</th>";
		}else if(colnames[i]=="RRA_score"){
			table_inner=table_inner+"<th>RRA score</th>";
		}else if(colnames[i]=="RRA_score_scale"){
			table_inner=table_inner+"<th>RRA score scale</th>";
		}else{
			table_inner=table_inner+"<th>"+colnames[i]+"</th>";
		} 
		json={};
		json['data']=colnames[i];
		columns.push(json);
	}
	table_inner=table_inner+"</tr></thead>";
	document.getElementById(div).innerHTML=table_inner;
	
	$(document).ready(function() {
    		$("#"+div).DataTable( {
    		"bLengthChange": false, //开关，是否显示每页显示多少条数据的下拉框
    		"searching" : false,//开关,search 
            //"aLengthMenu": [10,20,30],//设置每页显示数据条数的下拉选项
            'iDisplayLength': 8, //每页初始显示5条记录
    		"deferRender": true,
    		"bProcessing": true, 
    		"paginationType": "full_numbers",
    		"serverSide": false, 
    		"order": [[ 1, 'desc' ]],
    		'ajax': path,
    		'columns':columns
    		
    		} );  
    		} );
	
}

///////////// plot ////////
function bubble_plot_speram(x,y,p,title,div){
	var symbol=[];
	var color=[];
	var size=[];
	var width=[];
	var color_line=[];
	var text1=[];
	for (var i=0;i<y.length;i++){
		symbol.push('circle');
		color.push('rgb(93, 164, 214)');
		color_line.push('red');
		size.push(getAbsoluteValue(y[i])*50);
		if(p[i]<0.05){
			width.push(getAbsoluteValue(y[i])*50);
		}else{
			width.push(0);
		}
		text1.push("Method : "+x[i]+" <br>"+"Spearman correlation : "+y[i]+" <br>"+"P value : "+p[i]+"  ");
	}
	var trace = {
		x:x,
		y:y,
		hovertext :text1,
	    hoverinfo :"text",
		mode: 'markers',
		marker: {
    symbol: symbol,
    color: color,
    size: size,
    line: {
      color: color_line,
      width: width
    }
  },
  type: 'scatter'
	};
	var data = [ trace];

	var layout = {
		margin: {"t": 80, "b": 200, "l": 40, "r": 20}, //图边缘距离画布上下左右边界的距离，单位px
		showlegend: false,
		font :{	size :12,},
		title: title,
		//xaxis{
	       //title: 'Method' ,
	        	//},
		yaxis: {
	       title: 'Spearman correlation' ,
	        	}
	};

	Plotly.newPlot(div, data, layout);
}
function getAbsoluteValue(number) {
  if (number < 0) {
    return -number;
  } else {
    return number;
  }
}


function bar_h(x,y,title,div){

//自定义 hovertext
	var text1=[];
	for (var j=0;j<x.length;j++){
	text1.push("Method : "+y[j]+" <br>"+"Time : "+x[j]+"  ");
	}
var trace1 = {
  x: x,
  y: y,
  hovertext :text1,
  hoverinfo :"text",
  name: 'Time',
  orientation: 'h',
  marker: {
    color: 'red',
    width: 3
  },
  type: 'bar'
};
var data = [trace1];
var layout = {
  title: title,
  font :{size :12,},
  margin: {"t": 80, "b": 150, "l": 200, "r": 20}, //图边缘距离画布上下左右边界的距离，单位px
  xaxis: {
				//range: [ 0.75, 5.25 ],
				title: "Time (minute)" ,
				//showticklabels : false,
				//zeroline: true
			  },
  barmode: 'stack'
	};
	Plotly.newPlot(div, data, layout);
	
var myPlot = document.getElementById(div);
myPlot.on('plotly_click', function(data){
    var pts = '';
    var method_click="";
    for(var i=0; i < data.points.length; i++){
        pts = 'x = '+data.points[i].x +'\ny = '+ data.points[i].y + '\n\n';
        method_click=data.points[i].y;
    }
//console.log(data.points);
//console.log(pts);
//console.log(method_click);
if(method_click.includes("GSVA")){
	if(mult_re["data_type"]=="count"){
		window.location.href="exampleCSidentifyResultMultSingle.jsp?UserTaskID="+UserTaskID+"&Method="+method_click;
	}else{
		window.location.href="exampleCSidentifyResultMultBulk.jsp?UserTaskID="+UserTaskID+"&Method="+method_click;
	}
}else{
	if(methods_single.indexOf(method_click)!=-1){
	window.location.href="exampleCSidentifyResultMultSingle.jsp?UserTaskID="+UserTaskID+"&Method="+method_click;
	}else{
	window.location.href="exampleCSidentifyResultMultBulk.jsp?UserTaskID="+UserTaskID+"&Method="+method_click;
	}
}


});


}