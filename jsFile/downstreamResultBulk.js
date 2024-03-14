UserTaskID=document.getElementById("UserTaskID").value;
webpath="upload/"+UserTaskID+"/DownStream";
//webpath="upload/bulkexample/DownStream";
methods_end_re="";
$.ajaxSettings.async = false;
$.getJSON(webpath+"/DownStream_re.txt", "", function(data_re) {
	methods_end_re=data_re;
});

if(methods_end_re.stopMessage=="no"){
	//job over view
	document.getElementById("jobid").innerHTML= methods_end_re.JobID;
	document.getElementById("method").innerHTML= methods_end_re.method;
	document.getElementById("datatype").innerHTML= methods_end_re.dataType+" RNA-seq";
	document.getElementById("expfile").innerHTML= methods_end_re.ExpfileName;
	document.getElementById("samplefile").innerHTML= methods_end_re.SamplefileName;
	document.getElementById("samplenum").innerHTML= methods_end_re.SampleNumCancer+" (tumor)" + " / " + methods_end_re.SampleNumAll+" (all)";
	document.getElementById("genenum").innerHTML= methods_end_re.GeneNumAll;
	document.getElementById("corrthreshold").innerHTML= methods_end_re.corrThreshold;
	document.getElementById("clinicalfile").innerHTML= methods_end_re.clinical;
	// steam sig gen table
	if(methods_end_re.stremGene=="success"){
		sigGeneTable(webpath+"/"+methods_end_re.corr_re_table_web);
		//table download
		document.getElementById('signatureContentDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.corr_re_table_download+"&name=stremGeneTable.txt";
		//heatmap
		document.getElementById("stremgeneplot").src = webpath+"/"+methods_end_re.steam_gene_top_heatmap;
		//heatmap download
		document.getElementById('stremgeneplotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.steam_gene_top_heatmap+"&name=stremGene.png";
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
		if (methods_end_re.CIBERSORT_success=="yes"){
			//table
			immTable(webpath+"/"+methods_end_re.CIBERSORT_infor_web);
			
			//table download
			document.getElementById('immTableDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.CIBERSORT_infor_download+"&name=CIBERSORT-Results.txt";
			//img
			document.getElementById("immCorrPlot").src = webpath+"/"+methods_end_re.CIBERSORT_heatmap_web;
			document.getElementById('immCorrPlotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.CIBERSORT_heatmap_web+"&name=CIBERSORT_heatmap.png";
			document.getElementById("immSpermanlot").src = webpath+"/"+methods_end_re.CIBERSORT_corr_web;
			document.getElementById('immSpermanlotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.CIBERSORT_corr_web+"&name=CIBERSORT_corr.png";

		}else{
			$("#immAll").hide()
		}
	//survival
		if (methods_end_re.survival_infor=="yes"){
			document.getElementById("logrank_p").innerHTML= methods_end_re.survival_logrank_p;
			document.getElementById("cox_p").innerHTML= methods_end_re.survival_cox_p;
			document.getElementById("cox_beta").innerHTML= methods_end_re.survival_cox_beta_v;
			//img
			document.getElementById("Survivalplot").src = webpath+"/"+methods_end_re.survival_photo;
			document.getElementById('SurvivalplotDownload').href ="download_loading.jsp?path="+ webpath+"/"+methods_end_re.survival_photo+"&name=survival_photo.png";

		}else{
			$("#clinical").hide()
		}
		//compare
		method=methods_end_re.method;
		if (methods_end_re.compare_score_error=="no"){
			document.getElementById("basemethod").innerHTML= method;
			document.getElementById("basemethod1").innerHTML= method;
			document.getElementById("basemethod2").innerHTML= method;
			if(method=="mRNAsi"){
				///
				document.getElementById("mRNAsi_all").style.display="block";
				document.getElementById("both_all").style.display="none";
				document.getElementById("CytoTRACE_all").style.display="none";
				compare_mRNAsi(webpath+"/"+methods_end_re.compare_score_web);
				document.getElementById("method_compareTable_mRNAsi_img").src = webpath+"/Unsupervised_GSVA_scatter.png";
				
		}else if (method=="GSVA"){
			///
			document.getElementById("mRNAsi_all").style.display="none";
			document.getElementById("both_all").style.display="none";
			document.getElementById("CytoTRACE_all").style.display="block";
				compare_CytoTRACE(webpath+"/"+methods_end_re.compare_score_web);
				document.getElementById("method_compareTable_CytoTRACE_img").src = webpath+"/Supervised_mRNAsi_scatter.png";
				//
				
		}else{
			////
			compare_both(webpath+"/"+methods_end_re.compare_score_web,method);
			document.getElementById("method_compareTable_left").src = webpath+"/Supervised_mRNAsi_scatter.png";
			document.getElementById("method_compareTable_right").src = webpath+"/Unsupervised_GSVA_scatter.png";
		
		}
		}
	}else{
	$("#signatureContent").hide()
	}
}



//base method


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
	document.getElementById("immScatterPlot").src = webpath+"/scatter_imm/"+gene+"_scatter.png";
	document.getElementById('immScatterPlotDownload').href ="download_loading.jsp?path="+ webpath+"/scatter_imm/"+gene+"_scatter.png"+"&name=scatter.png";

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
		"serverSide": false,      //后台处理分页则为true  
		"aaSorting": [[ 1, "desc" ]],
		'ordering'  :true,
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
		'columns':[{'data':'fun'},
					{'data':'sample'},
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


/////
function compare_both(path,method){
	var path=path;
	var method=method;
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
					{'data':method},
					{'data':'Supervised_mRNAsi'},
					{'data':'Unsupervised_GSVA'}
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
function compare_mRNAsi(path){
	var path=path;
	$(document).ready(function() {
		$('#method_compareTable_mRNAsi').DataTable( {
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
					{'data':'mRNAsi'},
					{'data':'Unsupervised_GSVA'}
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

function compare_CytoTRACE(path){
	var path=path;
	$(document).ready(function() {
		$('#method_compareTable_CytoTRACE').DataTable( {
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
					{'data':'GSVA'},
					{'data':'Supervised_mRNAsi'}
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