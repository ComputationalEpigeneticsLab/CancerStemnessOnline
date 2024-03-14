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
String methods="";
String filetype="";
String geneset="";
String genome="";
String datatype="";
	UserTaskID=request.getParameter("UserTaskID");
	fileNameEXP=request.getParameter("fileNameEXP");
	fileNameSymbol=request.getParameter("fileNameSymbol");
	email_address=request.getParameter("email_address");
	methods=request.getParameter("method");
	filetype=request.getParameter("type");
	geneset=request.getParameter("geneset");
	genome=request.getParameter("genome");
	
	if(filetype.equals("count")){
		datatype="single";
	}else{
		datatype="bulk";
	}
System.out.println(UserTaskID+" "+fileNameEXP+" "+fileNameSymbol+" "+email_address+" "+methods+" "+filetype+" "+genome+" "+geneset);	

//run 
System.out.println("mult start");
//得到innerpath 对应的id文件的位置
	String innerpath=getServletContext().getRealPath("/innerpath");
	innerpath=innerpath.replaceAll("\\\\","/");
	//filepath
	String filePath=getServletContext().getRealPath("/upload")+"/"+UserTaskID;
	filePath=filePath.replaceAll("\\\\","/");
	String Rfunction_path_m = getServletContext().getRealPath("/Rfunction")+"/multiple";
	Rfunction_path_m=Rfunction_path_m.replaceAll("\\\\","/");
response.setContentType("text/html;charset=utf-8");
PrintWriter pw = response.getWriter();

RConnection rc = new RConnection();

//same
rc.assign("UserTaskID",UserTaskID);
rc.assign("externalData_dir",innerpath);
rc.assign("dir_scoreCS",Rfunction_path_m);
rc.assign("fileNameEXP",fileNameEXP);
rc.assign("fileNameSample",fileNameSymbol);
rc.assign("file_in",filePath);
rc.assign("email_address",email_address);
rc.assign("file_out",filePath);
rc.assign("methods",methods);
rc.assign("filetype",filetype);
rc.assign("datatype",datatype);
rc.assign("genome",genome);
rc.assign("all_geneset",geneset);

		String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/all_stemness.R";
		Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");

		rc.assign("Rfunction_path_all",Rfunction_path_all);
		rc.eval("source(Rfunction_path_all)");
		
		REXP result = rc.eval("all_stemness(UserTaskID,externalData_dir,dir_scoreCS,fileNameEXP,fileNameSample,file_in,email_address,file_out,methods,filetype,datatype,genome,all_geneset)");
	 	System.out.println(result.asString());
	 	
	 	pw.println(result.asString());

	rc.close();
	pw.close();
System.out.println("mult end");
%>
</body>
</html>