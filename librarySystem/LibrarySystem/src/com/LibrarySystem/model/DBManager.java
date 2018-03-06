package com.LibrarySystem.model;

import java.sql.*;



public class DBManager {
	private static final String dbUrl = "jdbc:mysql://localhost:3306/librarydatabase";
	private static final String dbUser = "root";
	private static final String dbPassword = "123456";
	
	
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
	
		Connection con = null;
	
		Class.forName("com.mysql.jdbc.Driver");
	
		con =  DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		
		return con; 
	}
	
	
	public static void closeConnection(Connection con){
		try{
			if(con != null){
				con.close();
			}
		}
		catch(SQLException se){
			se.printStackTrace();
			//TODO: log
		}
	}
	
	public static void closeResultSet(ResultSet rs){
		try{
			if(rs != null){
				rs.close();
			}
			
		}
		catch(SQLException se){
			se.printStackTrace();
			//TODO: log
		}
	}
	
	public static void closeStatement(Statement statement){
		try{
			if(statement != null){
				statement.close();
			}
		}
		catch(SQLException se){
			se.printStackTrace();
			//TODO: log
		}
	}
	
}
