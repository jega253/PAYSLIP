package payslip.geons.controller;

import java.awt.Desktop;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import payslip.geons.dto.CtcForm;
import payslip.geons.dto.Employee;
import payslip.geons.service.PdfGenrator;

/**
 * Servlet implementation class Downloadpdf
 */
@WebServlet("/Downloadpdf")
public class Downloadpdf extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		CtcForm ctcForm =(CtcForm) httpSession.getAttribute("pay");
		String month=(String) httpSession.getAttribute("month");
		Employee employee = (Employee) httpSession.getAttribute("name");
		System.out.println(employee+month+ctcForm);
		PdfGenrator genrator = new PdfGenrator();
		
		try {
			genrator.pdfGenertor(employee,month,ctcForm);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {  
		//constructor of file class having file as argument  
		File file = new File("D:\\invoice"+month.toUpperCase()+".pdf");   
		if(!Desktop.isDesktopSupported()){  
		System.out.println("not supported");  
		return;  
		}  
		Desktop desktop = Desktop.getDesktop();  
		if(file.exists())  {
			desktop.open(file);  
			}
		}catch(Exception e)  {  
		e.printStackTrace();  
		}  		
		
	}  
  }
		
		

