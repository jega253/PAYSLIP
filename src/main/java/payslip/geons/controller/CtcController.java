package payslip.geons.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import payslip.geons.service.CtcSave;
import payslip.geons.service.MailSender;
import payslip.geons.service.Payslipgen;


@WebServlet("/CtcController")
public class CtcController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession(false);
		Employee employee = (Employee) httpSession.getAttribute("addemp");
		//System.out.println(employee);
		CtcForm ctcForm = (CtcForm) httpSession.getAttribute("ctccalc");
		
		
		
		Ctc ctc = (Ctc) httpSession.getAttribute("ctc");

		
		try {
			ctc.setEmpid(employee.getEmpid());
			
		} catch (NullPointerException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("addEmp.jsp");
			dispatcher.forward(request, response);
		}
		
		LocalDate currentDate = LocalDate.now();

		ctc.setPeriod(currentDate.toString());

		CtcSave ctcSave = new CtcSave();
		httpSession.removeAttribute("ctc");
		
		try {
			
			ctcSave.save(ctc);
			
		} catch (SQLException e) 
		{
			
			response.sendRedirect("addEmp.jsp");
		} catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		Crud crud = new Crud();
		try {
			crud.insertempdetails(employee, ctcForm);
			MailSender mailSender = new MailSender();
			mailSender.mailSender(employee.getEmail(), employee.getPassword());
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		
		Employee currentEmployee = (Employee) httpSession.getAttribute("name");
		
//		
//		httpSession.removeAttribute("ctccalc");
//		httpSession.removeAttribute("listofemployee");
		
		Payslipgen payslipgen = new Payslipgen();
		List<Employee> employees = null;
		
		
		employees=payslipgen.allEmployee(currentEmployee.getEmpid());
		httpSession.setAttribute("listofemployee", employees);
		RequestDispatcher dispatcher = request.getRequestDispatcher("addEmp.jsp");
		dispatcher.forward(request, response);
	}
	

}
