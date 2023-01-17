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

}
