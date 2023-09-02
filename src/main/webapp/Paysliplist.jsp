 <%@page import="java.util.List"%>
<%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%>

<!doctype html>
<html lang="en">
  <head>
  <%Employee employee=(Employee)session.getAttribute("name");%>
 

  	<title>Payslip</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		
		
		
		<link rel="stylesheet" href="css/stylee.css">
		
		   <!--  ----------import the package------  -->
         
         <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="custom-menu">
					<button type="button" id="sidebarCollapse" class="btn btn-primary">
	          <i class="fa fa-bars"></i>
	          <span class="sr-only">Toggle Menu</span>
	        </button>
        </div>
				<div class="p-4">
		  		<h1><a href="index.html" class="logo"><img alt="logo" src="image/geons-dashboard.png"></a></h1>
	        <ul class="list-unstyled components mb-5">
	          <li >
	            <a href="user.jsp"><span class="fa fa-home mr-3"></span>Dashboard</a>
	          </li>
	          <li class="active">
	              <a href="Paysliplist.jsp"><span class="fa fa-user mr-3"></span>payslip List</a>
	          </li>
	          <li>
	              <a href="createpassword.jsp"><span class="fa fa-user mr-3"></span>Create Password</a>
	          </li>
	          <li>
              <a href="LogoutServlet"><span class="fa fa-briefcase mr-3"></span>Signout</a>
	          </li>
	        </ul>

	         


	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">
          <h2 class="mb-4">Welcome,<%= ((Employee) session.getAttribute("name")).getFullname() %>!</h2>
             <p class="text-center font-weight-bold  text-primary fs-5"></p>
           <p></p>
           
          <table class="table table-sm" id="example">
  <thead>
    <tr class="table-primary text-primary">
      <th scope="col">SNo</th>
     
       <th scope="col">Period</th>
        <th scope="col">Credited</th>
      <th scope="col">View payslip</th>
      
      
    </tr>
  </thead>
  <tbody>
          <tr>
            <%List<Payroll> data =employee.getPayrollist();
          for(int i=0;i<data.size();i++)
  {  
   Payroll payroll= (Payroll)data.get(i);
    %>
    		 <th><%=i+1%></th>
     		
              <td><%=payroll.getPeriod()%></td>
              <td><%=payroll.getCredited() %></td>
              <td><a href="pdfgen?period=<%= payroll.getPeriod()%>&credited=<%=payroll.getCredited()%>"><img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/money-transfer.png" alt="money-transfer"/></a></td>
            </tr>
  <%}%>
             
  
          
  </tbody>
</table>
                                  

      </div>
		</div>

    <script src="jquery.min.js"></script>
    <script src="popper.js"></script>
    <script src="bootstrap.min.js"></script>
    <script src="main.js"></script>
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
