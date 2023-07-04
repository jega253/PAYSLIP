package payslip.geons.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import payslip.geons.dto.Employee;

public class Loginmodel {

	public Employee getemployeeBycredential(String username,String password) throws SQLException, ClassNotFoundException  {
		
			Dao dao = new Dao();
			 Employee employee=null;
			try {
				Connection connection = dao.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("Select * from employee where fullname=? and password=?");
				preparedStatement.setString(1, username);
				preparedStatement.setString(2, password);
				ResultSet rs=preparedStatement.executeQuery();
				 
				  if(rs.next()) {
					  	employee= new Employee();
					    employee.setEmpid(rs.getString(1));
				        employee.setFullname(rs.getString(2));
				        employee.setEmail(rs.getString(3));
				        employee.setPassword(rs.getString(4));
				        employee.setRole(rs.getInt(5) != 0);
				        employee.setDoj(rs.getString(6));
				        employee.setEsi(rs.getInt(7));
				        employee.setPf(rs.getInt(8));
				        employee.setPtax(rs.getInt(9));
				        employee.setHra(rs.getInt(10));
				        employee.setAadhar(rs.getInt(11));
				        employee.setPan(rs.getString(12));
				        employee.setUan(rs.getString(13));
				        employee.setDesignation(rs.getString(14));
				        employee.setDepartment(rs.getString(15));
				        employee.setGenter(rs.getString(16));
				        employee.setcLeave(rs.getInt(17));
				        employee.setsLeave(rs.getInt(18));
				        employee.setpLeave(rs.getInt(19));
				        return employee;
			}
			}catch (Exception e) {
				 e.getStackTrace();
			}
			
			        
			        return employee;
			  
		    
	}
}
