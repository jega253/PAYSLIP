package payslip.geons.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import payslip.geons.dto.Employee;
import payslip.geons.dto.Payroll;

public class Payslipgen {
	
	

	 public List<Employee> allEmployee(String id)  {
		 
	        try (Connection connection = new Dao().getConnection()) {
	        	String nextnum=lastnumfind();
	            List<Employee> employees = getEmployees(connection,id);

	            for (Employee employee : employees) {
	            	employee.setNextnumber(nextnum);
	                List<Payroll> payrollEntries = getPayrollEntries(connection, employee.getEmpid());
	                employee.setPayrollist(payrollEntries);
	            }
	            
	            connection.close();
	       
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
		                 employee.setGenter(resultSet.getString(16));
		                 employee.setcLeave(resultSet.getInt(17));
		                 employee.setpLeave(resultSet.getInt(18));
		                 employee.setsLeave(resultSet.getInt(19));
		                
		                 boolean payslipSent= checkMonth(employee, connection);
		                 
					        employee.setPayslipSent(payslipSent);
					        if(employee.getFullname().equals("rathika")) {
			     				System.out.println(employee.isPayslipSent()+"   rathika");
			     			}
	                    employees.add(employee);
	                }
	            }
	        }
	       
	        return employees;
	    }
	    public synchronized  List<Payroll> getPayrollEntries(Connection connection, String employeeId) throws SQLException {
	        List<Payroll> payrollEntries = new ArrayList<>();

	        String query = "SELECT * FROM payroll WHERE empid = ?";

	        try (PreparedStatement statement = connection.prepareStatement(query)) {
	            statement.setString(1, employeeId);

	            try (ResultSet resultSet = statement.executeQuery()) {
	                while (resultSet.next()) {
	                 Payroll payroll= new Payroll();
	                 payroll.setPayrollid(resultSet.getInt(1));
	                 payroll.setEmpid(resultSet.getString(2));
	                 payroll.setPeriod(resultSet.getString(3));
	                
	                 payroll.setPayslipSent(resultSet.getBoolean(4));
	                 payroll.setCredited(resultSet.getDouble(5));
	                 payrollEntries.add(payroll);
	                }
	            }
	        }	

	        return payrollEntries;
	    }
	    
	    private boolean checkMonth(Employee employee, Connection connection) {
			String empid = employee.getEmpid();
			String doj = employee.getDoj();
			
			String query = "SELECT max(period) FROM payroll_db.payroll where empid= ?";
			boolean result = false;
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, empid);
				ResultSet resultSet = preparedStatement.executeQuery();
				Date date = new Date();
				String currentDate = new SimpleDateFormat("yyyy-MM").format(date);
				
				
				
				
				if (resultSet.next()) {
					
					String period = resultSet.getString(1);
					if (period != null) {
						
						
						if (monthConverter(currentDate, period)) {
							changestatus(connection, empid, 1);
							return true;
						} else {
							
							System.out.println("changed");
							changestatus(connection, empid, 0);
							return false;
						}
					}
					
				}  if (monthConverter(currentDate, doj)) {
					
					changestatus(connection, empid, 1);
					return true;
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return result;
		}

	//it will change the status in the employee table
		private void changestatus(Connection connection, String empid, int status) {
			String query = "UPDATE payroll_db.employee SET payslipSent = ? WHERE (empid = ?)";
			try {
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, status);
				preparedStatement.setString(2, empid);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		private Boolean monthConverter(String currentMonth, String payrollMonth) {
			 
			payrollMonth = payrollMonth.substring(0, 7);
			System.out.println(payrollMonth);
			return currentMonth.equals(payrollMonth);

		}
		
		
		public String lastnumfind() {
			Connection conn = new Dao().getConnection();
			PreparedStatement preparedStatement;
			try {
				preparedStatement = conn.prepareStatement("{call getall()}");
				ResultSet resultSet=preparedStatement.executeQuery();
				List<String> list = new ArrayList<>();
				while(resultSet.next()) {
					list.add(resultSet.getString(1));
				}
				int []empids=new int[list.size()];
				for (int i = 0; i < empids.length; i++) {
					String num=list.get(i).substring(3);
					empids[i]=Integer.valueOf(num);	
				}
				Arrays.sort(empids);
				int last=empids[empids.length-1];
				String prefix="gl-";
				String lastid=prefix+String.valueOf(last+1);
				return lastid;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;

			
		}


	
	    
	}


