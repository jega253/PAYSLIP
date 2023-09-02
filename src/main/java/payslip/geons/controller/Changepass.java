package payslip.geons.controller;




import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Statement;

@WebServlet("/changepassword")
public class Changepass extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
		
		String emailid=request.getParameter("emailid");
		String currentPassword=request.getParameter("currentpass");
		String password = request.getParameter("newpass");
		System.out.println("hii");
		Connection con=null;
		String pass="";
		String mail ="";
		int a=0;
		String connurl = "jdbc:mysql://localhost:3306/payroll_db";
		try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(connurl,"root", "root");
		java.sql.Statement st=con.createStatement();
	    ResultSet rs=st.executeQuery("select * from employee where email='"+emailid +"' and  password='"+currentPassword+"'");
		while(rs.next()){
			mail=rs.getString(3);
			pass=rs.getString(4);
			}
		System.out.println(mail + " "+pass);
		
		if(mail.equals(emailid ) && pass.equals(currentPassword ) ){
		
			 a=st.executeUpdate("update employee set password='"+password+"' where email='"+mail+"'");
			request.setAttribute("password","Password changed successfully");
			request.setAttribute("username", mail);
			HttpSession httpSession = request.getSession(false);
			httpSession.invalidate();
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		    
		     
		st.close();
		con.close();
		}
		else{			
			request.setAttribute("password","Invalid Current Password");
			request.getRequestDispatcher("createpassword.jsp").forward(request, response);
			System.out.println("Invalid Current Password");
		}
		}
		catch(Exception e){
		System.out.println(e);
		}
	
		}
	

}
