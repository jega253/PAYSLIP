package payslip.geons.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import payslip.geons.dto.Ctc;

public class CtcSave {

	public void save(Ctc ctc) throws Exception, SQLException {
		Connection connection = new Dao().getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO payroll_db.ctc (empid, period, ctc) VALUES (?,?,?)");
		preparedStatement.setString(1, ctc.getEmpid());
		preparedStatement.setString(2, ctc.getPeriod());
		preparedStatement.setDouble(3, ctc.getCtc());
		
		preparedStatement.executeUpdate();
		
		
	}
}
