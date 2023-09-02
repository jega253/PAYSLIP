package payslip.geons.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import payslip.geons.dto.Employee;
import payslip.geons.dto.Payroll;
import payslip.geons.service.Crud;
import payslip.geons.service.Dao;
import payslip.geons.service.Loginmodel;
import payslip.geons.service.Payslipgen;
import payslip.geons.service.Singlton;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Login extends HttpServlet {
	
	private Employee em;
	private Loginmodel loginmodel;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		ServletContext context=config.getServletContext();
		this.loginmodel = (Loginmodel) context.getAttribute("loginmodel") ;
	}
	

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Singlton singlton = Singlton.getSinglton();
		singlton.dummy();
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		
	try {
		//it will bring the employee object for the credentials
		
		 em = loginmodel.getemployeeBycredential(name, password);
		
		if (em != null) {

			if (em.isRole()) {
				HttpSession httpSession = request.getSession();
				httpSession.setMaxInactiveInterval(20*60); 
				Connection connection =new Dao().getConnection();
				 List<Payroll> payList= new Payslipgen().getPayrollEntries(connection , em.getEmpid());
				 em.setPayrollist(payList);
				httpSession.setAttribute("name", em);
				response.sendRedirect("user.jsp"); 
			} else {
				
				Payslipgen payslipgen = new Payslipgen();
				
				List<Employee> employees =payslipgen.allEmployee(em.getEmpid());
				String lastnum=payslipgen.lastnumfind();
				
				
				HttpSession httpSession = request.getSession();
				
				httpSession.setMaxInactiveInterval(100*60);
				httpSession.setAttribute("name", em);
				httpSession.setAttribute("listofemployee",employees);
				RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
				dispatcher.forward(request, response);
			}
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			request.setAttribute("username",name);
			request.setAttribute("password",password);
			request.setAttribute("error", "password or user name incorrect");
			dispatcher.include(request, response);
		}
	} catch (Exception e) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		request.setAttribute("username",name);
		request.setAttribute("password",password);
		request.setAttribute("error", "password or user name incorrect");
		dispatcher.include(request, response);
	}

	}

}
