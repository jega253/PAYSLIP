package payslip.geons.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import payslip.geons.dto.Employee;
import payslip.geons.dto.Payroll;

public class Payslipgen {
	
	

	 public List<Employee> allEmployee(String id) throws ClassNotFoundException {
		 
	        try (Connection connection = new Dao().getConnection()) {
	            List<Employee> employees = getEmployees(connection,id);

	            for (Employee employee : employees) {
	                List<Payroll> payrollEntries = getPayrollEntries(connection, employee.getEmpid());
	                employee.setPayrollist(payrollEntries);
	            }
	            return employees;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	    private List<Employee> getEmployees(Connection connection ,String id) throws SQLException {
	    	
	        List<Employee> employees = new ArrayList<>();

	        String query = "SELECT * FROM employee where empid != ?";
	        

	        try (PreparedStatement statement = connection.prepareStatement(query)) {
	        	statement.setString(1, id);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                while (resultSet.next()) {
	                 
	                    Employee employee = new Employee();
	                      employee.setEmpid( resultSet.getString(1));
		                   employee.setFullname(resultSet.getString(2));
		                   employee.setEmail(resultSet.getString(3));
		                   employee.setPassword(resultSet.getString(4));
		                   if(resultSet.getInt(5)==0) {
		                	   employee.setRole(false);
		                   }else {
		                	   employee.setRole(true);
		                   }
		                   
		                  employee.setDoj( resultSet.getString(6));
		                   employee.setEsi(resultSet.getInt(7));
		                   employee.setPf(resultSet.getInt(8));
		                   employee.setPtax(resultSet.getInt(9));
		                   employee.setHra(resultSet.getInt(10));
		                   employee.setAadhar(resultSet.getLong(11));
		                   employee.setPan(resultSet.getString(12));
		                   employee.setUan(resultSet.getString(13));
		                   employee.setDesignation(resultSet.getString(14));
		                 employee.setDepartment(resultSet.getString(15));
	                    employees.add(employee);
	                }
	            }
	        }

	        return employees;
	    }
	    private  List<Payroll> getPayrollEntries(Connection connection, String employeeId) throws SQLException {
	        List<Payroll> payrollEntries = new ArrayList<>();

	        String query = "SELECT * FROM payroll WHERE empid = ?";

	        try (PreparedStatement statement = connection.prepareStatement(query)) {
	            statement.setString(1, employeeId);

	            try (ResultSet resultSet = statement.executeQuery()) {
	                while (resultSet.next()) {
	                Payroll payroll= new Payroll();
	                 payroll.setPayrollid(resultSet.getInt(1));
	                 payroll.setPeriod(resultSet.getString(3));
	                 payroll.setCredited(resultSet.getDouble(5));
	                 payrollEntries.add(payroll);
	                }
	            }
	        }

	        return payrollEntries;
	    }
	
	    
	}


