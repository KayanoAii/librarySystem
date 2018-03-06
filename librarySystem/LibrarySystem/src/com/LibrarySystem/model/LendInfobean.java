package com.LibrarySystem.model;

public class LendInfobean {
//String ISBN;
String ISBN;

String bookname;
String username;
String returntime;
String borrowtime;
public String getISBN() {
	return ISBN;
}
public void setISBN(String iSBN) {
	ISBN = iSBN;
}
public String getBookname() {
	return bookname;
}
public void setBookname(String bookname) {
	this.bookname = bookname;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}

public String getReturnT() {
	return returntime;
}

public void setReturnT(String returnT) {
	this.returntime = returnT;
}
public String getBorrowT() {
	return borrowtime;
}
public void setBorrowT(String borrowT) {
	this.borrowtime = borrowT;
}

}
