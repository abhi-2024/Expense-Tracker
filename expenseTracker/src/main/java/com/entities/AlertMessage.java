package com.entities;

public class AlertMessage {
 String type;
 String content;
 


public AlertMessage(String type, String content) {
	super();
	this.type = type;
	this.content = content;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}
 
}
