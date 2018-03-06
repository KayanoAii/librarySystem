package com.LibrarySystem.control;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.LibrarySystem.model.PasswordHash;
import com.LibrarySystem.model.Tools;


public class LoginServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String userpass=request.getParameter("userpass");
		
		if(username!=null&userpass!=null){
			String sql="select usrpass from user_info where usrname='"+username+"'";
			Connection ct=Tools.getConnection();
			try{
				PreparedStatement ps=ct.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				if(rs.next()){
					//if(PasswordHash.validatePassword(userpass, rs.getString(1))){		
					if(userpass.equals(rs.getString("usrpass"))){		
						HttpSession session = request.getSession();
						session.setAttribute("username",username);
						request.getRequestDispatcher("CategorySearchServlet").forward(request, response);
					}
					else{
						//���벻�Ϸ�
						request.setAttribute("flag", "passError");
						request.getRequestDispatcher("Login.jsp").forward(request, response);
					}
				}
				else{
					//�û���Ϸ�
					request.setAttribute("flag", "nameError");
					request.getRequestDispatcher("Login.jsp").forward(request, response);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	

}
