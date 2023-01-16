package com.entities;

public class User {
 String fName;
 String lName;
 String email;
 String pass;
 String add;
 int uid;
 
 //Default
public User() {
	super();
}


//Except ID
public User(String fName, String lName, String email, String pass, String add) {
	super();
	this.fName = fName;
	this.lName = lName;
	this.email = email;
	this.pass = pass;
	this.add = add;
}



//All Fields
public User(String fName, String lName, String email, String pass, String add, int uid) {
	super();
	this.fName = fName;
	this.lName = lName;
	this.email = email;
	this.pass = pass;
	this.add = add;
	this.uid = uid;
}



//Getters & Setters -->
public String getfName() {
	return fName;
}


public void setfName(String fName) {
	this.fName = fName;
}


public String getlName() {
	return lName;
}


public void setlName(String lName) {
	this.lName = lName;
}


public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public String getPass() {
	return pass;
}


public void setPass(String pass) {
	this.pass = pass;
}


public String getAdd() {
	return add;
}


public void setAdd(String add) {
	this.add = add;
}


public int getUid() {
	return uid;
}


public void setUid(int uid) {
	this.uid = uid;
}






 
 
}
