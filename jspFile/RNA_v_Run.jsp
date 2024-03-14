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
	UserTaskID=request.getParameter("ID");

	System.out.println(UserTaskID);

 
 
//得到innerpath 对应的id文件的位置
	String innerpath=getServletContext().getRealPath("/innerpath");
	innerpath=innerpath.replaceAll("\\\\","/");
	//filepath
	String filePath=getServletContext().getRealPath("/upload")+"/"+UserTaskID;
	filePath=filePath.replaceAll("\\\\","/");
	
	System.out.println(innerpath);
	System.out.println(filePath);
//run 
System.out.println("start");
response.setContentType("text/html;charset=utf-8");
PrintWriter pw = response.getWriter();

RConnection rc = new RConnection();

//same
rc.assign("ID",UserTaskID);
rc.assign("innerpath",innerpath);
rc.assign("filePath",filePath);

		String Rfunction_path_all = getServletContext().getRealPath("/Rfunction")+"/RNA_v.R";
		Rfunction_path_all=Rfunction_path_all.replaceAll("\\\\","/");

		rc.assign("Rfunction_path_all",Rfunction_path_all);
		rc.eval("source(Rfunction_path_all)");
		
		REXP result = rc.eval("RNA_v(filePath,innerpath)");
	 	System.out.println(result.asString());
	 	
	 	pw.println(result.asString());

	rc.close();
	pw.close();
System.out.println("RNA_V end");
%>


</body>
</html>