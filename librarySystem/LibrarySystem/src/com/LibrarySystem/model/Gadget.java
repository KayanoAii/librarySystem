package com.LibrarySystem.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.text.ParseException;


public class Gadget {
	 //变量转码
  	public static String getConvertCode(String code) {
  		String s_code="";
  		try {
  			s_code=new String(code.getBytes("iso-8859-1"),"utf-8");
  			
  		} catch (Exception e) {
  			// TODO: handle exception
  			e.printStackTrace();
  		}
  		
  		return s_code;
  	}

	public static String getTime(){
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=sdf.format(d);
		return date;
	}
	public static String plusDay(int num,String str)throws ParseException{  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	Date date =sdf.parse(str);

	Calendar calendar = Calendar.getInstance();

	calendar.setTime(date);
	calendar.add(Calendar.DATE, num);
	String enddate = sdf.format(calendar.getTime());
         return enddate;
  
}

}
