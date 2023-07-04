package payslip.geons.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

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

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("username");
		String password = request.getParameter("password");
		
	try {
		//it will bring the employee object for the credentials
		Loginmodel loginmodel = new Loginmodel();
		Employee em = loginmodel.getemployeeBycredential(name, password);
		
	
		if (em != null) {

			if (em.isRole()) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("name", em);
				response.sendRedirect("user.jsp");
			} else {
				
				Payslipgen payslipgen = new Payslipgen();
				
				List<Employee> employees =payslipgen.allEmployee(em.getEmpid());
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("name", em);
				httpSession.setAttribute("listofemployee",employees);
				response.sendRedirect("admin.jsp");
			}
		} else {
			
			response.sendRedirect("login.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	}

}
