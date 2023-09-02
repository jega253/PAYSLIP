package payslip.geons.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import payslip.geons.dto.Employee;
import payslip.geons.service.Crud;
import payslip.geons.service.Payslipgen;

@WebServlet("/Editemp")
public class Editemp extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("empid");
		try {
			Employee employee = new Crud().getEmployeeDetails(id);
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("editemp", employee);
			response.sendRedirect("Editemp.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		Employee editemployee=(Employee)httpSession.getAttribute("editemp");
		

		String fullname = request.getParameter("fullname");
		String email =  request.getParameter("email");

		String password =  request.getParameter("password");

		String doj = (String) request.getParameter("doj");
	//	String esi = request.getParameter("esi");

		String pf = request.getParameter("pf");
		String ptax = request.getParameter("ptax");
//		boolean role= false;
//		if(request.getParameter("role").equals("true")) {
//				role = true;
//		}
		String aadhar = request.getParameter("aadhar");

		String designation =  request.getParameter("designation");
		String depatrment =  request.getParameter("depatrment");
		
		int cLeave = Integer.parseInt(request.getParameter("cLeave"));
		int sLeave = Integer.parseInt(request.getParameter("sLeave"));
		int pLeave = Integer.parseInt(request.getParameter("pLeave"));
		Employee employee = new Employee();
		employee.setEmpid(editemployee.getEmpid());
		employee.setFullname(fullname);
		employee.setEmail(email);
		employee.setPassword(password);
		//employee.setRole(role);
		employee.setDoj(doj);
	//	employee.setEsi(Integer.parseInt(esi));
		employee.setPf(Integer.parseInt(pf));
		employee.setPtax(Integer.parseInt(ptax));
		employee.setHra(editemployee.getHra());
		employee.setAadhar(Integer.parseInt(aadhar));
		
		employee.setDesignation(designation);
		employee.setDepartment(depatrment);
		employee.setGenter(editemployee.getGenter());
		employee.setcLeave(cLeave);
		employee.setpLeave(pLeave);
		employee.setsLeave(sLeave);
		Crud crud = new Crud();
		try {
			if (crud.updateEmpDetails(employee) == 1) {
				httpSession.removeAttribute("listofemployee");
				
				Payslipgen payslipgen = new Payslipgen();
				Employee currentemp=(Employee)httpSession.getAttribute("name");
				List<Employee> employees =payslipgen.allEmployee(currentemp.getEmpid());
				httpSession.setAttribute("listofemployee",employees);
				httpSession.removeAttribute("editemp");
				resp.sendRedirect("Edit.jsp");
			}
			
			resp.sendRedirect("Editemp.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}