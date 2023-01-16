package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entities.User;

public class UserDao {

	private Connection con;
	
	public UserDao(Connection con){
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		boolean f = false;
		
		try {
			
			String s = "insert into user(userFName, userLName, userEmail, userPassword, userAddress) values(?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, user.getfName());
			stmt.setString(2, user.getlName());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getPass());
			stmt.setString(5, user.getAdd());
			
			stmt.executeUpdate();
			
			f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return f;
	}
	
	public User loginUser(String email, String pass) {
		User user = null;
		try {
			String s = "select * from user where userEmail=? and userPassword=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, email);
			stmt.setString(2, pass);
			
			ResultSet set = stmt.executeQuery();
			
			while(set.next()) {
				 user = new User();
				 user.setfName(set.getString("userFName"));
				 user.setlName(set.getString("userLName"));
				 user.setEmail(set.getString("userEmail")); 
				 user.setPass(set.getString("userPassword")); 
				 user.setAdd(set.getString("userAddress"));
				 user.setUid(set.getInt("iduser"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return user;
	}
	
	public String fetchPassword(String email) {
		String res = null;
		try {
			
			String s = "select * from user where userEmail=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, email);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				String pass = set.getString("userPassword");
				res=pass;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return res;
	}
	
	public boolean updateUser(User user) {
		boolean f = false;
		try {
			
			String s = "update user set userFName=?, userLName=?, userPassword=?, userAddress=? where userEmail=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, user.getfName());
			stmt.setString(2, user.getlName());
			stmt.setString(3, user.getPass());
			stmt.setString(4, user.getAdd());
			stmt.setString(5, user.getEmail());
			stmt.executeUpdate();
			
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
}
