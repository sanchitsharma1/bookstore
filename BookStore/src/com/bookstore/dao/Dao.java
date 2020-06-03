package com.bookstore.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Dao {

	private String url = "jdbc:mysql://localhost:3306/bookstore";
	private String user = "root";
	private String pass = "sanchit";

	private String sqlCheck = "SELECT uname, password FROM user WHERE uname=? AND password=?";

	public Connection getConnect() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, pass);
		return con;
	}

	public boolean check(String username, String password) {

		try {

			Connection con = getConnect();
			PreparedStatement pst = con.prepareStatement(sqlCheck);
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				return true;
			}

		} catch (Exception e) {

		}

		return false;
	}

	public ResultSet getBook() {

		try {

			Connection con = getConnect();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM books");

			return rs;

		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public boolean registerUser(String fname, String lname, String email, String uname, String pass, String address) {

		try {

			Connection con = getConnect();
			Statement st = con.createStatement();

			String sql = "INSERT INTO user VALUES('" + fname + "', '" + lname + "', '" + email + "', '" + uname + "', '"
					+ pass + "', '" + address + "')";
			st.executeUpdate(sql);
			
			return true;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;

	}

}
