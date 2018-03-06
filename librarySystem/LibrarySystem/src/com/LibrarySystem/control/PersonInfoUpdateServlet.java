package com.LibrarySystem.control;
import java.io.*;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.LibrarySystem.model.Gadget;
import com.LibrarySystem.model.OperateToDB;

public class PersonInfoUpdateServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String TBName="user_info";
		String userName=(String) request.getSession().getAttribute("username");
		String flag=request.getParameter("flag");
		System.out.println("PersonInfoUpdateServletflag:"+flag);
		if(flag!=null && flag.equals("changeImage")){
			String image=request.getParameter("image");
			System.out.println("PersonInfoUpdateServlet:image  "+image);
			int n=0;
			n=OperateToDB.Update1KFTo1F(TBName, "usrname", userName, "image", image);
			System.out.println("update "+n);
			if(n!=0) {
				request.getRequestDispatcher("PersonInfoShowServlet").forward(request,response);
			}
			else {
				request.getRequestDispatcher("PersonInfoShowServlet").forward(request,response);
			}
		}
		if(flag!=null&&flag.equals("change3F"))
		{
			String sex=Gadget.getConvertCode(request.getParameter("sex"));
		System.out.println("PersonInfoUpdateServletsex:"+sex);
			String address=Gadget.getConvertCode(request.getParameter("address"));
			String phoneNumber=Gadget.getConvertCode(request.getParameter("phonenumber"));
			int n=0;
			n=OperateToDB.Update1KFTo3F(TBName,"usrname",userName,"usrsex", sex,"address",address,"usrtell",phoneNumber);	
			if(n!=0) {
				
				request.getRequestDispatcher("PersonInfoShowServlet").forward(request,response);
			
			}
				else {
				request.getRequestDispatcher("PersonInfoShowServlet").forward(request,response);
			}}
		
			
	}
}