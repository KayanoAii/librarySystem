package com.LibrarySystem.model;

import java.sql.*;
import java.util.ArrayList;

public class Book {
	//state codes
	public static final int SUCCESS = 0;
	private String ISBN = null;
	private String name = null;
	private String author = null;
	private String publisher = null;
	private String publicationDate = null;
	private String catagory = null;
	private String image = null;
	
	private int inventoryCount = -1;
	private int loanHistoryCount = -1;
	
	
	
//	public Book(String ISBN){
//		this.ISBN = ISBN;
//	}
	

	
	

	public Book(String iSBN, String name, String author, String publisher,
			String publicationDate, String catagory,String image, int inventoryCount, int loanHistoryCount) {
		super();
		ISBN = iSBN;
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.publicationDate = publicationDate;
		this.catagory = catagory;
		this.image = image;
		this.inventoryCount = inventoryCount;
		this.loanHistoryCount = loanHistoryCount;
	}

	
	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}



	//from memory
	public String getISBN() {
		return ISBN;
	}

	//from memory
	public String getName() {
		return name;
	}


	public String getAuthor() {
		return author;
	}


	public String getPublisher() {
		return publisher;
	}


	public String getPublicationDate() {
		return publicationDate;
	}



	public String getCatagory() {
		return catagory;
	}



	public int getInventoryCount() {
		return inventoryCount;
	}



	public int getLoanHistoryCount() {
		
		return loanHistoryCount;
	}



	public static Book getBook(String ISBN) throws Exception{
		
		Connection con = null;
		
//		if(con == null){
//			throw new Exception("Failed to get database connection.");
//		}		
			
		String queryString = "select * from book_info_table where ISBN=?";
		PreparedStatement queryStatement = null;
		ResultSet rs = null;			
		
		try{
			con = DBManager.getConnection();
			queryStatement = con.prepareStatement(queryString);
			queryStatement.setString(1, ISBN);
			
			rs = queryStatement.executeQuery();
			
			if(rs.next()){
				return new Book(rs.getString("ISBN"), 
								rs.getString("name"),
								rs.getString("author"), 
								rs.getString("press"), 
								rs.getString("yearofpublication"), 
								rs.getString("category"), 
								rs.getString("image"),
								rs.getInt("number"), 
								0); //loanCount=0
			}
			else{
				return null;
			}
		}
//		catch(Exception se){//SQLException or SQLTimeoutException
//			se.printStackTrace();
//			throw se;
//			//TODO
//		}
		finally{
			DBManager.closeResultSet(rs);
			DBManager.closeStatement(queryStatement);
			DBManager.closeConnection(con);
		}
		
	}

	
	//add an instance of Book to database
	public int addBook()throws Exception{
		return 0;
	}
	
	
	//delete an instance of Book from database
	public static int deleteBook(String ISBN) throws Exception{
		return 0;
	}

	public static int getLoanHistoryCount(String ISBN) throws Exception{
		
		Connection con = null;
		
//		if(con == null){
//			throw new Exception("Failed to get database connection.");
//		}		
			
		String queryString = "select lendnumber from lend_book_info_table where ISBN=?";
		PreparedStatement queryStatement = null;
		ResultSet rs = null;			
		
		try{
			con = DBManager.getConnection();
			queryStatement = con.prepareStatement(queryString);
			queryStatement.setString(1, ISBN);
			
			rs = queryStatement.executeQuery();
			
			if(rs.next()){
				return rs.getInt(1);
			}
			else{
				//no book found
				return -1;
			}
		}
//		catch(Exception se){//SQLException or SQLTimeoutException
//			se.printStackTrace();
//			throw se;
//			//TODO
//		}
		finally{
			DBManager.closeResultSet(rs);
			DBManager.closeStatement(queryStatement);
			DBManager.closeConnection(con);
		}
		
	}
	
	
	
	//get the chart
	public static ArrayList<Book> getBookChart() throws Exception{
		ArrayList<Book> bookChart = new ArrayList<Book>(10);
		Book book = null;
		
		String queryString = "select * from "
						   + "lend_book_list left outer join book_info_table "
						   + "on book_info_table.ISBN = lend_book_list.ISBN "
						   + "order by lendnumber desc limit 10";
		
		PreparedStatement queryStatement = null;
		ResultSet rs = null;
		
		Connection con = null;
//		Connection con = DBManager.getConnection();
//		
//		if(con == null){
//			throw new Exception("Failed to get database connection.");
//		}
//		
		try{
			con = DBManager.getConnection();
			queryStatement = con.prepareStatement(queryString);
			rs = queryStatement.executeQuery();
			
			while(rs.next()){
				book = new Book(rs.getString("ISBN"), 
								rs.getString("name"), 
								rs.getString("author"), 
								rs.getString("press"), 
								rs.getString("yearofpublication"), 
								rs.getString("category"),
								rs.getString("image"),
								rs.getInt("number"), 
								rs.getInt("lendnumber"));

				bookChart.add(book);
			}
			
					
			
		}
		finally{
			DBManager.closeResultSet(rs);
			DBManager.closeStatement(queryStatement);
			DBManager.closeConnection(con);
		}
		
		
		return bookChart;
	}
	
	
	
}
