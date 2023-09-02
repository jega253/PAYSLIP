package payslip.geons.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import payslip.geons.dto.Payroll;

public class EmployeeModel {

	public List<String> getlastmonthpayslip(String id) throws Exception {
		Dao dao = new Dao();
		 LocalDate currentDate = LocalDate.now();
		 String month=String.valueOf(currentDate.getMonthValue()-1);
		Connection connection=dao.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT ctc FROM payroll_db.ctc where empid=?");
		PreparedStatement preparedStatement2 = connection.prepareStatement("Select period from payroll_db.payroll where empid=? ");
		preparedStatement.setString(1, id);
		preparedStatement2.setString(1, id);
		ResultSet rs = preparedStatement.executeQuery();
		ResultSet rs1 = preparedStatement2.executeQuery();
		
		rs.next();
		String ctc=rs.getString(1);
		
		rs1.next();
		String period = rs1.getString(1);
		List<String> list = new ArrayList<>();
		list.add(ctc);
		list.add(period);
		return list;
		
	}
}
