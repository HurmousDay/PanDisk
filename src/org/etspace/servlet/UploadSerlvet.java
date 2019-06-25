package org.etspace.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.etspace.abc.jdbc.*;

/**
 * Servlet implementation class UploadSerlvet
 */
@WebServlet("/UploadSerlvet")
public class UploadSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 300MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 4000MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 5000MB
 
    /**
     * 上传数据及保存文件
     */
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	HttpSession session = request.getSession();
    	String curUse = (String)session.getAttribute("curUse");
    	String father = (String)session.getAttribute("father");
    	System.out.println("curUse:"+curUse);
    	if (curUse==null)curUse = "tmp";
    	if (father==null)father = "0";
        // 检测是否为多媒体上传
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 如果不是则停止
            PrintWriter writer = response.getWriter();
            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
            writer.flush();
            return;
        }
 
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        // 中文处理
        upload.setHeaderEncoding("UTF-8"); 

        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String uploadPath = "D:\\" + File.separator + UPLOAD_DIRECTORY;
        
        // 如果大目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        uploadPath += File.separator+curUse;
        // 如果各个用户目录不存在则创建
        uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();                       
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        // 在控制台输出文件的上传路径
                        //System.out.println(filePath);
                        // 保存文件到硬盘
                        item.write(storeFile);
                        request.setAttribute("message",
                            "文件上传成功!");
                                             
                        /*****************************************/
                        //TO-DO 得到ID
                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
                        String updateTime = df.format(new Date());
                        //ID 放在session中
                   
                        System.out.println("username:"+curUse);
                        //判断文件类型
                        String suf = fileName.substring(fileName.lastIndexOf('.')+1);
                        //文件类型
                        System.out.println(suf);
                        //文件大小
                        int size = (int) item.getSize();
                        System.out.println("filesize:"+size);
                        // 在控制台输出文件的上传路径
                        System.out.println(filePath);
                        String Ssize = "";
                        int num = 0;
                        while (size>=1000) {
                        	size /= 1000;
                        	num ++;
                        }
                        Ssize = String.valueOf(size);
                        if (num == 0) {
                        	Ssize += "(B)";
                        }else if (num == 1) {
                        	Ssize += "(KB)";
                        }else if (num == 2) {
                        	Ssize += "(MB)";
                        }
                        
                        FileBean file = new FileBean(fileName,updateTime,Ssize,suf,uploadPath,curUse,father);
                        FileOperation fo = new FileOperation();
                        int flag = fo.Insert(file);
                        if (flag == 1) {
                        	
                        }else if (flag == 0) {
                        	request.setAttribute("message","数据库更新失败");
                        }else {
                        	request.setAttribute("message","数据库使用错误");
                        }
                        /****************************************/
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "错误信息: " + ex.getMessage());
        }
        // 跳转到 message.jsp
        getServletContext().getRequestDispatcher("/home/message.jsp").forward(
                request, response);
    }
}
