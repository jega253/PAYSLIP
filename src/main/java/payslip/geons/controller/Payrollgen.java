package payslip.geons.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import payslip.geons.dto.CtcForm;
import payslip.geons.dto.Employee;
import payslip.geons.service.Crud;
import payslip.geons.service.Payslipgen;

/**
 * Servlet implementation class Payrollgen
 */
@WebServlet("/Payrollgen")
public class Payrollgen extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession(false);
		Employee employee=(Employee)httpSession.getAttribute("employee");
		Employee employee2 = (Employee)httpSession.getAttribute("name");
		Crud crud = new Crud();
		CtcForm ctcForm =(CtcForm) httpSession.getAttribute("ctcForm");
		
		int sal=(int) ctcForm.getTotalGrossSalaryComponentsAMonth();
		try {
			crud.insertpayrollid(employee.getEmpid(), sal);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Payslipgen payslipgen = new Payslipgen();
		
		List<Employee> employees =payslipgen.allEmployee(employee2.getEmpid());
		httpSession.setAttribute("listofemployee",employees);
		response.sendRedirect("Gross.jsp");
	}

}
