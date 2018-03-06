package com.LibrarySystem.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.LibrarySystem.model.Bookbean;
import com.LibrarySystem.model.OperateToDB;

public class CategorySearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag=request.getParameter("categoryflag");
		if(flag==null) flag="人文社科";
		ArrayList<Bookbean> list=new ArrayList<Bookbean>();
		String searchItem=flag;
		String field="category";
		list=OperateToDB.getBookbeanList(field,searchItem);
		request.setAttribute("list", list);
		System.out.println("zaigetcategory末尾");
	request.getRequestDispatcher("GetBookChartServlet").forward(request, response);
//	request.getRequestDispatcher("Index_q.jsp").forward(request, response);
	}

}
