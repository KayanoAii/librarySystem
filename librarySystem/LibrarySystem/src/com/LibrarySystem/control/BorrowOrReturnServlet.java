package com.LibrarySystem.control;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.LibrarySystem.model.*;

public class BorrowOrReturnServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	String bookTB="book_info_table";
	String lendInfoTB="lend_book_table";
	String lendListTB="lend_book_list";
	
	String userName=(String)request.getSession().getAttribute("username");
	String ISBN=request.getParameter("ISBN");
	//String bookName=request.getParameter("bookname");
	String borrowOrReturn=request.getParameter("borrowOrReturn");
	
	
	
	if(borrowOrReturn.equals("borrow")||borrowOrReturn.equals("借阅")){
		int c1,c2,c3;
	c1=c2=c3=0;
		ArrayList<Bookbean> list=OperateToDB.getBookbeanList("ISBN",ISBN);
		int num=list.get(0).getNumber();
		String bookName=list.get(0).getName();
		if(num>0){
			String nStr1=Integer.toString(num-1);
			c1=OperateToDB.Update1KFTo1F(bookTB,"ISBN",ISBN, "number",nStr1);
			String date=Gadget.getTime();
			c2=OperateToDB.InsertTBWith5F(lendInfoTB,ISBN,bookName,userName, date,"");
			ArrayList<LendListbean> e1=OperateToDB.getLendListbean("ISBN",ISBN);
			if(e1.size()>0){ 
				String nStr3=Integer.toString(e1.get(0).getLendnumber()+1);
				c3=OperateToDB.Update1KFTo1F(lendListTB,"ISBN",ISBN, "lendnumber",nStr3);
			}else 
				c3=OperateToDB.InsertTBWith3F(lendListTB, ISBN, bookName,"1");
			if((c1+c2+c3)>2){
				response.setHeader("Refresh", "1;URL='PersonBookShowServlet");
				request.getRequestDispatcher("PersonBookShowServlet").forward(request, response);
			}else {
				PrintWriter pW=response.getWriter();
				pW.write("<script language='text/javascript'>alert('fail')</script>");
				response.setHeader("Refresh", "1;URL='PersonBookShowServlet");
			}
		}else {
			PrintWriter pW=response.getWriter();
			pW.write("<script language='javascript'>alert('can not borrow')</script>");
			response.setHeader("Refresh", "1;URL='CategorySearchServlet");
		}
		}
	if(borrowOrReturn.equals("return")||borrowOrReturn.equals("还书")){
		int c1,c2,c3;
		c1=c2=c3=0;
		String borrowTime=request.getParameter("borrowtime");
		ArrayList<Bookbean> list1=OperateToDB.getBookbeanList("ISBN",ISBN);
		String nStr1=Integer.toString(list1.get(0).getNumber()+1);
		c1=OperateToDB.Update1KFTo1F(bookTB,"ISBN", ISBN, "number", nStr1);
		String nStr3=Gadget.getTime();
		c3=OperateToDB.Update3KFTo1F(lendInfoTB, "ISBN", ISBN, "username",userName,"borrowtime",borrowTime,"returntime",nStr3);
		c2=1;
	
	if((c1+c2+c3)>2)
		request.getRequestDispatcher("PersonBookShowServlet").forward(request, response);
	else 
		request.getRequestDispatcher("PersonBookShowServlet").forward(request, response);
	}
	}

}
