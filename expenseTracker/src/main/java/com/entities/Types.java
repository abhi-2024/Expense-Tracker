package com.entities;

public class Types {
  int id;
  String name;
public Types(int id, String name) {
	super();
	this.id = id;
	this.name = name;
}
public Types(String name) {
	super();
	this.name = name;
}
public Types() {
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
