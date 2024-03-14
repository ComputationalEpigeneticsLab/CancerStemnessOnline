//左右联动
function changeMethod(method){
	var methodName=method;
	var methods = ["nodel", "input","biosample"];
	for(var value0 of methods){
		if (value0==method){
				document.getElementById(method).setAttribute("class","leftStyleActivate");
				document.getElementById(value0+"Content").style.display="block";
			}else{
				document.getElementById(value0).setAttribute("class","leftStyle");
				document.getElementById(value0+"Content").style.display="none";
			}
	}
	//alert(methodName);
}

//method 描述的选中和是否显示
function SelectMethodsDiscription(method){
	var methodName=method;
	var methodClass=document.getElementById(methodName).getAttribute("class");
	if (methodClass=="fa fa-toggle-on"){
		document.getElementById(methodName).setAttribute("class","fa fa-toggle-off");
		document.getElementById(methodName+"Content").style.display="none";
	}else{
		document.getElementById(methodName).setAttribute("class","fa fa-toggle-on");
		document.getElementById(methodName+"Content").style.display="block";
	}
}


