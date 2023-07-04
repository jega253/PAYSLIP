package payslip.geons.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import payslip.geons.dto.Employee;
import payslip.geons.service.Crud;
import payslip.geons.service.Payslipgen;


@WebServlet("/deleteemp")
public class Delete extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		String id = request.getParameter("empid");
		try {
			int result = new Crud().deleteemp(id);
			
			if(result==1) {
				httpSession.removeAttribute("listofemployee");
				Payslipgen payslipgen = new Payslipgen();
				List<Employee> employees=null;
				try {
					Employee currentemp=(Employee)httpSession.getAttribute("name");
					employees = payslipgen.allEmployee(currentemp.getEmpid());
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				httpSession.setAttribute("listofemployee", employees);
				response.sendRedirect("Edit.jsp");
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("Edit.jsp");
		}
		
	}


}
