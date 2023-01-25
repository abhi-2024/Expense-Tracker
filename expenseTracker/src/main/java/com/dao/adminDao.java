package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entities.Admin;
import com.entities.Sources;
import com.entities.Types;
import com.entities.User;

public class adminDao {
	private Connection con;

	public adminDao(Connection con) {
		this.con = con;
		// TODO Auto-generated constructor stub
	}
	
	public Admin adminLogIn(Admin admin) {
		Admin am = null;
		try {
			String s = "select * from admin where adminEmail=? and adminPassword=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, admin.getEmail());
			stmt.setString(2, admin.getPassword());
			ResultSet set =  stmt.executeQuery();
			while(set.next()) {
				int id = set.getInt("idadmin");
				String m = set.getString("adminEmail");
				String p = set.getString("adminPassword");
				am = new Admin(id, m, p);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return am;
	}
	
	public boolean saveTypes(String name) {
		boolean f = false;
		try {
			 String s = "insert into types (typesName) values(?)";
			 PreparedStatement stmt = con.prepareStatement(s);
			 stmt.setString(1, name);
			 stmt.executeUpdate();
			 f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
	
	public ArrayList<Types> fetchTypes(){
		ArrayList<Types> list = new ArrayList<Types>();	
		try {
			String s = "Select * from types";
			PreparedStatement stmt = con.prepareStatement(s);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				Types types = new Types();
				types.setId(set.getInt("idtypes"));
				types.setName(set.getString("typesName"));
				list.add(types);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
  }
	
	public boolean saveSources(String name) {
		boolean f = false;
		try {
			 String s = "insert into sources (sourcesName) values(?)";
			 PreparedStatement stmt = con.prepareStatement(s);
			 stmt.setString(1, name);
			 stmt.executeUpdate();
			 f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
	
	public ArrayList<Sources> fetchSources(){
		ArrayList<Sources> list = new ArrayList<Sources>();	
		try {
			String s = "Select * from sources";
			PreparedStatement stmt = con.prepareStatement(s);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				Sources sources = new Sources();
				sources.setId(set.getInt("idsources"));
				sources.setName(set.getString("sourcesName"));
				list.add(sources);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
  }
	public boolean delSource(int id) {
		boolean f = false;
		 try {
			String s = "delete from sources where idsources=?";
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
	
	public boolean delType(int id) {
		boolean f = false;
		 try {
			String s = "delete from types where idtypes=?";
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
	
	public ArrayList<User> fetchAllUsers(){
		ArrayList<User> list = new ArrayList<User>();
		try {
			String s = "select * from user";
			PreparedStatement stmt = con.prepareStatement(s);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				User user = new User();
				user.setfName(set.getString("userFName"));
				user.setlName(set.getString("userLName"));
				user.setEmail(set.getString("userEmail"));
				user.setUid(set.getInt("iduser"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	
	public boolean delUser(int id) {
		boolean f = false;
		try {
			String s = "delete from user where iduser=?";
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
