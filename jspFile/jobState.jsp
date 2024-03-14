<%@ page import="Util.*" import="java.sql.*" import="java.util.ArrayList"  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.io.*"%>
    <%@ page import="java.util.*" %>
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
	<%@ page import="java.io.*" import="java.text.DateFormat" import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>

				
<%
String UserTaskID="";
	UserTaskID=request.getParameter("UserTaskID");
	//UserTaskID="1JRKTUYgPw_777@qq.com";	
	//UserTaskID="5JrvctrJfA_878168465@qq.com";	
Hashtable TaskID_value = new Hashtable();
	String file_id_p = getServletContext().getRealPath("/innerpath");
	file_id_p=file_id_p.replaceAll("\\\\","/")+"/Job_ID.txt";
	BufferedReader br = null;
	br = new BufferedReader(new FileReader(file_id_p));
	String text = null;
	while ((text = br.readLine()) != null) {
		String [] arr=text.split("\t");
		TaskID_value.put(arr[0], arr[1]);
			 }
	br.close();
	
response.setContentType("text/html;charset=utf-8");
PrintWriter pw = response.getWriter();	

String jobtype="";
String jobstate="";
if(!TaskID_value.containsKey(UserTaskID)){
	//System.out.println("nokey");
	pw.println("{"+'"'+"error_attention"+'"'+":"+'"'+"No such task id, you can check your task id or submit a task first. "+'"'+"}");
}else{
	//先判断有没有文件
	String re_filr=getServletContext().getRealPath("/upload")+"/"+UserTaskID;
	re_filr=re_filr.replaceAll("\\\\","/");
	File file_re = new File(re_filr); 
	if (!file_re.exists()) {
		pw.println("{"+'"'+"error_attention"+'"'+":"+'"'+"The retention time has exceeded 180 days, please resubmit. "+'"'+"}");
    }else{
    	if (TaskID_value.get(UserTaskID).equals("success")){
    		//updown
    		jobtype="up";
    		jobstate="success";
    	}else if(TaskID_value.get(UserTaskID).equals("run")){
    		jobtype="up";
    		jobstate="run";
    	}else if(TaskID_value.get(UserTaskID).equals("dead")){
    		jobtype="up";
    		jobstate="dead";
    	}else if(TaskID_value.get(UserTaskID).equals("downstreamRun")){
    		jobtype="idbulkdown";
    		jobstate="run";
    	}else if(TaskID_value.get(UserTaskID).equals("downstreamSuccess")){
    		jobtype="idbulkdown";
    		jobstate="success";
    	}else if(TaskID_value.get(UserTaskID).equals("downstreamDead")){
    		jobtype="idbulkdown";
    		jobstate="dead";
    	}else if(TaskID_value.get(UserTaskID).equals("downstreamSingleRun")){
    		jobtype="idsingledown";
    		jobstate="run";
    	}else if(TaskID_value.get(UserTaskID).equals("downstreamSingleSuccess")){
    		jobtype="idsingledown";
    		jobstate="success";
    	}else if(TaskID_value.get(UserTaskID).equals("downstreamSingleDead")){
    		jobtype="idsingledown";
    		jobstate="dead";
    	}else if(TaskID_value.get(UserTaskID).equals("userBulkdownstreamRun")){
    		jobtype="Userbulkdown";
    		jobstate="run";
    	}else if(TaskID_value.get(UserTaskID).equals("userBulkdownstreamSuccess")){
    		jobtype="Userbulkdown";
    		jobstate="success";
    	}else if(TaskID_value.get(UserTaskID).equals("userBulkdownstreamDead")){
    		jobtype="Userbulkdown";
    		jobstate="dead";
    	}else if(TaskID_value.get(UserTaskID).equals("userSingledownstreamRun")){
    		jobtype="Usersingledown";
    		jobstate="run";
    	}else if(TaskID_value.get(UserTaskID).equals("userSingledownstreamSuccess")){
    		jobtype="Usersingledown";
    		jobstate="success";
    	}else if(TaskID_value.get(UserTaskID).equals("userSingledownstreamDead")){
    		jobtype="Usersingledown";
    		jobstate="dead";
    	}else if(TaskID_value.get(UserTaskID).equals("success_mult")){
    		jobtype="multdown";
    		jobstate="success";
    	}else if(TaskID_value.get(UserTaskID).equals("dead_mult")){
    		jobtype="multdown";
    		jobstate="dead";
    	}else if(TaskID_value.get(UserTaskID).equals("run_mult")){
    		jobtype="multdown";
    		jobstate="run";
    	}
    	
    	
    	
    	System.out.println("{"+'"'+"error_attention"+'"'+":"+'"'+"no"+'"'+','+'"'+"jobtype"+'"'+":"+'"'+jobtype+'"'+','+'"'+"jobstate"+'"'+":"+'"'+jobstate+'"'+"}");
    	pw.println("{"+'"'+"error_attention"+'"'+":"+'"'+"no"+'"'+','+'"'+"jobtype"+'"'+":"+'"'+jobtype+'"'+','+'"'+"jobstate"+'"'+":"+'"'+jobstate+'"'+"}");
    	  
    }
	
}
pw.close();
%>


</body>
</html>