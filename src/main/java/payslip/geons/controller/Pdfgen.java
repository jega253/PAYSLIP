package payslip.geons.controller;

import java.io.IOException;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

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
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Employee employee2=(Employee) session.getAttribute("name");
		
		String id=employee2.getEmpid();
		CtcForm ctcForm=null;
		EmployeeModel employeeModel =new EmployeeModel();
		try {
			List<String> list=employeeModel.getlastmonthpayslip(id);
			String ctc=list.get(0);
			String period = list.get(1);
			 String inputDate = period;
			CtcCalculation calculation = new CtcCalculation(Double.parseDouble(ctc));
			 ctcForm =calculation.ctcCalculation();
		        LocalDate date = LocalDate.parse(inputDate);
		        DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("MMMM yyyy");
		        String outputDate = date.format(outputFormat).toUpperCase();
		       
	
		       
		        session.setAttribute("month", outputDate);
		       
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("pay", ctcForm);
		response.sendRedirect("payslip.jsp");
	}

	

}
