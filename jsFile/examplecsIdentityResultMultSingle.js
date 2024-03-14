UserTaskID=document.getElementById("UserTaskID").value;
MethodName=document.getElementById("Method").value;
//webpath="upload/"+UserTaskID+"/"+MethodName;
if(MethodName.includes("GSVA")){
	webpath="example/multifunction/"+UserTaskID+"/GSVA/"+MethodName.substr(5,MethodName.length-1);
}else{
webpath="example/multifunction/"+UserTaskID+"/"+MethodName;
}
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
	if (methods_end_re.dataType=="bulk"){datatype0="bulk RNA-seq"}else{datatype0="single-cell RNA-seq"}
	document.getElementById("datatype").innerHTML= datatype0;
	document.getElementById("expfile").innerHTML= methods_end_re.ExpfileName;
	document.getElementById("samplefile").innerHTML= methods_end_re.SamplefileName;
	document.getElementById("samplenum").innerHTML= methods_end_re.SampleNumCancer+" (tumor)" + " / " + methods_end_re.SampleNumAll+" (all)";
	document.getElementById("genenum").innerHTML= methods_end_re.GeneNumAll;
	
	document.getElementById('download_exp').href ="download_loading.jsp?path=example/GSE115978_count_select.txt&name="+MethodName+"_Expression_Example.txt";
	document.getElementById('download_sample').href ="download_loading.jsp?path=example/GSE115978__feature_use.txt&name="+MethodName+"_Sample_information_Example.txt";
			
	// table
	csScoreDateTable(webpath+"/"+methods_end_re.CStable_webName);
		//table download
		document.getElementById('csScoreDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.CStable_downloadName+"&name=CSscore.txt";
	//barplot
	
	
	if(methods_end_re.dataType=="bulk"){
		document.getElementById("singleOption").style.display="none";
		document.getElementById("RNA_v").style.display="none";
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
	}else{
		document.getElementById("bulkOption").style.display="none";
		document.getElementById("dis_sample").innerHTML= "No. of cells";
		document.getElementById("table_sample").innerHTML= "Cells";
		document.getElementById("plot_sample").innerHTML= "Distribution of cell CSscores";
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
		if(methods_end_re.hasOwnProperty("RNA_v")){
			document.getElementById("load_v").style.display="none";
			rna_v_re="";
			$.ajaxSettings.async = false;
			$.getJSON(webpath+"/CS_monocle.txt", "", function(data_re) {
				rna_v_re=data_re;
			});
			rna_v_plot_Pseudotime(rna_v_re,'time');
			rna_v_plot_csscore(rna_v_re,'csscore');
			}else{
				 //RNA_v_F_new(methods_end_re.JobID,webpath);
			}
	}
}

function DownStreamSubmit(){
	var UserTaskID=document.getElementById("UserTaskID").value;
	window.location.href="DownStream.jsp?UserTaskID="+UserTaskID;
}


function RNA_v_F_new(ID,webpath){
	var ID=ID;
	var webpath=webpath;
	var xmlHttp=new XMLHttpRequest();
	xmlHttp.onreadystatechange =function(){
		//处理返回的数据，更新当前页面
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
			var returnData=xmlHttp.responseText;
			var jsonobj=JSON.parse(returnData);
			//
			if (jsonobj.error_attention=="no"){
			document.getElementById("load_v").style.display="none";
			rna_v_re="";
			$.ajaxSettings.async = false;
			$.getJSON("example/CS_monocle.txt", "", function(data_re) {
				rna_v_re=data_re;
			});
			rna_v_plot_Pseudotime(rna_v_re,'time');
			rna_v_plot_csscore(rna_v_re,'csscore');
			}else{
				document.getElementById("load_v").style.display="none";
				document.getElementById("rna_v_d").innerHTML= "Something wrong";
			}
				}
			}
	xmlHttp.open("get","RNA_v_Run.jsp?ID="+ID,true);
	xmlHttp.send();
}

function RNA_v_F(ID,webpath){
	var ID=ID;
	var webpath=webpath;
	var xmlHttp=new XMLHttpRequest();
	xmlHttp.onreadystatechange =function(){
		//处理返回的数据，更新当前页面
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
			var returnData=xmlHttp.responseText;
			var jsonobj=JSON.parse(returnData);
			//
			if (jsonobj.error_attention=="no"){
			document.getElementById("load_v").style.display="none";
			document.getElementById("img_v").src = webpath+"/RNA_v/RNA_v.png";
			document.getElementById("img_s").src = webpath+"/RNA_v/RNA_score.png";
			}else{
				document.getElementById("load_v").style.display="none";
				document.getElementById("rna_v_d").innerHTML= "Something wrong";
			}
				}
			}
	xmlHttp.open("get","RNA_v_Run.jsp?ID="+ID,true);
	xmlHttp.send();
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

//





function rna_v_plot_Pseudotime(rna_v_re,div){
		var time_max=1;
		var scatlyj1_0 =[];
		var track_effect=true;
		var color0=[];
		
		 time_max=Number(rna_v_re["time_max"]);
		 scatlyj1_0 = rna_v_re["Pseudotime"].split(",");//exp value
		 color0=['#132C44', '#56B0F6'];
		

		var scatlyj1_1 = rna_v_re["cell"].split(",");//cell symbol
		var scatlyj1_3 = rna_v_re["tsne_x"].split(",");//x
		var scatlyj1_4 = rna_v_re["tsne_y"].split(",");//y
		var scatlyj1_7 = rna_v_re["edges_coordinate"].split(";");//lines



		var data_lines=[];
		for (var i=0;i<scatlyj1_7.length;i++){
			var json0={};
			var coords0=[];
			coords0_arr=scatlyj1_7[i].split("],[");
			
			var coords000=[];
			coords0_0_arr=coords0_arr[0].split(",");
			coords000.push(Number(coords0_0_arr[0].substr(1,coords0_0_arr[0].length-1)));
			coords000.push(Number(coords0_0_arr[1]));
			coords0.push(coords000);
			
			
			coords000=[];
			coords0_1_arr=coords0_arr[1].split(",");
			coords000.push(Number(coords0_1_arr[0]));
			coords000.push(Number(coords0_1_arr[1].substr(0,coords0_1_arr[1].length-2)))
			coords0.push(coords000);
			
			//coords0.push();
			//coords0.push(scatlyj1_7[i].split("],")[1]);
			var coords00=[];
			coords00.push(coords0);
			json0["coords"]=coords0;
			data_lines.push(json0);
		}




		var data_mu = [];
		for (var i=0;i<scatlyj1_3.length;i++){
			var json0={};
			var value0=[];
			json0["name"]=scatlyj1_1[i];
			value0.push(Number(scatlyj1_3[i]));
			value0.push(Number(scatlyj1_4[i]));
			value0.push(Number(scatlyj1_0[i]).toString());
			json0["value"]=value0;
			data_mu.push(json0);
		}



		//////////////
		var myChart = echarts.init(document.getElementById(div));
		option = {
						title: {
								text: 'Pseudotime',
								left: 'center',
								top: 0,
								//subtext:'hh'    
							},
						grid: {
							left: '5%',
							right: '10%',
							bottom: '10%',
							top:'8%',
							containLabel: true
						},
						brush: {
							xAxisIndex: 'all',
							yAxisIndex: 'all',
							toolbox:['rect', 'polygon', 'clear'],
							brushStyle:{                	
									borderWidth: 1,
									color: 'rgba(242, 135, 5,0.3)',
									borderColor: 'rgba(242, 135, 5,0.8)'
								
							},
							outOfBrush: {
								colorAlpha: 0.1
							}
						},
						toolbox:{
							show:true,
							showTitle:true,
							top:0,
							left:'right',
							//bottom:0,
							feature:{
								dataView:{
									show:true,
									title:'Data View',
									lang:['Data View','Close','Refresh'],
									buttonColor : '#F28705',
									optionToContent: function(opt) {                           
										var series = opt.series;                          
										//console.log(series);                           
										var length=series[0].data.length  //get length                          
										//console.log(length);                                                        
										var name=series[0].data[1].name;
										//console.log(name);                           
										var x=series[0].data[1].value[0];
										console.log(x);                 
										var table = '<table  class="altrowstable"  style="width:100%;text-align:center"><tbody><tr>'
													 + '<td>Cell name</td>'
													 + '<td>x</td>'
													 + '<td>y</td>'
													 + '<td>Pseudotime</td>'
													 + '</tr>';
										for (var i = 0, l = length; i < l; i++) {
											table += '<tr>'
													 + '<td>' + series[0].data[i].name + '</td>'
													 + '<td>' + series[0].data[i].value[0] + '</td>'
													 + '<td>' + series[0].data[i].value[1] + '</td>'
													 + '<td>' + series[0].data[i].value[2] + '</td>'
													 + '</tr>';
										}
										table += '</tbody></table>';
										return table;
									} 
								},
								//
// 								restore:{
// 									show:true,
// 									title:'Restore'
// 								},
								saveAsImage:{
									show:true,
									title:'Save As Image'
								},
								//
								dataZoom:{
									show:true,
									title:{
										zoom:'Zoom Region',
										back:'Zoom Region Back'
									}
								},
								brush:{
									title:{rect:'Rectangular Region',polygon : 'Polygon Region',clear : 'Clear Region'}
								}
							},
							 iconStyle:{
								bordercolor:'#F28705'
							} 
						},
						visualMap: {
							min: 0.0,          
							max: time_max,  
							
							
							padding: [
								10,  //
								0, //
								5,  //
								10, //
							],
							orient: 'vertical',
							right: 0,
							top: 'center',
							text: ['Pseudotime', ''],
							precision:1,
							calculable: true,
							inRange: {
							   /*   color: ['#D3D2D2','#FE5C00'], */
							  // color:['rgba(211,211,211,0.1)','#FFAA8E','#FF8B73','#FF6D58','#F54E3F','#d32c26'],
								color: color0,
							},
							textStyle:{
								
								fontWeight:'bold'
							}
						},
						tooltip: {
							showDelay: 0,
							trigger: 'item',
						  //formatter:'{c}'
							formatter: function (params) {
							/*if (params.value.length > 1) { */	
								return '<span style="font-weight:bold">'+'Pseudotime:'+params.value[2]+'</span>'+'<br/>'+
								params.name +'<br/>'+'('
								+ params.value[0]+','+params.value[1]+')' ; 
						   /* }
							else {
								return params.seriesName + ' :<br/>'
								+ params.name + ' : '
								+ params.value ;
							}*/
						},
						axisPointer: {
							show: true,
							type: 'cross',
							lineStyle: {
								type: 'dashed',
								width: 1
							}
						}
					},
					xAxis: {
						name:"Component1",
						nameLocation:"middle",//middle start end
						nameTextStyle:{
							  fontWeight : 'bolder',
							  fontSize : 14,
						},
						 axisLine: {
					            show: false
					        },
					        axisTick: {
					            show: false
					        },
						nameGap:30,
					},
					yAxis: {
						name:"Component2",
						nameLocation:"middle",//middle start end
						nameGap:30,
						 axisLine: {
					            show: false
					        },
					        axisTick: {
					            show: false
					        },
						nameTextStyle:{
							   fontWeight : 'bolder',
							   fontSize : 14,
							   },
					},
					series: [
							 {
							type: 'scatter',
							symbolSize: 5,
							   animationDelay: function (idx) {
									return idx *5;
									},
							  //symbolSize : 10,
							data: data_mu,
							
						},
						{
							type: 'lines',
							coordinateSystem: 'cartesian2d',
							zlevel: 1,
							
							
							// 动画效果
							effect: {
								show: track_effect,
								//period: 13, //特效动画的时间，单位为 s
								trailLength:0.2, //特效尾迹的长度。0~1数值越大尾迹越长
								color: '#EEEEEE',//#64f2ff
									symbol: 'arrow', //箭头图标 arrow,circle
									symbolSize: 2, //图标大小
									constantSpeed: 10
							},
							lineStyle: {
								normal: {
									color: '#EEEEEE',//线被挡住了 颜色不重要
									width: 1,
								   // curveness:-0.24
								}
							},
							data: data_lines,
					},

						],
				animationEasing: 'elasticIn'
		   };
		myChart.setOption(option);
		myChart.on('click', function(param) {
			var name = param.data.name;
			var type = param.dataType;
			console.log(name); 
			console.log(type);	 	    
			
		});

	}



function rna_v_plot_csscore(rna_v_re,div){
	var time_max=1;
		var scatlyj1_0 =[];
		var track_effect=true;
		var color0=[];
		
		time_max=Number(rna_v_re["cscore_max"]);
		 scatlyj1_0 = rna_v_re["CSscore"].split(",");//exp value
		 color0=['white', '#8C183D'];
		

		var scatlyj1_1 = rna_v_re["cell"].split(",");//cell symbol
		var scatlyj1_3 = rna_v_re["tsne_x"].split(",");//x
		var scatlyj1_4 = rna_v_re["tsne_y"].split(",");//y
		var scatlyj1_7 = rna_v_re["edges_coordinate"].split(";");//lines



		var data_lines=[];
		for (var i=0;i<scatlyj1_7.length;i++){
			var json0={};
			var coords0=[];
			coords0_arr=scatlyj1_7[i].split("],[");
			
			var coords000=[];
			coords0_0_arr=coords0_arr[0].split(",");
			coords000.push(Number(coords0_0_arr[0].substr(1,coords0_0_arr[0].length-1)));
			coords000.push(Number(coords0_0_arr[1]));
			coords0.push(coords000);
			
			
			coords000=[];
			coords0_1_arr=coords0_arr[1].split(",");
			coords000.push(Number(coords0_1_arr[0]));
			coords000.push(Number(coords0_1_arr[1].substr(0,coords0_1_arr[1].length-2)))
			coords0.push(coords000);
			
			//coords0.push();
			//coords0.push(scatlyj1_7[i].split("],")[1]);
			var coords00=[];
			coords00.push(coords0);
			json0["coords"]=coords0;
			data_lines.push(json0);
		}




		var data_mu = [];
		for (var i=0;i<scatlyj1_3.length;i++){
			var json0={};
			var value0=[];
			json0["name"]=scatlyj1_1[i];
			value0.push(Number(scatlyj1_3[i]));
			value0.push(Number(scatlyj1_4[i]));
			value0.push(Number(scatlyj1_0[i]).toString());
			json0["value"]=value0;
			data_mu.push(json0);
		}



		//////////////
		var myChart = echarts.init(document.getElementById(div));

		
		option = {
						title: {
								text: 'CSscore',
								left: 'center',
								top: 0,
								//subtext:'hh'    
							},
						grid: {
							left: '5%',
							right: '10%',
							bottom: '10%',
							top:'8%',
							containLabel: true
						},
						brush: {
							xAxisIndex: 'all',
							yAxisIndex: 'all',
							toolbox:['rect', 'polygon', 'clear'],
							brushStyle:{                	
									borderWidth: 1,
									color: 'rgba(242, 135, 5,0.3)',
									borderColor: 'rgba(242, 135, 5,0.8)'
								
							},
							outOfBrush: {
								colorAlpha: 0.1
							}
						},
						toolbox:{
							show:true,
							showTitle:true,
							top:0,
							left:'right',
							//bottom:0,
							feature:{
								dataView:{
									show:true,
									title:'Data View',
									lang:['Data View','Close','Refresh'],
									buttonColor : '#F28705',
									optionToContent: function(opt) {                           
										var series = opt.series;                          
										//console.log(series);                           
										var length=series[0].data.length  //get length                          
										//console.log(length);                                                        
										var name=series[0].data[1].name;
										//console.log(name);                           
										var x=series[0].data[1].value[0];
										console.log(x);                 
										var table = '<table  class="altrowstable"  style="width:100%;text-align:center"><tbody><tr>'
													 + '<td>Cell name</td>'
													 + '<td>x</td>'
													 + '<td>y</td>'
													 + '<td>SCscore</td>'
													 + '</tr>';
										for (var i = 0, l = length; i < l; i++) {
											table += '<tr>'
													 + '<td>' + series[0].data[i].name + '</td>'
													 + '<td>' + series[0].data[i].value[0] + '</td>'
													 + '<td>' + series[0].data[i].value[1] + '</td>'
													 + '<td>' + series[0].data[i].value[2] + '</td>'
													 + '</tr>';
										}
										table += '</tbody></table>';
										return table;
									} 
								},
								//
// 								restore:{
// 									show:true,
// 									title:'Restore'
// 								},
								saveAsImage:{
									show:true,
									title:'Save As Image'
								},
								//
								dataZoom:{
									show:true,
									title:{
										zoom:'Zoom Region',
										back:'Zoom Region Back'
									}
								},
								brush:{
									title:{rect:'Rectangular Region',polygon : 'Polygon Region',clear : 'Clear Region'}
								}
							},
							 iconStyle:{
								bordercolor:'#F28705'
							} 
						},
						visualMap: {
							min: 0.0,          
							max: time_max,  
							
							
							padding: [
								10,  //
								0, //
								5,  //
								10, //
							],
							orient: 'vertical',
							right: 0,
							top: 'center',
							text: ['CSscore', ''],
							precision:1,
							calculable: true,
							inRange: {
							   /*   color: ['#D3D2D2','#FE5C00'], */
							  // color:['rgba(211,211,211,0.1)','#FFAA8E','#FF8B73','#FF6D58','#F54E3F','#d32c26'],
								color: color0,
							},
							textStyle:{
								
								fontWeight:'bold'
							}
						},
						tooltip: {
							showDelay: 0,
							trigger: 'item',
						  //formatter:'{c}'
							formatter: function (params) {
							/*if (params.value.length > 1) { */	
								return '<span style="font-weight:bold">'+'Pseudotime:'+params.value[2]+'</span>'+'<br/>'+
								params.name +'<br/>'+'('
								+ params.value[0]+','+params.value[1]+')' ; 
						   /* }
							else {
								return params.seriesName + ' :<br/>'
								+ params.name + ' : '
								+ params.value ;
							}*/
						},
						axisPointer: {
							show: true,
							type: 'cross',
							lineStyle: {
								type: 'dashed',
								width: 1
							}
						}
					},
					xAxis: {
						name:"Component1",
						nameLocation:"middle",//middle start end
						nameTextStyle:{
							  fontWeight : 'bolder',
							  fontSize : 14,
						},
						nameGap:30,
						axisLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },
					},
					yAxis: {
						name:"Component2",
						nameLocation:"middle",//middle start end
						nameGap:30,
						axisLine: {
				            show: false
				        },
				        axisTick: {
				            show: false
				        },
						nameTextStyle:{
							   fontWeight : 'bolder',
							   fontSize : 14,
							   },
					},
					series: [
							 {
							type: 'scatter',
							symbolSize: 5,
							   animationDelay: function (idx) {
									return idx *5;
									},
							  //symbolSize : 10,
							data: data_mu,
							
						},
						{
							type: 'lines',
							coordinateSystem: 'cartesian2d',
							zlevel: 1,
							
							
							// 动画效果
							effect: {
								show: track_effect,
								//period: 13, //特效动画的时间，单位为 s
								trailLength:0.2, //特效尾迹的长度。0~1数值越大尾迹越长
								color: '#EEEEEE',//#64f2ff
									symbol: 'arrow', //箭头图标 arrow,circle
									symbolSize: 2, //图标大小
									constantSpeed: 10
							},
							
							lineStyle: {
								normal: {
									color: '#EEEEEE',//线被挡住了 颜色不重要
									width: 1,
								   // curveness:-0.24
								}
							},
							data: data_lines,
					},

						],
				animationEasing: 'elasticIn'
		   };
		myChart.setOption(option);
		myChart.on('click', function(param) {
			var name = param.data.name;
			var type = param.dataType;
			console.log(name); 
			console.log(type);	 	    
			
		});

	}
