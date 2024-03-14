methods=["mRNAsi","StemnessIndex","CytoTRACE","SLICE","SCENT","StemID","StemSC","GSVA"];

methods_single=["CytoTRACE","SLICE","SCENT","StemID","GSVA","StemSC"];
methods_bulk=["mRNAsi","StemnessIndex","GSVA"];
methods_supervised=["mRNAsi","StemSC","StemnessIndex"];
methods_unsupervised=["CytoTRACE","SLICE","SCENT","StemID","GSVA"];
selectMethod("single");

//左右联动
function selectMethod(method){
	var methodName=method;
	var types_left = ["single", "bulk","supervised","unsupervised"];
	for(var value0 of types_left){
		if (value0==methodName){
				document.getElementById(methodName+"nodel").setAttribute("class","leftStyleActivate");
				//gsva onchange
				if(eval("methods_"+value0).indexOf("GSVA")!=-1){

					gsvaOnchange_1("open");
				}else{
					gsvaOnchange_1("closed");
				}
				//console.log(eval("methods_"+value0));
				for (var m0 of eval("methods_"+value0)){
					document.getElementById(m0+"Input").setAttribute("class","fa fa-toggle-on");
					$("#"+m0+"Input").css("color","green");
					document.getElementById(m0+"InputMark").value="Select";
				}
				methods_notIn=$(methods).not(eval("methods_"+value0)).toArray();
				for (var m1 of methods_notIn){
					document.getElementById(m1+"Input").setAttribute("class","fa fa-toggle-off");
					$("#"+m1+"Input").css("color","#C4859D");
					document.getElementById(m1+"InputMark").value="nonSelect";
				}
				
			}else{
				document.getElementById(value0+"nodel").setAttribute("class","leftStyle");
				
				
			}
	}
	
}


//method 描述的选中和是否显示
function SelectMethodsDiscription(method){
	var methodName=method;
	var methodClass=document.getElementById(methodName).getAttribute("class");
	if (methodClass=="fa fa-toggle-on"){
		document.getElementById(methodName).setAttribute("class","fa fa-toggle-off");
		$("#"+methodName).css("color","#C4859D");
		document.getElementById(methodName+"Mark").value="nonSelect";
		
	}else{
		document.getElementById(methodName).setAttribute("class","fa fa-toggle-on");
		$("#"+methodName).css("color","green");
		document.getElementById(methodName+"Mark").value="Select";
		
	}
	if(methodName=="GSVAInput"){
		gsvaOnchange(methodClass);
	}
}

function gsvaOnchange(methodClass){
	if (methodClass=="fa fa-toggle-on"){
		document.getElementById("GSVAInputContent").style.display="none";
	}else{
		document.getElementById("GSVAInputContent").style.display="block";
	}
}

function gsvaOnchange_1(state){
	if (state=="open"){
		document.getElementById("GSVAInputContent").style.display="block";
	}else{
		document.getElementById("GSVAInputContent").style.display="none";
	}
}


////////xmselect

var geneset = xmSelect.render({
	el: '#geneset',
	direction: 'down',//向下展开
	name: 'geneset',//表单的name属性
	size: 'big',//选中的之后显示的字的大小
  theme: {color: '#C4859D',},//主题颜色
  tips: 'Please select a stemness marker gene set for you jobs',
  style: {
		marginLeft: '0px',
		borderRadius: '10px',
		height: '35px',
		border: '1px solid #C7C7C7',
		
		
	
	},
	//radio: true,
	clickClose: true,
	data: [
{name: 'Ben_Eed_targets', value: 'Ben_Eed_targets'},
{name: 'Ben_ES_exp1', value: 'Ben_ES_exp1'},
{name: 'Ben_ES_exp2', value: 'Ben_ES_exp2',selected: true},
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




function JobSubmit(){
	var methodSelect="";
	var stemnessGeneSet="none";
	for(var m0 of methods){
		val0=document.getElementById(m0+"InputMark").value;
		if (val0=="Select"){
			methodSelect=methodSelect+","+m0;
		}
		
	}
	methodSelect=methodSelect.substr(1,methodSelect.length-1);
	var methodSelectArr=methodSelect.split(",");
	if(methodSelectArr.indexOf("GSVA")!=-1){
		geneset = xmSelect.get('#geneset', true).getValue('valueStr');
		if (geneset == "" || geneset == null ) {
				alert("Please select a stemness marker  gene set for your job !");
				return false;
			}
			stemnessGeneSet=geneset;
	}
	var param_next="methodSelect="+methodSelect+"&stemnessGeneSet="+stemnessGeneSet;
	//alert(param_next);
	window.location.href="csIdentityMultUpload.jsp?"+param_next;
}




function jobexampleMult(){
	var name =document.getElementById("bulknodel").className;
	
	if(name=="leftStyleActivate"){
		window.location.href="exampleCSidentifyResultMult.jsp?UserTaskID=bulk";
	}else{
		window.location.href="exampleCSidentifyResultMult.jsp?UserTaskID=single";
	}
}
