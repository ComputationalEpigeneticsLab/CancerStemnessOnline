//UserTaskID=document.getElementById("UserTaskID").value;
//webpath="upload/"+UserTaskID+"/DownStream";
UserTaskID="User";
webpath="example/userSingle/DownStream";
methods_end_re="";
$.ajaxSettings.async = false;
$.getJSON(webpath+"/DownStream_re.txt", "", function(data_re) {
	methods_end_re=data_re;
});

if(methods_end_re.stopMessage=="no"){
	//job over view
	document.getElementById("jobid").innerHTML= methods_end_re.JobID;
	//document.getElementById("method").innerHTML= methods_end_re.method;
	//document.getElementById("datatype").innerHTML= methods_end_re.dataType;
	document.getElementById("expfile").innerHTML= methods_end_re.ExpfileName;
	document.getElementById("samplefile").innerHTML= methods_end_re.clinical;
	document.getElementById("samplenum").innerHTML= methods_end_re.SampleNumCancer+" (tumor)" + " / " + methods_end_re.SampleNumAll+" (all)";
	document.getElementById("genenum").innerHTML= methods_end_re.GeneNumAll;
	document.getElementById("corrthreshold").innerHTML= methods_end_re.corrThreshold;
	
	document.getElementById('download_exp').href ="download_loading.jsp?path=example/GSE115978_TPM_select.txt&name="+UserTaskID+"_Expression_Example.txt";
	document.getElementById('download_sample').href ="download_loading.jsp?path=example/GSE115978_user_sample_infor.txt&name="+UserTaskID+"_Sample_information_Example.txt";

	// steam sig gen table
	if(methods_end_re.stremGene=="success"){
		sigGeneTable(webpath+"/"+methods_end_re.corr_re_table_web);
		//table download
		document.getElementById('signatureContentDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.corr_re_table_download+"&name=stremGeneTable.txt";
		//heatmap
		document.getElementById("stremgeneplot").src = webpath+"/"+methods_end_re.steam_gene_top_heatmap;
		//heatmap download
		document.getElementById('stremgeneplotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.steam_gene_top_heatmap+"&name=stremGene.png";
		//tsne
		document.getElementById("stremgenetsneplot").src = webpath+"/"+methods_end_re.CSgene_score_tsne;
		//tsne download
		document.getElementById('stremgenetsneplotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.CSgene_score_tsne+"&name=stremGene.png";
	
	//enrich
		//hallmarker
		if (methods_end_re.hallmarker_success=="yes"){
			//table
			cancerhallmarkerTable(webpath+"/"+methods_end_re.hallmarker_infor_web);
			//table download
			document.getElementById('CancerhallmarkerTableDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.corr_re_table_download+"&name=stremGeneTable.txt";
			//img
			document.getElementById("hallmarkerCorrPlot").src = webpath+"/"+methods_end_re.hallmarker_heatmap_web;
			document.getElementById('hallmarkerCorrPlotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.hallmarker_heatmap_web+"&name=hallmarker_heatmap.png";
			document.getElementById("hallmarkerSpermanlot").src = webpath+"/"+methods_end_re.hallmarker_corr_web;
			document.getElementById('hallmarkerSpermanlotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.hallmarker_corr_web+"&name=hallmarkerSperman.png";
			
		}else{
			$("#CancerhallmarkerAll").hide()
		}
		//immTable
		if (methods_end_re.imm_success=="yes"){
			//table
			immTable(webpath+"/"+methods_end_re.imm_infor_web);
			
			//table download
			document.getElementById('immTableDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.imm_infor_download+"&name=immResults.txt";
			//img
			document.getElementById("immCorrPlot").src = webpath+"/"+methods_end_re.imm_heatmap_web;
			document.getElementById('immCorrPlotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.imm_heatmap_web+"&name=immune_heatmap.png";
			document.getElementById("immSpermanlot").src = webpath+"/"+methods_end_re.imm_corr_web;
			document.getElementById('immSpermanlotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.imm_corr_web+"&name=CIBERSORT_corr.png";

		}else{
			$("#immAll").hide()
		}
		//cell state
		if (methods_end_re.cellstat_success=="yes"){
			
			//table
			cellsateTable(webpath+"/"+methods_end_re.cellstat_infor_web);
			//table download
			document.getElementById('cellstateTableDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.cellstat_infor_download+"&name=cellstateResults.txt";
			//img
			document.getElementById("cellstateCorrPlot").src = webpath+"/"+methods_end_re.cellstat_heatmap_web;
			document.getElementById('cellstateCorrPlotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.cellstat_heatmap_web+"&name=cellsate_heatmap.png";
			document.getElementById("cellstateSpermanlot").src = webpath+"/"+methods_end_re.cellstat_corr_web;
			document.getElementById('cellstateSpermanlotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.cellstat_corr_web+"&name=cellstate_corr.png";

		}else{
			$("#cellstateAll").hide()
		}
	//cell cell com
		if (methods_end_re.cell_cell_infor=="yes"){
			if(methods_end_re.cell_cell_infor=="yes"){
				//table
				italk_table(webpath+"/"+methods_end_re.celltalker_tablefile_web);
				//table download
				document.getElementById('italkTableDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.celltalker_download_table+"&name=cellcellcomResults.txt";
				//river
				 echars_River_cellcell(webpath+"/"+methods_end_re.celltalker_riverplot_file,"italk_cellcell_river")
				//circos
				echars_circos_cellcell(webpath+"/"+methods_end_re.celltalker_circos_file,methods_end_re.celltalker_circos_color.split(","),"italk_cellcell_circos")
				
			}else{
				
				$("#cell_cell_content").hide()
				document.getElementById("cell_cell_com").innerHTML= "something wrong with this function";
			}
		
		}else{
			$("#cell_cell_com").hide()
		}
		//compare
		method=methods_end_re.method;
		if (methods_end_re.compare_score_error=="no"){
			////
			compare_both(webpath+"/"+methods_end_re.compare_score_web);
			document.getElementById("method_compareTable_left").src = webpath+"/Supervised_StemSC_scatter.png";
			document.getElementById("method_compareTable_right").src = webpath+"/Unsupervised_CytoTRACE_scatter.png";

		}
	}else{
	$("#signatureContent").hide()
	}
}



//base method
function scatterplot_cellstate(gene){
	//alert(gene);
	var gene=gene;
	var state=document.getElementById("cellstateScatter_msg").style.display;
	if (state=="none"){
		document.getElementById("cellstateScatter_msg").style.display="block";
	}
	
	document.getElementById("sctter_cellstate_name").innerHTML= gene;
	document.getElementById("cellstateScatterPlot").src = webpath+"/scatter_hallmarker/"+gene+"_scatter.png";
	document.getElementById('cellstateScatterPlotDownload').href ="download_loading.jsp?path="+ webpath+"/scatter_hallmarker/"+gene+"_scatter.png"+"&name=scatter.png";

}
function closecellstateScatter_msg(){
	document.getElementById("cellstateScatter_msg").style.display="none";
}

function scatterplot_hallmarker(gene){
	var gene=gene;
	var state=document.getElementById("hallmarkerScatter_msg").style.display;
	if (state=="none"){
		document.getElementById("hallmarkerScatter_msg").style.display="block";
	}
	
	document.getElementById("sctter_hallmarker_name").innerHTML= gene;
	document.getElementById("hallmarkerScatterPlot").src = webpath+"/scatter_hallmarker/"+gene+"_scatter.png";
	document.getElementById('hallmarkerScatterPlotDownload').href ="download_loading.jsp?path="+ webpath+"/scatter_hallmarker/"+gene+"_scatter.png"+"&name=scatter.png";

}
function closehallmarkerScatter_msg(){
	document.getElementById("hallmarkerScatter_msg").style.display="none";
}
function scatterplot_imm(gene){
	var gene=gene;
	var state=document.getElementById("immScatter_msg").style.display;
	if (state=="none"){
		document.getElementById("immScatter_msg").style.display="block";
	}
	
	document.getElementById("sctter_imm_name").innerHTML= gene;
	document.getElementById("immScatterPlot").src = webpath+"/scatter_hallmarker/"+gene+"_scatter.png";
	document.getElementById('immScatterPlotDownload').href ="download_loading.jsp?path="+ webpath+"/scatter_hallmarker/"+gene+"_scatter.png"+"&name=scatter.png";

}
function closeimmScatter_msg(){
	document.getElementById("immScatter_msg").style.display="none";
}
function scatterplot(gene){
	var gene=gene;
	var state=document.getElementById("geneScatter_msg").style.display;
	if (state=="none"){
		document.getElementById("geneScatter_msg").style.display="block";
	}
	
	document.getElementById("sctter_gene_name").innerHTML= gene;
	document.getElementById("geneScatterPlot").src = webpath+"/scatter/"+gene+"_scatter.png";
	document.getElementById('geneScatterPlotDownload').href ="download_loading.jsp?path="+ webpath+"/scatter/"+gene+"_scatter.png"+"&name=scatter.png";

}
function closegeneScatter_msg(){
	document.getElementById("geneScatter_msg").style.display="none";
}
function sigGeneTable(path){
	var path=path;
	$(document).ready(function() {
		$('#signatureTable').DataTable( {
		"deferRender": true,//big data
		"bProcessing": true, //显示是否加载 
		"paginationType": "full_numbers",//详细分页组，可以支持直接跳转到某页 
		//'paging': false,
		"aaSorting": [[ 2, "desc" ]],
		'ordering'  :true,
		'ordering'  :false,
		'ajax': path,
		'columns':[
					{'data':'geneName'},
					{'data':'corr'},
					{'data':'p_value'},
					{'data':'FDR'},
					{'data':null,
						"render": function ( data, type, row, meta ) {  
						return "<i class='fa fa-line-chart' aria-hidden='true' style='font-size:20px;cursor: pointer;' onclick="+'"'+"scatterplot("+"'"+row['geneName']+"'"+')"'+"></i>";    
								                    }//data是对应当前cell的值，row是对应当前行中的所有cell的值
					}
					]
		} );  
		} );
}

function cancerhallmarkerTable(path){
	var path=path;
	$(document).ready(function() {
		$('#CancerhallmarkerTable').DataTable( {
		"deferRender": true,//big data
		"bProcessing": true, //显示是否加载 
		"paginationType": "full_numbers",//详细分页组，可以支持直接跳转到某页 
		//'paging': false,
		"serverSide": false,      //后台处理分页则为true  
		"aaSorting": [[ 2, "desc" ]],
		'ordering'  :true,
		'ajax': path,
		//"columnDefs": [ {targets: 1, orderable: false, width: "10%"}, ] ,
		'columns':[
					{'data':'sample'},
					{'data':'fun'},
					{'data':'corr'},
					{'data':'p_value'},
					{'data':'FDR'},
					{'data':null,
						"render": function ( data, type, row, meta ) {  
						return "<i class='fa fa-line-chart' aria-hidden='true' style='font-size:20px;cursor: pointer;' onclick="+'"'+"scatterplot_hallmarker("+"'"+row['sample']+"'"+')"'+"></i>";    
								                    }//data是对应当前cell的值，row是对应当前行中的所有cell的值
					}
					]
		} );  
		} );
	
	$.fn.dataTable.render.ellipsis = function (cutoff) {
		return function (data, type, row) {
		if (type === 'display') {
			var str = data.toString(); // cast numbers
			//var strArr=str.split("_")
			return data.length < cutoff ?
				strArr :
					"<span  title='" + str + "'>" + str.substr(0, cutoff - 1) + '...' +'</span>';
					}
					return data;
					};
					};
}


function immTable(path){
	var path=path;
	$(document).ready(function() {
		$('#immTable').DataTable( {
		"deferRender": true,//big data
		"bProcessing": true, //显示是否加载 
		"paginationType": "full_numbers",//详细分页组，可以支持直接跳转到某页 
		//'paging': false,
		"serverSide": false,      //后台处理分页则为true  
		"aaSorting": [[ 1, "desc" ]],
		'ordering'  :true,
		'ajax': path,
		'columns':[
					{'data':'sample'},
					{'data':'corr'},
					{'data':'p_value'},
					{'data':'FDR'},
					{'data':null,
						"render": function ( data, type, row, meta ) {  
						return "<i class='fa fa-line-chart' aria-hidden='true' style='font-size:20px;cursor: pointer;' onclick="+'"'+"scatterplot_imm("+"'"+row['sample']+"'"+')"'+"></i>";    
								                    }//data是对应当前cell的值，row是对应当前行中的所有cell的值
					}
					]
		} );  
		} );
		
}


function cellsateTable(path){
	var path=path;
	$(document).ready(function() {
		$('#cellstateTable').DataTable( {
		"deferRender": true,//big data
		"bProcessing": true, //显示是否加载 
		"paginationType": "full_numbers",//详细分页组，可以支持直接跳转到某页 
		//'paging': false,
		"serverSide": false,      //后台处理分页则为true  
		"aaSorting": [[ 1, "desc" ]],
		'ordering'  :true,
		'ajax': path,
		'columns':[
					{'data':'sample'},
					{'data':'corr'},
					{'data':'p_value'},
					{'data':'FDR'},
					{'data':null,
						"render": function ( data, type, row, meta ) {  
						return "<i class='fa fa-line-chart' aria-hidden='true' style='font-size:20px;cursor: pointer;' onclick="+'"'+"scatterplot_cellstate("+"'"+row['sample']+"'"+')"'+"></i>";    
								                    }//data是对应当前cell的值，row是对应当前行中的所有cell的值
					}
					]
		} );  
		} );
		
}


/////
function compare_both(path){
	var path=path;
	$(document).ready(function() {
		$('#method_compareTable').DataTable( {
		"deferRender": true,//big data
		"bProcessing": true, //显示是否加载 
		"paginationType": "full_numbers",//详细分页组，可以支持直接跳转到某页 
		//'paging': false,
		"serverSide": false,      //后台处理分页则为true  
		"aaSorting": [[ 1, "desc" ]],
		'ordering'  :true,
		'ajax': path,
		//"columnDefs": [ {targets: 1, orderable: false, width: "10%"}, ] ,
		'columns':[
					{'data':'sample'},
					{'data':'user'},
					{'data':'Supervised_StemSC'},
					{'data':'Unsupervised_CytoTRACE'}
					]
		} );  
		} );
	
	$.fn.dataTable.render.ellipsis = function (cutoff) {
		return function (data, type, row) {
		if (type === 'display') {
			var str = data.toString(); // cast numbers
			//var strArr=str.split("_")
			return data.length < cutoff ?
				strArr :
					"<span  title='" + str + "'>" + str.substr(0, cutoff - 1) + '...' +'</span>';
					}
					return data;
					};
					};
}





function italk_table(path){
	var path=path;
	$(document).ready(function() {
		$('#italkTable').DataTable( {
		"deferRender": true,//big data
		"bProcessing": true, //显示是否加载 
		"paginationType": "full_numbers",//详细分页组，可以支持直接跳转到某页 
		//'paging': false,
		"serverSide": false,      //后台处理分页则为true  
		"aaSorting": [[ 5, "desc" ]],
		'ordering'  :true,
		'ajax': path,
		//"columnDefs": [ {targets: 1, orderable: false, width: "10%"}, ] ,
		'columns':[
{'data':'cell_from'},
{'data':'ligand'},
{'data':'cell_to'},
{'data':'receptor'},
{'data':'Function'},
{'data':'score'}
					]
		} );  
		} );

}


function echars_River_cellcell(filepath,div){
	//获取父div的高度和宽；在display：none时得重新给且必须在表格加载前面
	var height=$("#"+div+"_father").height();
	$("#"+div).css("height",'750px');
	var width=$("#"+div+"_father").width();
	$("#"+div).css("width",width*0.98);
	var riverFilePath=filepath;
	//var chartDomPlotEcharsRiver = document.getElementById(div);
	//var myChartPlotEcharsRiver = echarts.init(chartDomPlotEcharsRiver);
	var myChartPlotEcharsRiver =echarts.init(document.getElementById(div), null, {renderer: 'svg'});	
	var optionPlotEcharsRiver;

	myChartPlotEcharsRiver.showLoading();
	$.get(riverFilePath, function (data) {
	    myChartPlotEcharsRiver.hideLoading();
	    myChartPlotEcharsRiver.setOption(optionPlotEcharsRiver = {
	    		toolbox: {
			          show: true,
			          left:"right",
			          feature: {			        	  
			              mark: {show: true},
			              //dataView: {show: true, readOnly: false},
			              //restore: {show: true},
			              saveAsImage: {show: true,
			            	  name:"Riverplot", 
			            	  title:"Save"}
			          }
			      },
	        title: {
	        	text: 'Details of cell-cell communication by ligand-receptor pairs',
		        left:'center'
	        },
//	        grid:{top:'10%'},
	        tooltip: {
	            trigger: 'item',
	            triggerOn: 'mousemove'
	            
	        },
	        series: [
	                 {
	                   type: 'sankey',
	                   //layoutIterations: 0 ,
	                   nodeAlign: 'left',
	                   data: data.nodes,
	                   links: data.links,
	                   emphasis: {
	                     focus: 'adjacency'
	                   },
	                   lineStyle: {
	                     color: 'gradient',
	                     curveness: 0.5
	                   },
	                   levels: [{
	                	    depth: 0,
	                	    itemStyle: {
	                	        color: '#fbb4ae'
	                	    },
	                	    lineStyle: {
	                	        color: 'source',
	                	        opacity: 0.1
	                	    }
	                	}]
	                 }
	               ]
	    });
	});
	optionPlotEcharsRiver && myChartPlotEcharsRiver.setOption(optionPlotEcharsRiver);
}
function echars_circos_cellcell(filepath,colors,div){
	
	var height=$("#"+div+"_father").height();
	$("#"+div).css("height",'750px');
	var width=$("#"+div+"_father").width();
	$("#"+div).css("width",width*0.9);
	var filepath=filepath;
	var colors_all=colors;
	//console.log(width);
	var chartDom_circos = document.getElementById(div);
	var myChart_circos = echarts.init(chartDom_circos);
	//var myChart_circos =echarts.init(document.getElementById('cellInteraction_circos_italk'), null, {renderer: 'svg'});
	
	var option_circos;
	myChart_circos.showLoading();
	$.get(filepath, function (graph) {
		myChart_circos.hideLoading();

	    graph.nodes.forEach(function (node) {
	        node.label = {
	            show: node.symbolSize > 1
	        };
	    });
	    option_circos = {
	    		toolbox: {
			          show: true,
			          left:"right",
			          feature: {
			        	  
			              mark: {show: true},
			              //dataView: {show: true, readOnly: false},
			              //restore: {show: true},
			              saveAsImage: {show: true,
			            	  name:"circos", 
			            	  title:"Save"}
			          }
			      },
	        title: {
	            text: 'The visualization of Cell-Cell communications',
	            //subtext: 'Default layout',
	            top: 'top',
	            left: 'center'
	        },
	        tooltip: {},
//	        legend: [{
//	        	top:"90%",
//	            // selectedMode: 'single',
//	            data: graph.categories.map(function (a) {
//	                return a.name;
//	            })
//	        }],
	        animationDuration: 1500,
	        animationEasingUpdate: 'quinticInOut',
	        color: colors_all,
	        series: [
	            {
	                name: 'Regulation network',
	                type: 'graph',
	                layout: 'circular',
	                data: graph.nodes,
	                links: graph.links,
	                categories: graph.categories,
	                roam: true,
	                label: {
	                    position: 'right',
	                    formatter: '{b}'
	                },
	                lineStyle: {
	                    color: 'source',
	                    curveness: 0.3
	                },
	                
	                emphasis: {
	                    focus: 'adjacency',
	                    lineStyle: {
	                        width: 10
	                    }
	                }
	            }
	        ]
	    };

	    myChart_circos.setOption(option_circos);
	});

	option_circos && myChart_circos.setOption(option_circos);	
	
	
}