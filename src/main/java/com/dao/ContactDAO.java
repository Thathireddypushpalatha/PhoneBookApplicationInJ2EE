package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;
import com.model.Contact;

public class ContactDAO {
	public boolean saveContact(Contact c) {
		boolean f = false;

		try {
			Connection con = DBConnection.getConnection();
			String query = "insert into contact(name,email,phone,about,userid) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhone());
			ps.setString(4, c.getAbout());
			ps.setInt(5, c.getUserId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}
	public List<Contact> getAll() {
		List<Contact> list = new ArrayList<Contact>();

		try {
			Connection con = DBConnection.getConnection();
			String query = "select * from contact";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Contact c1 = new Contact();
				c1.setId(rs.getInt(1));
				c1.setName(rs.getString(2));
				c1.setEmail(rs.getString(3));
				c1.setPhone(rs.getString(4));
				c1.setAbout(rs.getString(5));
				list.add(c1);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}


	public List<Contact> getAllContact(int uId) {
		List<Contact> list = new ArrayList<Contact>();

		try {
			Connection con = DBConnection.getConnection();
			String query = "select * from contact where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Contact c1 = new Contact();
				c1.setId(rs.getInt(1));
				c1.setName(rs.getString(2));
				c1.setEmail(rs.getString(3));
				c1.setPhone(rs.getString(4));
				c1.setAbout(rs.getString(5));
				list.add(c1);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public Contact getContactById(int cid) {
		Contact c = new Contact();
		try {
			Connection con = DBConnection.getConnection();
			String query = "select * from Contact where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhone(rs.getString(4));
				c.setAbout(rs.getString(5));

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return c;

	}

	public boolean updateContact(Contact c,int cid) {
		boolean f = false;
		try {
			Connection con = DBConnection.getConnection();
			String query = "update contact set name=?,email=?,phone=?,about=? where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhone());
			ps.setString(4, c.getAbout());
			ps.setInt(5, cid);
			
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return f;

	}

	public boolean deleteContactById(int id) {
		boolean f=false;
		try {
			Connection con = DBConnection.getConnection();
			String query="delete from contact where id=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}

		}catch(Exception e) {
			System.out.println(e);
		}
		return f;
	}

}
