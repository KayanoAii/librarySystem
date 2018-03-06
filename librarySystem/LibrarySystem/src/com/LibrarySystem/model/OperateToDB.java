package com.LibrarySystem.model;
import java.sql.*;
import java.util.ArrayList;
public class OperateToDB{
	private static Connection ct;
	private static Statement st;
	private static ResultSet rs;
	private static String userTBName="user_info";
	private static String bookTBName="book_info_table";
	private static String lendInfo="lend_book_table";
	private static String lendList="lend_book_list";
	
	private static int preForQuery1KF(String TBName,String field,String searchItem){
		
		int n=1;
		ct=Tools.getConnection();
		try {
			st=(Statement) ct.createStatement();
			String sql="SELECT * from "+TBName+
					" where "+field+"="+"'"+searchItem+"'";
			rs=st.executeQuery(sql);
		} catch (Exception e) {e.printStackTrace();n=-1;}
		return n;
	}
	private static int preForQuery2KF(String TBName,String field1,String searchItem1,String field2,String searchItem2){
		int n=1;
		ct=Tools.getConnection();
		try {
			st=(Statement) ct.createStatement();
			String sql="SELECT * from "+TBName+
					" where "+field1+" = "+"'"+searchItem1+"' AND "+field2+" = '"+searchItem2+"'";
			rs=st.executeQuery(sql);
		} catch (Exception e) {e.printStackTrace();n=-1;}
		return n;
	}
	
	public static ArrayList<Userbean> getUserbeanList(String field,String searchItem){
		preForQuery1KF(userTBName,field,searchItem);
		ArrayList<Userbean> list=new ArrayList<Userbean>();
		Userbean ub=new Userbean();
		try {
			while(rs.next()){
				ub.setUsrid(rs.getInt("usrid"));
				ub.setUsrname(rs.getString("usrname"));
				ub.setUsrpass(rs.getString("usrpass"));
				ub.setAddress(rs.getString("address"));
				ub.setUsrtell(rs.getString("usrtell"));
				ub.setUsrsex(rs.getString("usrsex"));
				ub.setImage(rs.getString("image"));
				ub.setVocation(rs.getString("vocation"));
				ub.setAddress(rs.getString("address"));
				list.add(ub);
			}
		} catch (Exception e) {e.printStackTrace();}
		Tools.CloseDB(ct, st, rs);	
		return list;
	}
	public static ArrayList<Bookbean> getBookbeanList(String field,String searchItem){
		preForQuery1KF(bookTBName,field,searchItem);
		ArrayList<Bookbean> list=new ArrayList<Bookbean>();
		
		try {
			while(rs.next()){
				Bookbean e=new Bookbean();
				e.setISBN(rs.getString("ISBN"));
				e.setName(rs.getString("name"));
				e.setAuthor(rs.getString("author"));
				e.setPress(rs.getString("press"));
				e.setYearofpublication(rs.getString("yearofpublication"));
				e.setCategory(rs.getString("category"));
				e.setNumber(rs.getInt("number"));
				e.setImage(rs.getString("image"));
				list.add(e);
			}
		} catch (SQLException e1) {e1.printStackTrace();}
		Tools.CloseDB(ct, st, rs);
		return list;
	}
	
	
	public static ArrayList<LendListbean> getLendListbean(String field,String searchItem){
		preForQuery1KF(lendList,field,searchItem);
		ArrayList<LendListbean> list=new ArrayList<LendListbean>();
		
		try {
			while(rs.next()){
				LendListbean e=new LendListbean();
				e.setISBN(rs.getString("ISBN"));
				e.setBookname(rs.getString("bookname"));
				e.setLendnumber(rs.getInt("lendnumber"));
				list.add(e);
			}
		} catch (SQLException e1) {e1.printStackTrace();}
		Tools.CloseDB(ct, st, rs);
		return list;
	}
	public static ArrayList<LendInfobean> getLendInfobean(String field1,String searchItem1,String field2,String searchItem2){
		preForQuery2KF(lendInfo,field1,searchItem1,field2,searchItem2);
		ArrayList<LendInfobean> list=new ArrayList<LendInfobean>();
		
		try {
			while(rs.next()){
				LendInfobean e=new LendInfobean();
				e.setISBN(rs.getString("ISBN"));
				e.setBookname(rs.getString("bookname"));
				e.setUsername(rs.getString("username"));
				e.setBorrowT(rs.getString("borrowtime"));
				e.setReturnT(rs.getString("returntime"));
				list.add(e);
			}
		} catch (SQLException e1) {e1.printStackTrace();}
		Tools.CloseDB(ct, st, rs);
		return list;
	}
	public static int Update1KFTo1F(String TBName,String keyField,String searchItem,String changingField,String newString){
		ct=Tools.getConnection();
		int n = 0;
		try {
			st=(Statement) ct.createStatement();
			String sql="UPDATE "+TBName+" SET "+changingField+"="+"'"+
			newString+"'"+" where "+keyField+"= '"+searchItem+"'";
			n=st.executeUpdate(sql);
		} catch (Exception e) {e.printStackTrace();}
		Tools.CloseDB(ct, st, rs);
		return n;
	}
	public static int Update1KFTo3F(String TBName,String keyField,String searchItem,String updField1,String new1,String updField2,String new2,String updField3,String new3){
		ct=Tools.getConnection();
		int n = 0;
		try {
			st=(Statement) ct.createStatement();
			String sql="UPDATE "+TBName+" SET "+updField1+"= '"+
			new1+"',"+updField2+"= '"+new2+"',"+updField3+"='"+new3+"' where "+keyField+"= '"+searchItem+"'";
			n=st.executeUpdate(sql);
		} catch (Exception e) {e.printStackTrace();}
		Tools.CloseDB(ct, st, rs);
		return n;
	}
	public static int Update2KFTo1F(String TBName,String keyF1,String searchItem1,String keyF2,String searchItem2,String changingField,String newString){
		ct=Tools.getConnection();
		int n = 0;
		try {
			st=(Statement) ct.createStatement();
			String sql="UPDATE "+TBName+"SET "+changingField+"="+"'"+
			newString+"'"+"WHERE"+keyF1+"= '"+searchItem1+"' AND"+keyF2+" = '"+searchItem2+"'";
			n=st.executeUpdate(sql);
		} catch (Exception e) {e.printStackTrace();}
		Tools.CloseDB(ct, st, rs);
		return n;
	}
	public static int Update3KFTo1F(String TBName,String keyF1,String searchItem1,String keyF2,String searchItem2,String keyF3,String searchItem3,String changingField,String newString){
		ct=Tools.getConnection();
		int n = 0;
		try {
			st=(Statement) ct.createStatement();
			String sql="UPDATE "+TBName+" SET "+changingField+" = "+" '"+
			newString+" '"+" WHERE "+keyF1+" = '"+searchItem1+"' AND "+keyF2+" = '"+searchItem2+"' AND "+keyF3+" ='"+searchItem3+"'";
			n=st.executeUpdate(sql);
		} catch (Exception e) {e.printStackTrace();}
		Tools.CloseDB(ct, st, rs);
		return n;
	}
	public static int InsertTBWith5F(String TBName,String parameter1,String parameter2,String parameter3,String parameter4,String parameter5){
		//鍚戞湁4涓煙鐨勮〃鎻掑叆涓�潯璁板綍
		String sql="INSERT INTO "+TBName+" values('"+parameter1+"','"+parameter2+"','"+parameter3+"',' "+parameter4+"','"+parameter5+"')";
		ct=Tools.getConnection();
		int n=0; 
		try {
			st=ct.createStatement();
			n=st.executeUpdate(sql);	
		} catch (Exception e)  {e.printStackTrace();}
		Tools.CloseDB(ct, st, rs);
		return n;
		}
	public static int InsertTBWith3F(String TBName,String parameter1,String parameter2,String parameter3){
		//鍚戞湁4涓煙鐨勮〃鎻掑叆涓�潯璁板綍
		String sql="INSERT INTO "+TBName+" values('"+parameter1+"','"+parameter2+"','"+parameter3+"')";
		ct=Tools.getConnection();
		int n=0; 
		try {
			st=ct.createStatement();
			n=st.executeUpdate(sql);	
		} catch (Exception e)  {e.printStackTrace();}
		Tools.CloseDB(ct, st, rs);
		return n;
		}
	}
/*public static int InsertLendBookInfo(String TBName,String bookname,String userName,String borrowT,String returnT){
String TBName="lend_book_info_table";
String sql="INSERT INTO "+TBName+" values("+bookname+","+userName+","+borrowT+",''";
return 0;}
private static int InsertLendList(String TBName,String ISBN,String uaerName,String borrowT,String returnT){
String tBName="lend_book_list";
String sql="INSERT ";
return 0;
}

	*/
