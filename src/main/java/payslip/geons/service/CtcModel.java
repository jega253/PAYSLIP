package payslip.geons.service;

import java.sql.Connection;
import java.sql.SQLException;

import payslip.geons.dto.CtcForm;



public class CtcModel {

	public void enterCtc(CtcForm ctc) throws Exception, SQLException {
		Connection connection = new Dao().getConnection();
		
	}
}
