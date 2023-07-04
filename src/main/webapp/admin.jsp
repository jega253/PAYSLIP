
<%@page import="java.util.List"%>
<%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
  
<% HttpSession mysession = request.getSession(); %> 
<%
   
    if (mysession == null)  {
        response.sendRedirect("login.jsp"); 
    }
%>

<!doctype html>
<html lang="en">
  <head>
  	<title>Admin Dash</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/style.css">
		
		
                        <!--  ----------import the package------  -->
         
         <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
		
		<style>
		h2{
		     font-size:35px;
		}
		table{
		     font-size:13px;
		}
		</style>
		
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 pt-3 ">
		  		<a href="https://Geonslogix.com" target="_blank"#" class="img logo rounded-circle   mb-3" style="background-image: url(image/logopra.jpg);"></a>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="admin.jsp" data-toggle="collapse" aria-expanded="false">Home</a>
	          </li>
	          <li>
	              <a href="addEmp.jsp">Add Emp</a>
	          </li>
	          <li>
              <a href="Edit.jsp">Edit Emp</a>
	          </li>
	          <li>
              <a href="LogoutServlet">Signout</a>
	          </li>
	        </ul>

	        <div class="footer">
	        	<p>
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> ,Geons Logix.com<i class="icon-heart" aria-hidden="true"></i> by <a href="https://Geonslogix.com" target="_blank">Geonslogix.com</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	        </div>

	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-1">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
              <ul class="nav navbar-nav ml-auto ">
               
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">Signout</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <h2 style="text-align:center;" class="text-primary">
        Welcome
        <%=((Employee) mysession.getAttribute("name")).getFullname()%></h2>
        
       
      <div class="table-responsive small container ">
      
      <table class="table" id="example" style="width:100%">
  <thead class="thead-light">
    <tr>
      <th scope="col">SNO</th>
      <th scope="col">Employee ID</th>
      <th scope="col">Name</th>
      <th scope="col">Designation</th>
      <th scope="col">PayslipSent</th>
    </tr>
  </thead>
  
  <tbody>
    <% List data=(List) mysession.getAttribute("listofemployee");
          for(int i=0;i<data.size();i++)
  {  
   Employee emp= (Employee)data.get(i);
    %>
    
      <tr>
    <td width="119"><%=i+1%></td>
  <td width="119"><%=emp.getEmpid()%></td>
  <td width="168"><%=emp.getFullname()%></td>
  <td width="119"><%=emp.getDesignation()%></td>
  <td>&nbsp;<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="25" height="25" viewBox="0,0,256,256"
style="fill:#000000;">
<g fill="#94d82d" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(5.33333,5.33333)"><path d="M11.5,6c-3.032,0 -5.5,2.468 -5.5,5.5v25c0,3.032 2.468,5.5 5.5,5.5h25c3.032,0 5.5,-2.468 5.5,-5.5v-20.55078l-3,3v17.55078c0,1.379 -1.121,2.5 -2.5,2.5h-25c-1.379,0 -2.5,-1.121 -2.5,-2.5v-25c0,-1.379 1.121,-2.5 2.5,-2.5h25c0.702,0 1.33406,0.29372 1.78906,0.76172l2.12109,-2.12109c-0.998,-1.011 -2.38116,-1.64062 -3.91016,-1.64062zM41.4707,9.98633c-0.38956,0.01135 -0.75941,0.17386 -1.03125,0.45312l-18.93945,18.93945l-3.93945,-3.93945c-0.37623,-0.39185 -0.9349,-0.54969 -1.46055,-0.41265c-0.52565,0.13704 -0.93616,0.54754 -1.07319,1.07319c-0.13704,0.52565 0.0208,1.08432 0.41265,1.46055l5,5c0.58579,0.58555 1.5353,0.58555 2.12109,0l20,-20c0.4429,-0.43135 0.57582,-1.09023 0.33479,-1.65955c-0.24103,-0.56932 -0.80665,-0.93247 -1.42463,-0.91467z"></path></g></g>
</svg></i></td>
  
  </tr>
  <%}%>
    
  </tbody>
</table>
  

      </div>
      
       
		</div>
		

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
                         <!--  ----------import the package------  -->
      <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
      <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
      <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
      <script>
      
      $('#example').DataTable( {
    	  button: [
    	        'copy', 'excel', 'pdf'                             
    	    ],
      } );
      </script>
  </body>
</html>