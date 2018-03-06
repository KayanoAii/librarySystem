package com.LibrarySystem.control;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.Tool;

import com.LibrarySystem.model.PasswordHash;
import com.LibrarySystem.model.Tools;

public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username=request.getParameter("username");
		String userpass1=request.getParameter("userpass1");
		String userpass2=request.getParameter("userpass2");
		if(userpass1.equals(userpass2)){
			int i=0;
			
			Connection ct;
			ResultSet rs=null;
			Statement st=null;
			
			try {
				ct=Tools.getConnection();
				st=ct.createStatement();
				String sql="select usrname from user_info where usrname='"+username+"'";
				rs=st.executeQuery(sql);
				if(rs.next()){
						request.setAttribute("flag", "nameError");
						request.getRequestDispatcher("Register.jsp").forward(request, response);
				}
				else{
					String sql_1="insert into user_info(usrname,usrpass) values ('"+username+"','"+userpass1+"')";
					i=st.executeUpdate(sql_1);
					if(i==1){
						request.setAttribute("flag", "success");
						request.getRequestDispatcher("Login.jsp").forward(request, response);
					}
					else{
						request.setAttribute("flag", "fail");
						request.getRequestDispatcher("Login.jsp").forward(request, response);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	

}
