package payslip.geons.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import payslip.geons.dto.CtcForm;
import payslip.geons.dto.Employee;
import payslip.geons.service.PayslipLop;

/**
 * Servlet implementation class SalaryCalculation
 */
@WebServlet("/salaryCalculation")
public class SalaryCalculation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int monthSAL =Integer.parseInt(request.getParameter("monthSAL"));
		int leave =Integer.parseInt(request.getParameter("leave"));
		HttpSession httpSession = request.getSession();
		Employee employee=(Employee)httpSession.getAttribute("employee");
		
		PayslipLop lop = new PayslipLop();
		CtcForm ctcForm =lop.lopCalculation(leave, monthSAL);
		request.setAttribute("monthSAL", monthSAL);
		httpSession.setAttribute("ctcForm",ctcForm);
		RequestDispatcher dispatcher= request.getRequestDispatcher("monthctc.jsp");
		dispatcher.forward(request, response);
	}


}
