package payslip.geons.service;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import payslip.geons.dto.CtcForm;
import payslip.geons.dto.Employee;
import payslip.geons.dto.Payroll;

public class Crud {
	private  Dao dao = new Dao();
	public  void insertempdetails(Employee employee, CtcForm ctcForm) throws Exception {
	    String query = "INSERT INTO employee (empid, fullname, email, password, role, doj, esi, pf, ptax, hra, aadhar, uan, designation, depatrment, c_Leave, p_Leave, s_Leave, pan) " +
	            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    int esi=(int)ctcForm.getEmployeesContributionToESI();
	   int hra= (int) ctcForm.getHouseRentAllowance();
	   int pf = (int) ctcForm.getEmployeesContributionToPF();
	Connection connection1 =new Dao().getConnection();
	PreparedStatement statement = connection1.prepareStatement(query);
	 statement.setString(1, employee.getEmpid());
	 statement.setString(2, employee.getFullname());
	 statement.setString(3, employee.getEmail());
	 statement.setString(4, employee.getPassword());
	 statement.setBoolean(5, employee.isRole());
	 statement.setString(6, employee.getDoj());
	 statement.setInt(7, esi);
	 statement.setInt(8, pf);
	 statement.setInt(9, employee.getPtax());
	 statement.setInt(10, hra);
	 statement.setLong(11, employee.getAadhar());
	 statement.setString(12, employee.getUan());
	 statement.setString(13, employee.getDesignation());
	 statement.setString(14, employee.getDepartment());
	 statement.setInt(15, employee.getcLeave());
	 statement.setInt(16, employee.getpLeave());
	 statement.setInt(17, employee.getsLeave());
	 statement.setString(18, employee.getPan());

	 statement.executeUpdate();
	 
	}
//	public void insertpayrollid(Employee employee ,Payroll payrollId) throws Exception {
//		Connection conn = dao.getConnection();
//		String query = "INSERT INTO PAYROLL(payrollid,empid,period,nettotal,grosstotal) VALUES (?,?,?,?,?)";
//		PreparedStatement statement = conn.prepareStatement(query);
//		statement.setInt(1, payrollId.getPayrollid());
//		statement.setString(2, employee.getEmpid());
//		statement.setString(3, payrollId.getPeriod());
//		
//		statement.executeUpdate();
//		System.out.println("Payroll has been insterted successfully....");
//		
//	}
	public Employee getEmployeeDetails(String empid) throws Exception {
	    Employee employee = null;
	    Connection conn = dao.getConnection();
	    String query = "SELECT * FROM EMPLOYEE WHERE empid = ?";
	    PreparedStatement statement = conn.prepareStatement(query);
	    statement.setString(1, empid);
	    ResultSet rs = statement.executeQuery();

	    if (rs.next()) {
	        employee = new Employee();
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
	      
	    }

	    return employee;
	}
	public Employee getEmployeebyusernameandpass(String fullname,String pass) throws Exception {
	    Employee employee = null;
	    Connection conn = dao.getConnection();
	    String query = "SELECT * FROM EMPLOYEE WHERE fullname = ? and password=?";
	    PreparedStatement statement = conn.prepareStatement(query);
	    statement.setString(1, fullname);
	    statement.setString(2, pass);
	    ResultSet rs = statement.executeQuery();

	    if (rs.next()) {
	        employee = new Employee();
	        employee.setEmpid(rs.getString(1));
	        employee.setFullname(rs.getString(2));
	        employee.setEmail(rs.getString(3));
	        employee.setPassword(rs.getString(4));
	        employee.setRole(rs.getInt(5) != 0);
	        employee.setDoj(rs.getString(6));
	        employee.setEsi(rs.getInt(7));
	        employee.setPf(rs.getInt(8));
	        employee.setHra(rs.getInt(9));
	        employee.setAadhar(rs.getInt(10));
	        employee.setPan(rs.getString(11));
	    }

	    return employee;
	}

//	public Payroll getPayrollDetails(int payrollid) throws Exception {
//	    Payroll payrollId = null;
//	    Connection conn = dao.getConnection();
//	    String query = "SELECT * FROM PAYROLL WHERE payrollid = ?";
//	    PreparedStatement statement = conn.prepareStatement(query);
//	    statement.setInt(1, payrollid);
//	    ResultSet rs = statement.executeQuery();
//
//	    if (rs.next()) {
//	        payrollId = new Payroll();
//	        payrollId.setPayrollid(rs.getInt(1));
//	        payrollId.setEmpid(rs.getString(2));
//	        payrollId.setPeriod(rs.getString(3));
//	        payrollId.setNettotal(rs.getInt(4));
//	        payrollId.setGrosstotal(rs.getInt(5));
//	    }
//
//	    return payrollId;
//	}

	public int updateEmpDetails(Employee employee) throws Exception {
	    String query = "UPDATE employee SET fullname = ?, email = ?, password = ?, role = ?, doj = ?, esi = ?, pf = ?, ptax = ?, hra = ?, aadhar = ?, uan = ?, designation = ?, depatrment = ?, c_Leave = ?, p_Leave = ?, s_Leave = ?, pan = ? WHERE empid = ?";
	    Connection connection = new Dao().getConnection();
	    PreparedStatement statement = connection.prepareStatement(query);
	    
	    statement.setString(1, employee.getFullname());
	    statement.setString(2, employee.getEmail());
	    statement.setString(3, employee.getPassword());
	    statement.setBoolean(4, employee.isRole());
	    statement.setString(5, employee.getDoj());
	    statement.setInt(6, employee.getEsi());
	    statement.setInt(7, employee.getPf());
	    statement.setInt(8, employee.getPtax());
	    statement.setInt(9, employee.getHra());
	    statement.setLong(10, employee.getAadhar());
	    statement.setString(11, employee.getUan());
	    statement.setString(12, employee.getDesignation());
	    statement.setString(13, employee.getDepartment());
	    statement.setInt(14, employee.getcLeave());
	    statement.setInt(15, employee.getpLeave());
	    statement.setInt(16, employee.getsLeave());
	    statement.setString(17, employee.getPan());
	    statement.setString(18, employee.getEmpid());
	    
	   return statement.executeUpdate();
	}

	public int deleteemp(String id) throws Exception, SQLException {
		 String query = "DELETE FROM payroll_db.employee WHERE (empid = ?)";
		  Connection connection = new Dao().getConnection();
		  
		    PreparedStatement statement = connection.prepareStatement(query);
		    statement.setString(1, id);
		    return statement.executeUpdate();
	}

}