package com.LibrarySystem.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.LibrarySystem.model.*;

public class PersonBookShowServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = (String)request.getSession().getAttribute("username");
		ArrayList<LendInfobean> list=(ArrayList<LendInfobean> )OperateToDB.getLendInfobean("username",userName,"returntime"," ");
		request.setAttribute("list", list);
		request.getRequestDispatcher("PersonBookShow.jsp").forward(request, response);
		
	}

}
