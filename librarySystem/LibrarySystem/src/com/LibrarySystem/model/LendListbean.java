package com.LibrarySystem.model;

public class LendListbean {
String ISBN;
String bookname;
int lendnumber;
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

public int getLendnumber() {
	return lendnumber;
}
public void setLendnumber(int lendnumber) {
	this.lendnumber = lendnumber;
}

}
