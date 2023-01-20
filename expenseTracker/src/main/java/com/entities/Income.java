package com.entities;

public class Income {
 
	int id;
	String ifrom;
	String itype;
	int mm;
	int yy;
	int iprice;
	String user;
	
	public Income() {
		super();
	}

	public Income(int id, String ifrom, String itype, int mm, int yy, int iprice, String user) {
		super();
		this.id = id;
		this.ifrom = ifrom;
		this.itype = itype;
		this.mm = mm;
		this.yy = yy;
		this.iprice = iprice;
		this.user = user;
	}

	public Income(String ifrom, String itype, int mm, int yy, int iprice, String user) {
		super();
		this.ifrom = ifrom;
		this.itype = itype;
		this.mm = mm;
		this.yy = yy;
		this.iprice = iprice;
		this.user = user;
	}

	public Income(int id, String ifrom, String itype, int mm, int yy, int iprice) {
		super();
		this.id = id;
		this.ifrom = ifrom;
		this.itype = itype;
		this.mm = mm;
		this.yy = yy;
		this.iprice = iprice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIfrom() {
		return ifrom;
	}

	public void setIfrom(String ifrom) {
		this.ifrom = ifrom;
	}

	public String getItype() {
		return itype;
	}

	public void setItype(String itype) {
		this.itype = itype;
	}

	public int getMm() {
		return mm;
	}

	public void setMm(int mm) {
		this.mm = mm;
	}

	public int getYy() {
		return yy;
	}

	public void setYy(int yy) {
		this.yy = yy;
	}

	public int getIprice() {
		return iprice;
	}

	public void setIprice(int iprice) {
		this.iprice = iprice;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}
	
	
	
}
