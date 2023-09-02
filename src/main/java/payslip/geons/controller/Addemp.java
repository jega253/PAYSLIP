package payslip.geons.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.protocol.Resultset;

import payslip.geons.dto.Ctc;
import payslip.geons.dto.CtcForm;
import payslip.geons.dto.Employee;
import payslip.geons.service.Crud;
import payslip.geons.service.CtcCalculation;
import payslip.geons.service.Dao;
import payslip.geons.service.Payslipgen;

/**
 * Servlet implementation class Addemp
 */
@WebServlet("/addemp")
public class Addemp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//String name="hello"
		boolean errorCheck = false;
		HttpSession httpSession = request.getSession();
		String empid =  request.getParameter("empid");
		
		//check weather empid is exists or not
		if (checkDuplicateEntry("empid", empid)) {
			request.setAttribute("empid", "empid already exists");
			errorCheck = true;
		}
		
		String fullname =  request.getParameter("fullname");
		String email =  request.getParameter("email");
		
		//check weather email  is exists or not
		if (checkDuplicateEntry("email", email)) {
			request.setAttribute("email", "email already exists");
			errorCheck = true;
		}
		String password = (String) request.getParameter("password");

		String doj = (String) request.getParameter("doj");
		String gender = request.getParameter("gender");

		
		
		String aadhar = request.getParameter("aadhar");
		
		//check weather aadhar is exists or not
		if (checkDuplicateEntry("aadhar", aadhar)) {
			request.setAttribute("aadhar", "aadhar already exists");
			errorCheck = true;
		}
		
		boolean role = false;
		if (request.getParameter("role").equals("1")) {
			role = true;
		}
		String designation = (String) request.getParameter("designation");
		String depatrment = request.getParameter("department");
		
		int cLeave = Integer.parseInt(request.getParameter("cLeave"));
		int sLeave = Integer.parseInt(request.getParameter("sLeave"));
		int pLeave = Integer.parseInt(request.getParameter("pLeave"));
		
		int pf=0;
		try {
		 pf = Integer.parseInt(request.getParameter("pf"));
		} catch (NumberFormatException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("addEmp.jsp");
			dispatcher.forward(request, response);
		}
		
		//check weather pf is exists or not
		if (checkDuplicateEntry("pf", pf)) {
			request.setAttribute("pf", "pf number is already exists");
			errorCheck = true;
		}
		
		String uan = request.getParameter("uan");
		
		//check weather uan is exists or not
				if (checkDuplicateEntry("uan", uan)) {
					request.setAttribute("uan", "uan number is already exists");
					errorCheck = true;
				}
				
		String pan = (String) request.getParameter("pan");
		
		//check weather pan is exists or not
				if (checkDuplicateEntry("pan", pan)) {
					request.setAttribute("pan", "pan number is already exists");
					errorCheck = true;
				}
				
		Employee employee = new Employee();
		employee.setEmpid(empid);
		employee.setFullname(fullname);
		employee.setEmail(email);
		employee.setPassword(password);
		employee.setDoj(doj);
		
		employee.setAadhar(Integer.parseInt(aadhar));
		employee.setDesignation(designation);
		employee.setDepartment(depatrment);
		employee.setGenter(gender);
		employee.setPan(pan);
		employee.setcLeave(cLeave);
		employee.setpLeave(pLeave);
		employee.setsLeave(sLeave);
		employee.setPf(pf);
		employee.setUan(uan);
		employee.setRole(role);
		employee.setGenter(gender);

		

		httpSession.setAttribute("addemp", employee);
		Ctc ctc = new Ctc();
		ctc.setCtc(Double.parseDouble(request.getParameter("ctc")));
		
		if (errorCheck) {
			request.setAttribute("checkEmp", employee);
			request.setAttribute("ctc", ctc.getCtc());
			System.out.println("errored");
			sentresponce(request,response,"addEmp.jsp");
		}
		
		CtcCalculation ctcCalculation = new CtcCalculation(ctc.getCtc());

		httpSession.setAttribute("ctc", ctc);
		httpSession.setAttribute("ctccalc", ctcCalculation.ctcCalculation());

		sentresponce(request, response, "ctc.jsp");
		
	}

	private boolean checkDuplicateEntry(String columnName, String value) {
		if(value==null) {
			return true;
		}
		Connection connection = new Dao().getConnection();
		String query = "SELECT COUNT(*) FROM payroll_db.employee WHERE " + columnName + " = ?";

		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, value);
			try (ResultSet resultSet = statement.executeQuery()) {
				resultSet.next();
				int count = resultSet.getInt(1);
				return count > 0;
			}
		} catch (Exception e) {
			System.out.println("Sql error");
			return false;
		}
	}

	private boolean checkDuplicateEntry(String columnName, int value) {
		if(value==0) {
			return true;
		}
		Connection connection = new Dao().getConnection();
		String query = "SELECT COUNT(*) FROM payroll_db.employee WHERE " + columnName + " = ?";
		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setInt(1, value);
			try (ResultSet resultSet = statement.executeQuery()) {
				resultSet.next();
				int count = resultSet.getInt(1);
				return count > 0;
			}
		} catch (Exception e) {
			System.out.println("Sql error");
			return false;
		}
		
		
	}
	private void sentresponce(HttpServletRequest request ,HttpServletResponse response, String path) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
