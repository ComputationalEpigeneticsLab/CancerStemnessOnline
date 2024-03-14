package FileUpLoad;

import FileUpLoad.OperateUploadFileUtil;
import FileUpLoad.OperateUploadFileDTO;
import java.io.IOException;
import java.io.File;

import java.io.PrintWriter;




import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class FileUploadSaveOnly
 */
public class FileUploadSaveOnly extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadSaveOnly() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String foldName=request.getParameter("foldName");
		//System.out.print(email_address);
		//得到想把文件上传的真实的路径
		String realPath = getServletContext().getRealPath("/upload");
		//System.out.print(realPath);
//传数据并返回文件名和地址								
if (ServletFileUpload.isMultipartContent(request)){
	//调用OperateUploadFileDTO方法得到文件
    OperateUploadFileDTO dto = OperateUploadFileUtil.parseParam(request);

    String fileName = dto.getParamMap().get("fileName");//文件名
    //System.out.print(fileName);
    FileItem item = dto.getFileMap().get("file");//
    //System.out.print(item);

    try {
    	//将文件写出到生成的随机文件              
        item.write(new File(realPath+"/"+foldName+"/"+fileName));
        String re="";
        //生成json格式的文件名和地址 ：注意在js中获取时要注意key和value的对应
        re="{" +'"'+"uploadSyInfor"+'"'+":"+'"'+"success"+'"'+"}";
      //System.out.print(re);
        response.setContentType("text/html;charset=utf-8");
      //获取PrintWriter
        PrintWriter pw = response.getWriter();
      //输出json数据回前端，前台使用js获取
        pw.println(re);
      //清空缓存
        pw.flush();
      //关闭
        pw.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

}

}

}