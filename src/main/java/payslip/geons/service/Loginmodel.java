package payslip.geons.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import payslip.geons.dto.Employee;
import payslip.geons.dto.Payroll;

public class Loginmodel {

	public Employee getemployeeBycredential(String username, String password)
			throws SQLException, ClassNotFoundException {

		Dao dao = new Dao();
		Employee employee = null;
		Connection connection = dao.getConnection();
		try {
			
			PreparedStatement preparedStatement = connection
					.prepareStatement("Select * from employee where email=? and password=?");
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				employee = new Employee();
				employee.setEmpid(rs.getString(1));
				employee.setFullname(rs.getString(2));
				employee.setEmail(rs.getString(3));
				employee.setPassword(rs.getString(4));
				employee.setRole(rs.getInt(5) != 0);
				employee.setDoj(rs.getString(6));
				employee.setEsi(rs.getInt(7));
				employee.setPf(rs.getInt(8));
				employee.setPtax(rs.getInt(9));
				employee.setHra(rs.getInt(10));
				employee.setAadhar(rs.getInt(11));
				employee.setPan(rs.getString(12));
				employee.setUan(rs.getString(13));
				employee.setDesignation(rs.getString(14));
				employee.setDepartment(rs.getString(15));
				employee.setGenter(rs.getString(16));
				employee.setcLeave(rs.getInt(17));
				employee.setsLeave(rs.getInt(18));
				employee.setpLeave(rs.getInt(19));
				employee.setPayrollist(getPayrollEntries(connection, employee.getEmpid()));
				// check every time when the user is login wheather the payslip is sent or not
				boolean payslipSent = checkMonth(employee, connection);
				employee.setPayslipSent(payslipSent);
				connection.close();
				return employee;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		connection.close();
		return employee;

	}

	public synchronized List<Payroll> getPayrollEntries(Connection connection, String employeeId) throws SQLException {
		List<Payroll> payrollEntries = new ArrayList<>();

		String query = "SELECT * FROM payroll WHERE empid = ?";

		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, employeeId);

			try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					Payroll payroll = new Payroll();
					payroll.setPayrollid(resultSet.getInt(1));
					payroll.setEmpid(resultSet.getString(2));
					payroll.setPeriod(resultSet.getString(3));

					payroll.setPayslipSent(resultSet.getBoolean(4));
					payroll.setCredited(resultSet.getDouble(5));
					payrollEntries.add(payroll);
				}
			}
		}

		return payrollEntries;
	}

	private boolean checkMonth(Employee employee, Connection connection) {
		String empid = employee.getEmpid();
		String doj = employee.getDoj();
		String query = "SELECT max(period) FROM payroll_db.payroll where empid= ?";
		boolean result = false;
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, empid);
			ResultSet resultSet = preparedStatement.executeQuery();
			Date date = new Date();
			String currentDate = new SimpleDateFormat("yyyy-MM").format(date);
			if (resultSet.next()) {
				String period = resultSet.getString(1);

				if (period != null) {

					if (monthConverter(currentDate, period)) {
						changestatus(connection, empid, 1);
						return true;
					} else {
						System.out.println("changed");
						changestatus(connection, empid, 0);
					}
				}
			} else if (monthConverter(currentDate, doj)) {
				changestatus(connection, empid, 1);
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

//it will change the status in the employee table
	private void changestatus(Connection connection, String empid, int status) {
		String query = "UPDATE payroll_db.employee SET payslipSent = ? WHERE (empid = ?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, status);
			preparedStatement.setString(2, empid);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private Boolean monthConverter(String currentMonth, String payrollMonth) {

		payrollMonth = payrollMonth.substring(0, 7);
		// System.out.println(string.substring(0, 4));
		return currentMonth.equals(payrollMonth);

	}
}
