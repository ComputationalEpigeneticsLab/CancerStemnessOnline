<%@ page import="Util.*" import="java.sql.*" import="java.util.ArrayList"  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*"%>
    <%@ page import="java.util.List" %>
    <%@ page import="java.sql.ResultSet" %>
	<%@ page import="java.sql.ResultSetMetaData" %>
	<%@ page import="org.rosuda.REngine.REXP"%>
	<%@ page import="org.rosuda.REngine.REXPMismatchException"%>
	<%@ page import="org.rosuda.REngine.Rserve.RConnection"%>
	<%@ page import="org.rosuda.REngine.Rserve.RserveException"%>
	<%@ page import="java.io.File"%>
	<%@ page import="java.io.FileWriter"%>
	<%@ page import="java.io.BufferedWriter"%>
	<%@ page import="java.io.FileReader"%>
	<%@ page import="java.io.BufferedReader"%>
	<%@ page import="java.io.IOException"%>
	<%@ page import="javax.servlet.http.HttpServletRequest" %>
	<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Run bulk method here</title>
</head>
<body>
<%
String UserTaskID="";
String fileNameEXP="";
String fileNameSymbol="";
String email_address="";
String method="";
String type="";
String geneset="";
	UserTaskID=request.getParameter("UserTaskID");
	fileNameEXP=request.getParameter("fileNameEXP");
	fileNameSymbol=request.getParameter("fileNameSymbol");
	
	email_address=request.getParameter("email_address");
	method=request.getParameter("method");
	type=request.getParameter("type");
	
// 	System.out.println(method+" "+type);
// 	System.out.println(UserTaskID+" "+fileNameEXP+" "+fileNameSymbol); 
// 	System.out.println("start");
 
 
//得到innerpath 对应的id文件的位置
	String innerpath=getServletContext().getRealPath("/innerpath");
	innerpath=innerpath.replaceAll("\\\\","/");
	//filepath
	String filePath=getServletContext().getRealPath("/upload")+"/"+UserTaskID;
	filePath=filePath.replaceAll("\\\\","/");
	
	
response.setContentType("text/html;charset=utf-8");
PrintWriter pw = response.getWriter();

RConnection rc = new RConnection();
rc.assign("ID_new",UserTaskID);
rc.assign("filePath",filePath);
rc.assign("ExpfileName",fileNameEXP);
rc.assign("SamplefileName",fileNameSymbol);
rc.assign("innerpath",innerpath);
rc.assign("method",method);
rc.assign("type",type);
rc.assign("email_address",email_address);


////////////// mRNAsi /////////////
if (method.equals("mRNAsi")){
	String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/mRNAsiCS.R";
	Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");
	
	rc.assign("Rfunction_path_all",Rfunction_path_all);
	rc.eval("source(Rfunction_path_all)");
 	REXP result = rc.eval("mRNAsiCS(ID_new,filePath,ExpfileName,SamplefileName,innerpath,method,type,email_address)");
 	System.out.println(result.asString());
 	
 	pw.println(result.asString());
 	
	
}else if(method.equals("CytoTRACE")){
//////////////CytoTRACE /////////////	
	String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/CytoTRACECS.R";
	Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");
	
	rc.assign("Rfunction_path_all",Rfunction_path_all);
	rc.eval("source(Rfunction_path_all)");
 	REXP result = rc.eval("CytoTRACECS(ID_new,filePath,ExpfileName,SamplefileName,innerpath,method,type,email_address)");
 	System.out.println(result.asString());
	
 	pw.println(result.asString());
 	
}else if(method.equals("SLICE")){
//////////////SLICE /////////////	
String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/SLICECS.R";
Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");

rc.assign("Rfunction_path_all",Rfunction_path_all);
rc.eval("source(Rfunction_path_all)");
REXP result = rc.eval("SLICECS(ID_new,filePath,ExpfileName,SamplefileName,innerpath,method,type,email_address)");
System.out.println(result.asString());

pw.println(result.asString());

}else if(method.equals("SCENT")){
//////////////SCENT /////////////	
String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/SCENTCS.R";
Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");

rc.assign("Rfunction_path_all",Rfunction_path_all);
rc.eval("source(Rfunction_path_all)");
REXP result = rc.eval("SCENTCS(ID_new,filePath,ExpfileName,SamplefileName,innerpath,method,type,email_address)");
System.out.println(result.asString());

pw.println(result.asString());

}else if(method.equals("StemID")){
//////////////StemID /////////////	
String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/StemIDCS.R";
Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");

rc.assign("Rfunction_path_all",Rfunction_path_all);
rc.eval("source(Rfunction_path_all)");
REXP result = rc.eval("StemIDCS(ID_new,filePath,ExpfileName,SamplefileName,innerpath,method,type,email_address)");
System.out.println(result.asString());

pw.println(result.asString());

}else if(method.equals("StemSC")){
//////////////StemSC /////////////	
String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/StemSCCS.R";
Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");

rc.assign("Rfunction_path_all",Rfunction_path_all);
rc.eval("source(Rfunction_path_all)");
REXP result = rc.eval("StemSCCS(ID_new,filePath,ExpfileName,SamplefileName,innerpath,method,type,email_address)");
System.out.println(result.asString());

pw.println(result.asString());

}else if(method.equals("StemnessIndex")){
//////////////StemnessIndex /////////////	
String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/StemnessIndexCS.R";
Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");

rc.assign("Rfunction_path_all",Rfunction_path_all);
rc.eval("source(Rfunction_path_all)");
REXP result = rc.eval("StemnessIndexCS(ID_new,filePath,ExpfileName,SamplefileName,innerpath,method,type,email_address)");
System.out.println(result.asString());

pw.println(result.asString());

}else if (method.equals("GSVA")){
//////////////GSVA /////////////

	geneset=request.getParameter("geneset");
	System.out.println(geneset);
	if(type.equals("bulk")){
		String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/GSVABulkCS.R";
		Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");
		
		rc.assign("geneset",geneset);
		rc.assign("Rfunction_path_all",Rfunction_path_all);
		rc.eval("source(Rfunction_path_all)");
		REXP result = rc.eval("GSVABulkCS(ID_new,filePath,ExpfileName,SamplefileName,innerpath,geneset,method,type,email_address)");
		System.out.println(result.asString());
	
		pw.println(result.asString());
	}else{
		String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/GSVASingleCS.R";
		Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");
		
		rc.assign("geneset",geneset);
		rc.assign("Rfunction_path_all",Rfunction_path_all);
		rc.eval("source(Rfunction_path_all)");
		REXP result = rc.eval("GSVASingleCS(ID_new,filePath,ExpfileName,SamplefileName,innerpath,geneset,method,type,email_address)");
		System.out.println(result.asString());
	
		pw.println(result.asString());
	}
}

rc.close();
pw.close();

System.out.println("end");
%>


</body>
</html>