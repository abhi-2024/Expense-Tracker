package com.entities;

public class Sources {
 int id;
 String name;
public Sources(int id, String name) {
	super();
	this.id = id;
	this.name = name;
}
public Sources(String name) {
	super();
	this.name = name;
}
public Sources() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
 
}
