package payslip.geons.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import payslip.geons.dto.Ctc;
import payslip.geons.dto.Employee;
import payslip.geons.service.Crud;

/**
 * Servlet implementation class Monthctc
 */
@WebServlet("/monthctc")
public class Monthctc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empid=request.getParameter("empid");
		Employee employee=null;
		Ctc ctc=null;
		try {
			employee=new Crud().getEmployeeDetails(empid);
			 ctc =new Crud().getempctc(empid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession httpSession = request.getSession(false);
		httpSession.setAttribute("employee", employee);
		httpSession.setAttribute("constctc", ctc.getCtc());
		RequestDispatcher dispatcher = request.getRequestDispatcher("monthctc.jsp");
		dispatcher.forward(request, response);
	}



}
