package payslip.geons.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dao {

	public Connection getConnection()  {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll_db", "root", "root");
		} catch (Exception e) {
			System.out.println("db not connected");
			return null;
		}
	}
}
