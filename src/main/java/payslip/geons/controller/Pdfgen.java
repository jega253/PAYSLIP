package payslip.geons.controller;

import java.io.IOException;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import payslip.geons.dto.Payroll;
import payslip.geons.service.CtcCalculation;
import payslip.geons.service.EmployeeModel;

/**
 * Servlet implementation class Pdfgen
 */
@WebServlet("/pdfgen")
public class Pdfgen extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String period = request.getParameter("period");
		double credited = Double.parseDouble(request.getParameter("credited"));
		
		CtcCalculation calculation = new CtcCalculation(credited*12);
		
		CtcForm ctcForm=calculation.ctcCalculation();
		
		HttpSession httpSession = request.getSession(false);
		httpSession.setAttribute("pay", ctcForm);
		String month=monthConverter(period);
		httpSession.setAttribute("month", month);
		RequestDispatcher dispatcher = request.getRequestDispatcher("payslip.jsp");
		dispatcher.forward(request, response);
	}
	public String monthConverter(String month) {
		 String dateString = month;
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        LocalDate date = LocalDate.parse(dateString, formatter);
	        DateTimeFormatter monthFormatter = DateTimeFormatter.ofPattern("MMMM");
	        return date.format(monthFormatter);
	}
}
