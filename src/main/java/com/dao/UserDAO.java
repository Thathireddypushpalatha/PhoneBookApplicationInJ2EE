package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dbconnect.DBConnection;
import com.model.User;

public class UserDAO {
	public boolean UserRegister(User u) {
		boolean f = false;
		try {
			Connection con = DBConnection.getConnection();
			String query = "insert into user(name,email,password) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}

	public User loginUser(String e, String p) {
		User user = null;
		try {
			Connection con = DBConnection.getConnection();
			String query = "select * from user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, e);
			ps.setString(2, p);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));

			}
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return user;

	}

}
