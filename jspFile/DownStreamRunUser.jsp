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
<title>Run downstream method here</title>
</head>
<body>

				
<%
String UserTaskID="";
String threshold="";
String fileEXP="";
String clinicalFileName="";
String datatype="";
String email_address="";
	UserTaskID=request.getParameter("UserTaskID");
	threshold=request.getParameter("userthreshold");
	fileEXP=request.getParameter("fileNameEXP");
	clinicalFileName=request.getParameter("fileNameSymbol");
	datatype=request.getParameter("type");
	email_address=request.getParameter("email_address");
	
	System.out.println(UserTaskID+" "+threshold+" "+clinicalFileName+" "+fileEXP+" "+datatype+" "+email_address);

	//System.out.println("start");
 
 
//得到innerpath 对应的id文件的位置
	String innerpath=getServletContext().getRealPath("/innerpath");
	innerpath=innerpath.replaceAll("\\\\","/");
	//filepath
	String filePath=getServletContext().getRealPath("/upload")+"/"+UserTaskID;
	filePath=filePath.replaceAll("\\\\","/");
	
//run 
	System.out.println("start");
	response.setContentType("text/html;charset=utf-8");
	PrintWriter pw = response.getWriter();

	RConnection rc = new RConnection();

//same
	rc.assign("ID",UserTaskID);
	rc.assign("filePath",filePath);
	rc.assign("ExpfileName",fileEXP);
	rc.assign("clinicalfileName",clinicalFileName);
	rc.assign("email_address",email_address);
	rc.assign("innerpath",innerpath);
	rc.assign("corrThreshold",threshold);
	if(datatype.equals("bulk")){
		//
		String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/DownStreamBulkUser.R";
		Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");
		
		rc.assign("Rfunction_path_all",Rfunction_path_all);
		rc.eval("source(Rfunction_path_all)");
		
		REXP result = rc.eval("DownStreamBulkUser(ID,filePath,ExpfileName,clinicalfileName,innerpath,corrThreshold,email_address)");
	 	System.out.println(result.asString());
	 	
	 	pw.println(result.asString());
	}else{
		String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/DownStreamSingleUser.R";
		Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");
		
		rc.assign("Rfunction_path_all",Rfunction_path_all);
		rc.eval("source(Rfunction_path_all)");
		
		REXP result = rc.eval("DownStreamSingleUser(ID,filePath,ExpfileName,clinicalfileName,innerpath,corrThreshold,email_address)");
	 	System.out.println(result.asString());
	 	
	 	pw.println(result.asString());
	}
	
	rc.close();
	pw.close();
System.out.println("end");
%>


</body>
</html>