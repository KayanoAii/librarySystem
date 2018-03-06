package com.LibrarySystem.model;

public class Bookbean {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	String ISBN;
	String name;
	String author;
	
	String press;
	String yearofpublication;
	String category;
	String image;
	int number;
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getYearofpublication() {
		return yearofpublication;
	}
	public void setYearofpublication(String yearofpublication) {
		this.yearofpublication = yearofpublication;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	

}
