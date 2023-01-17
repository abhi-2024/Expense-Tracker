package com.entities;

public class Expenses {
 
	int eid;
	String ename;
	String etype;
	String emmyy; //not req
	int emm;
	int eyy;
	int eprice;
	String euser; //not req
	
	public Expenses() {
		super();
	}

	public Expenses(int eid, String ename, String etype, String emmyy, int emm, int eyy, int eprice, String euser) {
		super();
		this.eid = eid;
		this.ename = ename;
		this.etype = etype;
		this.emmyy = emmyy;
		this.emm = emm;
		this.eyy = eyy;
		this.eprice = eprice;
		this.euser = euser;
	}

	public Expenses(String ename, String etype, String emmyy, int emm, int eyy, int eprice, String euser) {
		super();
		this.ename = ename;
		this.etype = etype;
		this.emmyy = emmyy;
		this.emm = emm;
		this.eyy = eyy;
		this.eprice = eprice;
		this.euser = euser;
	}

	public Expenses(String ename, String etype, int emm, int eyy, int eprice, String euser) {
		super();
		this.ename = ename;
		this.etype = etype;
		this.emm = emm;
		this.eyy = eyy;
		this.eprice = eprice;
		this.euser = euser;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEtype() {
		return etype;
	}

	public void setEtype(String etype) {
		this.etype = etype;
	}

	public String getEmmyy() {
		return emmyy;
	}

	public void setEmmyy(String emmyy) {
		this.emmyy = emmyy;
	}

	public int getEmm() {
		return emm;
	}

	public void setEmm(int emm) {
		this.emm = emm;
	}

	public int getEyy() {
		return eyy;
	}

	public void setEyy(int eyy) {
		this.eyy = eyy;
	}

	public int getEprice() {
		return eprice;
	}

	public void setEprice(int eprice) {
		this.eprice = eprice;
	}

	public String getEuser() {
		return euser;
	}

	public void setEuser(String euser) {
		this.euser = euser;
	}
	
	
}
