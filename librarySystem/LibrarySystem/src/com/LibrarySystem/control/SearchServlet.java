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

public class SearchServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Bookbean> list=new ArrayList<Bookbean>();
		String searchItem=request.getParameter("searchItem");
		String field=request.getParameter("field");
		list=OperateToDB.getBookbeanList(field,searchItem);
		request.setAttribute("list", list);
		//request.setAttribute("flag", "searchResult");
		request.getRequestDispatcher("DisplaySearchResult.jsp?flag=searchResult").forward(request, response);
	}

}
