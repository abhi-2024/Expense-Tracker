package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entities.Income;

public class IncomeDao {
	private Connection con;

	public IncomeDao(Connection con) {
		 this.con = con;
		// TODO Auto-generated constructor stub
	}
	
	public boolean saveIncome(Income i) {
		boolean f = false;
		try {
			String s = "insert into income(incomeFrom, incomeType, incomeMM, incomeYY, incomePrice, incomeUser) values(?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, i.getIfrom());
			stmt.setString(2, i.getItype());
			stmt.setInt(3, i.getMm());
			stmt.setInt(4, i.getYy());
			stmt.setInt(5, i.getIprice());
			stmt.setString(6, i.getUser());
			stmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
	
	public ArrayList<Income> fetchIncome(String email){
		ArrayList<Income> list = new ArrayList<Income>();
		try {
			String s = "select * from income where incomeUser=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, email);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				int id = set.getInt("idincome");
				String in = set.getString("incomeFrom");
				String it = set.getString("incomeType");
				int imm = set.getInt("incomeMM");
				int iyy = set.getInt("incomeYY");
				int ip = set.getInt("incomePrice");
				String uemail = set.getString("incomeUser");
				Income inc = new Income(id, in, it, imm, iyy, ip, uemail);
				list.add(inc);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	
	public Income fetchSingleIncome(int id) {
		Income inc = null;
		 try {
			String s = "select * from income where idincome=?";
			PreparedStatement stmt  = con.prepareStatement(s);
			stmt.setInt(1, id);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				inc = new Income();
				inc.setId(set.getInt("idincome"));
				inc.setIfrom(set.getString("incomeFrom"));
				inc.setItype(set.getString("incomeType"));
				inc.setMm(set.getInt("incomeMM"));
				inc.setYy(set.getInt("incomeYY"));
				inc.setIprice(set.getInt("incomePrice"));
				inc.setUser(set.getString("incomeUser"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return inc;
	}
	
	public boolean updateIncome(Income i) {
		boolean f =false;
		try {
			String s = "update income set incomeFrom=?, incomeType=?, incomeMM=?, incomeYY=?, incomePrice=? where idincome=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, i.getIfrom());
			stmt.setString(2, i.getItype());
			stmt.setInt(3, i.getMm());
			stmt.setInt(4, i.getYy());
			stmt.setInt(5, i.getIprice());
			stmt.setInt(6, i.getId());
			stmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
	
	public ArrayList<Income> fetchIncomeUYM(int year, int mnth, String email){
		ArrayList<Income> list = new ArrayList<Income>();
		try {
			String s = "select * from income where incomeMM=? and incomeYY=? and incomeUser=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setInt(1, mnth);
			stmt.setInt(2, year);
			stmt.setString(3, email);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				Income inc = new Income();
				inc.setIfrom(set.getString("incomeFrom"));
				inc.setIprice(set.getInt("incomePrice"));
				list.add(inc);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
}
