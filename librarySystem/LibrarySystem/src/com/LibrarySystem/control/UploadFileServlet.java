package com.LibrarySystem.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.OutputStream;  
import java.util.List;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.FileUploadException;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  
public class UploadFileServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");  
        response.setCharacterEncoding("utf-8"); 
        String image = null;
        //1銆佸垱寤轰竴涓狣iskFileItemFactory宸ュ巶  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //2銆佸垱寤轰竴涓枃浠朵笂浼犺В鏋愬櫒  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        //瑙ｅ喅涓婁紶鏂囦欢鍚嶇殑涓枃涔辩爜  
        upload.setHeaderEncoding("UTF-8");   
        factory.setSizeThreshold(1024 * 500);//璁剧疆鍐呭瓨鐨勪复鐣屽�涓�00K  
        File linshi = new File("D:\\test\\");//褰撹秴杩�00K鐨勬椂鍊欙紝瀛樺埌涓�釜涓存椂鏂囦欢澶逛腑  
        factory.setRepository(linshi);  
        upload.setSizeMax(1024 * 1024 * 5);//璁剧疆涓婁紶鐨勬枃浠舵�鐨勫ぇ灏忎笉鑳借秴杩�M  
        try {  
            // 1. 寰楀埌 FileItem 鐨勯泦鍚�items  
            List<FileItem> /* FileItem */items = upload.parseRequest(request);  
  
            // 2. 閬嶅巻 items:  
            for (FileItem item : items) {  
                // 鑻ユ槸涓�釜涓�埇鐨勮〃鍗曞煙, 鎵撳嵃淇℃伅  
                if (item.isFormField()) {  
                    String name = item.getFieldName();  
                    String value = item.getString("utf-8");  
                    System.out.println(name + ": " + value);
                }  
                // 鑻ユ槸鏂囦欢鍩熷垯鎶婃枃浠朵繚瀛樺埌 e:\\files 鐩綍涓�  
                else {  
                    String fileName = item.getName();  
                    long sizeInBytes = item.getSize();  
                    System.out.println(fileName);  
                    System.out.println(sizeInBytes);  
                    image= fileName;
                    InputStream in = item.getInputStream();  
                    byte[] buffer = new byte[1024];  
                    int len = 0;  
  
                    fileName = "D:\\text\\" + fileName;//鏂囦欢鏈�粓涓婁紶鐨勪綅缃� 
                    System.out.println(fileName);  
                    OutputStream out = new FileOutputStream(fileName);  
  
                    while ((len = in.read(buffer)) != -1) {  
                        out.write(buffer, 0, len);  
                    }  
  
                    out.close();  
                    in.close();  
                }  
            }  
  
        } catch (FileUploadException e) {  
            e.printStackTrace();  
        }  
  request.getRequestDispatcher("PersonInfoUpdateServlet?image="+image+"&flag=changeImage").forward(request, response);
    }  
		
	}


