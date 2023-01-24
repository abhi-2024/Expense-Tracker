package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entities.Expenses;

public class ExpensesDao {
	private Connection con;

	public ExpensesDao(Connection con) {
		this.con = con;
		// TODO Auto-generated constructor stub
	}
	
	public boolean saveExpense(Expenses ex) {
		boolean f = false;
		
		try {
			
			String s = "insert into expenses(expensesName, expensesType, expensesMM, expensesYY, expensesCost, expensesEmail) values(?,?,?,?,?,?)";
			
			PreparedStatement stmt = con.prepareStatement(s);
			
			stmt.setString(1, ex.getEname());
			stmt.setString(2, ex.getEtype());
			stmt.setInt(3, ex.getEmm());
			stmt.setInt(4, ex.getEyy());
			stmt.setInt(5, ex.getEprice());
			stmt.setString(6, ex.getEuser());
			
			stmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return f;
	}
	
	public ArrayList<Expenses> fetchExpenses(String email){
		ArrayList<Expenses> list = new ArrayList<Expenses>();
		try {
			String s = "select * from expenses where expensesEmail=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, email);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				Expenses ex = new Expenses();
				ex.setEname(set.getString("expensesName"));
				ex.setEtype(set.getString("expensesType"));
				ex.setEmm(set.getInt("expensesMM"));
				ex.setEyy(set.getInt("expensesYY"));
				ex.setEprice(set.getInt("expensesCost"));
				ex.setEid(set.getInt("idexpenses"));
				
				list.add(ex);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	public ArrayList<Expenses> fetchExpensesUMonth(int mnth, int yr, String email){
		ArrayList<Expenses> list = new ArrayList<Expenses>();
		try {
			String s = "select * from expenses where expensesMM=? and expensesYY=? and expensesEmail=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setInt(1, mnth);
			stmt.setInt(2, yr);
			stmt.setString(3, email);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				Expenses ex = new Expenses();
				ex.setEname(set.getString("expensesName"));
				ex.setEtype(set.getString("expensesType"));
				ex.setEmm(set.getInt("expensesMM"));
				ex.setEyy(set.getInt("expensesYY"));
				ex.setEprice(set.getInt("expensesCost"));
				ex.setEid(set.getInt("idexpenses"));
				
				list.add(ex);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	public Expenses fetchExpense(int id) {
		Expenses exp = null;
		try {
			String s = "select * from expenses where idexpenses=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setInt(1, id);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				exp = new Expenses();
				exp.setEid(set.getInt("idexpenses"));
				exp.setEname(set.getString("expensesName"));
				exp.setEtype(set.getString("expensesType"));
				exp.setEmm(set.getInt("expensesMM"));
				exp.setEyy(set.getInt("expensesYY"));
				exp.setEprice(set.getInt("expensesCost"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return exp;
	}
	
	public boolean updateExpense(int id, Expenses ex) {
		boolean f = false;
		 try {
			String s = "update expenses set expensesName=?, expensesType=?, expensesMM=?, expensesYY=?, expensesCost=? where idexpenses=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, ex.getEname());
			stmt.setString(2, ex.getEtype());
			stmt.setInt(3, ex.getEmm());
			stmt.setInt(4, ex.getEyy());
			stmt.setInt(5, ex.getEprice());
			stmt.setInt(6, id);
			stmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
	
	public boolean deleteExpense(int id) {
		boolean f = false;
		
		try {
			String s = "delete from expenses where idexpenses=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return f;
	}

}
