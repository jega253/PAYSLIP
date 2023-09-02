<%@page import="payslip.geons.dto.CtcForm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="payslip.geons.dto.Employee"%>
<%@page import="payslip.geons.dto.Payroll"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payslip</title>
 <% HttpSession mysession = request.getSession(); %>
 
  <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    />
    <style>
      body {
        padding: 20px;
      }

      .payslip {
        background-color: #f9f9f9;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
      }

      .payslip-header {
        text-align: center;
        margin-bottom: 20px;
      }

      .payslip-header h2 {
        margin-top: 0;
      }

      .payslip-details {
        margin-bottom: 30px;
      }

      .payslip-details p {
        margin: 0;
      }
      .top {
        display: flex;
      }
      .imagelogo {
        margin-left: 35%;
      }
      .paysum {
        text-decoration: underline;
      }
      .month{
	text-transform: uppercase;
	}
      .textbor {
        border: 1px solid black;
        width: 40%;
        margin-left: 0px;
      }
      .netsal {
        border: 1px solid black;
        width: 20%;
        margin-left: 250px;
        height: 50%;
        margin-top: 100px;
      }
      .scolor {
        background-color: rgb(152, 214, 243);
    /* height: 50px; */
	    margin-left: 7px;
	    margin-right: 7px;
	    text-align: center;
	    padding: 14px;
      }
      .summarynetsal {
        display: flex;
      }
      .table{
        width: 100%;
        margin-left: 0px;
        padding-left: 0px;
        margin-top: 10px;
    }
    @media print {
    #printbtn
    {
    display: none;
    }
.nettotal
{
 	
}
	.foot
	{
	text-align:center;
	}
	
	
    </style>
</head>
<body>
<button  class="btn btn-primary" id="printbtn"  style="margin-left: 80%">
 <a href="Downloadpdf">Print Payslip</a>
 
</button>

<div class="container-fluid">
      <div>
        <h4 style="margin-top: 20px">Geons Logix private Limited</h4>
        <div class="top">
          <p>
            3rd Floor Lakshmi sundaram complex,Kaalavasal Junction,<br />
            Theni Main Road,<br />
            Madurai Tamil Nadu -625016.<br />
          </p>
          <img
            src="image/123.jpg"
            style="height: 65px; width: 200px"
            class="imagelogo"
            alt=""
          />
        </div>
      </div>
      <div class="payslip">
        <div class="payslip-header">
          <h4 style="font-size:xx-large;"><b class="month">PAYSLIP FOR MONTH OF  <%=  mysession.getAttribute("month")%></b> </h4>
         
        </div>
        <div class="payslip-details">
         <p class="paysum" style="font-size: x-large;"><strong>Employee Pay Summary</strong></p>
        </div>
        <div class="summarynetsal">
         <table class="textbor">
                <tr>
                    <td> <p
                      style="margin-top: 0px; margin-bottom: 0px; margin-left: 10px">
                       <b> EMP CODE :
                      </p></td>
                    <td></b><%= ((Employee) session.getAttribute("name")).getEmpid() %></td>
                </tr>
                <tr><td><p style="margin-top: 0px; margin-bottom: 0px; margin-left: 10px">
                    <b>EMP NAME :</b>
                  </p></td>
                <td> <%= ((Employee) session.getAttribute("name")).getFullname() %></td>
    
                </tr>
                <tr>
                    <td><p style="margin-top: 0px; margin-bottom: 0px; margin-left: 10px">
                        <b>  DATE OF JOINING :</b>
                        </p></td>
                    <td><%= ((Employee) session.getAttribute("name")).getDoj() %></td>
                </tr>
                <tr><td>  <p style="margin-top: 0px; margin-bottom: 0px; margin-left: 10px">
                    <b> DESIGNATION:</b> 
                   </p>
              </td>
                <td><%= ((Employee) session.getAttribute("name")).getDesignation() %></td></tr>
                <td><p style="margin-top: 0px; margin-bottom: 0px; margin-left: 10px"><b> DEPARTMENT:</b> </p></td>
  <td><%= ((Employee) session.getAttribute("name")).getDepartment() %></td>
</tr>
<tr>
  <td><p style="margin-top: 0px; margin-bottom: 0px; margin-left: 10px"><b>GENDER: </b></p></td>
  <td><%= ((Employee) session.getAttribute("name")).getGenter() %></td>
              <tr><td><hr></td><td><hr></td></tr>
                <tr><td><p style="margin-top: 10px; margin-bottom: 0px; margin-left: 10px">
                    <b>  UAN :</b>
                    </p></td>
                <td> <%= ((Employee) session.getAttribute("name")).getUan() %></td></tr>
                <tr><td><p style="margin-top: 0px; margin-bottom: 0px; margin-left: 10px">
                    <b>  PF ACCOUNT NO :</b>
                    </p></td>
                <td> <%= ((Employee) session.getAttribute("name")).getPf() %></td></tr>
                <tr><td> <p style="margin-top: 0px; margin-bottom: 0px; margin-left: 10px">
                    <b>  ESI NO :</b> 
                    </p></td>
                <td><%= ((Employee) session.getAttribute("name")).getEsi() %></td></tr>
                <tr><td>  <p style="margin-top: 0px; margin-bottom: 0px; margin-left: 10px">
                    <b>  PAN NO :</b>  
                    </p></td>
                <td><%= ((Employee) session.getAttribute("name")).getPan() %></td></tr>
                <tr><td><hr></td><td><hr></td></tr>
                <tr><td> <p style="margin-top: 10px; margin-bottom: 0px; margin-left: 10px">
                    <b> CASUAL LEAVE :</b>
                   </p></td>
                <td><%= ((Employee) session.getAttribute("name")).getcLeave() %></td></tr>
                <tr><td><p style="margin-top: 0px; margin-bottom: 0px; margin-left: 10px">
                    <b> SICK LEAVE :</b>
                   </p></td>
                <td><%= ((Employee) session.getAttribute("name")).getsLeave() %></td></tr>
                <tr><td>  <p style="margin-top: 0px; margin-bottom: 5px; margin-left: 10px">
                    <b>  PRIVELEGE LEAVE :</b>
                    </p></td>
                <td><%= ((Employee) session.getAttribute("name")).getpLeave() %></td></tr>
            </table>
           
          <div class="netsal">
            <h4
              style="text-align: center; margin-top: 20px; margin-bottom: 20px"
            >
            <b>  Net total</b>
            </h4>
            <div class=" scolor"><span id="netvalue" class="nettotal"><%= (int)((CtcForm) session.getAttribute("pay")).getTotalGrossSalaryComponentsA()/12 %></span></div>
            <h5
              style="text-align: center; margin-top: 20px; margin-bottom: 20px"
            >
            <b>  PAID DAYS | LOP</b>
            </h5>
          </div>
        </div>
       

        
<table class="table "  >

<thead>

  <tr class="th" style="height:80%;" >

  <th  class="table-primary" ><h1 style="color:black;font-size:14px;text-color:black;"><b>EARNINGS</h1></b></th>

  <th class="table-primary"  ><h1 style="color:black;font-size:14px;text-color:black; "><b>INR</h1></b></th>

  <th class="table-primary"  ><h1 style="color:black;font-size:14px;text-color:black; "><b>DEDUCTION </h1></b></th>

  <th class="table-primary"  ><h1 style="color:black;font-size:14px;text-color:black; "><b>INR </h1></b></th>

  </tr>

</thead>

<tbody>

 <tr class="" style="background-color:white;">

  <td   style="font-size:13px;">BASIC</td>

  <td><%= ((CtcForm) session.getAttribute("pay")).getBasic()/12 %></td>

  <td  style="font-size:13px;">PF AMOUNT</td>

  <td><%= ((CtcForm) session.getAttribute("pay")).getEmployeesContributionToPF()/12 %></td>

  </tr>

  <tr class="" style="background-color:white;">

  <td  style="font-size:13px;" >HRA</td>

  <td><%= ((CtcForm) session.getAttribute("pay")).getHouseRentAllowance()/12 %></td>

  <td  style="font-size:13px;">PROFESSIONAL TAX</td>

  <td><%= ((Employee) session.getAttribute("name")).getPtax() %></td>

  </tr>

  <tr class="" style="background-color:white;">

  <td style="font-size:13px;" >OTHER ALLOWANCE</td>
  
  <td><%= ((CtcForm) session.getAttribute("pay")).getOtherAllowance()/12 %></td>

  <td style="font-size:13px;" >ESI</td>

  <td><%= ((CtcForm) session.getAttribute("pay")).getEmployersContributionToESI()/12 %></td>

  </tr>

  <tr class="table-primary" style="background-color:#008080;">

  <td class="" ><h1 style="color:black;font-size:13px;">GROSS TOTAL</h1></td>
  
  <td class="" ><%= ((CtcForm) session.getAttribute("pay")).getTotalGrossSalaryComponentsA()/12 %></td>

  <td class="" ><h1 style="color:black;font-size:13px;">DEDUCTION TOTAL</h1></td>
  
  <td class="" ><%= (((CtcForm) session.getAttribute("pay")).getEmployersContributionToESI()/12)+(((CtcForm) session.getAttribute("pay")).getEmployeesContributionToPF()/12) +(((Employee) session.getAttribute("name")).getPtax()) %></td>

  </tr></tbody>  
  </table>  <div>NET TOTAL : <%= (int)((CtcForm) session.getAttribute("pay")).getTotalGrossSalaryComponentsA()/12 %> ( <span id="words"></span> only)</div>
      </div>
      
      
<p style="text-align:center; margin-top:20px;">This is Computer generated Payslip. No Signature required</p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script>
      var a = ['','one ','two ','three ','four ', 'five ','six ','seven ','eight ','nine ','ten ','eleven ','twelve ','thirteen ','fourteen ','fifteen ','sixteen ','seventeen ','eighteen ','nineteen '];
      var b = ['', '', 'twenty','thirty','forty','fifty', 'sixty','seventy','eighty','ninety'];

      function inWords (num) {
          if ((num = num.toString()).length > 9) return 'overflow';
          n = ('000000000' + num).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
          if (!n) return; var str = '';
          str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + 'crore ' : '';
          str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + 'lakh ' : '';
          str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + 'thousand ' : '';
          str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + 'hundred ' : '';
          str += (n[5] != 0) ? ((str != '') ? 'and ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + 'only ' : '';
          return str;
      }
		
      var netvalue = document.getElementById('netvalue').innerHTML;
      console.log(netvalue);
      document.getElementById('words').innerHTML = inWords(netvalue);
      //document.getElementById('netvalue').onkeyup = function () {
      
      //};
      </script>
</body>
</html>