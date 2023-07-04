package payslip.geons.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import payslip.geons.dto.Ctc;
import payslip.geons.dto.CtcForm;
import payslip.geons.dto.Employee;
import payslip.geons.service.Crud;
import payslip.geons.service.CtcCalculation;
import payslip.geons.service.Payslipgen;

/**
 * Servlet implementation class Addemp
 */
@WebServlet("/addemp")
public class Addemp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		String empid = (String) request.getParameter("empid");
		
		String fullname = (String) request.getParameter("fullname");
		String email = (String) request.getParameter("email");
		
		String password = (String) request.getParameter("password");

		String doj = (String) request.getParameter("doj");
		

		String pf = request.getParameter("pf");
		String ptax = request.getParameter("ptax");
	
		String aadhar = request.getParameter("aadhar");

		String designation = (String) request.getParameter("designation");
		String depatrment = (String) request.getParameter("depatrment");

		String pan = (String) request.getParameter("pan");
		Employee employee = new Employee();
		employee.setEmpid(empid);
		employee.setFullname(fullname);
		employee.setEmail(email);
		employee.setPassword(password);
		employee.setRole(false);
		employee.setDoj(doj);
		
		employee.setPtax(Integer.parseInt(ptax));
		
		employee.setAadhar(Integer.parseInt(aadhar));

		employee.setDesignation(designation);
		employee.setDepartment(depatrment);

		employee.setPan(pan);
		httpSession.setAttribute("addemp", employee);
		Ctc ctc = new Ctc();
		ctc.setCtc(Double.parseDouble(request.getParameter("ctc")));
		
		CtcCalculation ctcCalculation = new CtcCalculation(ctc.getCtc());
		
		httpSession.setAttribute("ctc", ctc);
		httpSession.setAttribute("ctccalc", ctcCalculation.ctcCalculation());
		
		System.out.println(ctcCalculation.ctcCalculation());
		

		
		response.sendRedirect("ctc.jsp");
	}

}
