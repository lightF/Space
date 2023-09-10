package controller;
import java.sql.*;

public class dbconfig {
	public static Connection dbinfo() throws Exception {
		String db_drive = "com.mysql.cj.jdbc.Driver";
		String db_url = "jdbc:mysql://localhost:3308/web";
		String db_user = "root";
		String db_pass = "1234";
		Class.forName(db_drive);
		Connection con = DriverManager.getConnection(db_url, db_user, db_pass);
		return con;
	}
}