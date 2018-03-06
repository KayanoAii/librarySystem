package com.LibrarySystem.model;

import java.sql.*;

public class Tools {
	private static String IP="localhost:3306";
	private static String DATABASE="librarydatabase";
	private static String URL="jdbc:mysql://"+IP+"/"+DATABASE+"?useUnicode=true&characterEncoding=UTF-8";
	private static String USERNAME="root";
	private static String USERPASS="123456";
	
	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(URL,USERNAME,USERPASS);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return con;
	}

	public static void CloseDB(Connection ct,PreparedStatement ps,ResultSet rs) {
		try {
			if(rs!=null){
				rs.close();
				rs=null;
				}
			if(ps!=null){
				ps.close();
				ps=null;
				}
			if(ct!=null){
				ct.close();
				ct=null;
				}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}	
	}
	
	public static void CloseDB(Connection ct,Statement st,ResultSet rs) {
		try {
			if(rs!=null){
				rs.close();
				rs=null;
				}
		    if(st!=null){
		    	st.close();
		    	st=null;
		    }
			if(ct!=null){
				ct.close();
				ct=null;
				}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}	
	}
}
