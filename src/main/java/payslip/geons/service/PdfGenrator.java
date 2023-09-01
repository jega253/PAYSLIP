package payslip.geons.service;

import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.EncryptionConstants;
import com.itextpdf.kernel.pdf.PdfDocument;

import com.itextpdf.kernel.pdf.PdfReader;

import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.WriterProperties;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;

import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;

import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;

import payslip.geons.dto.CtcForm;
import payslip.geons.dto.Employee;

public class PdfGenrator {

	public void pdfGenertor(Employee employee, String month, CtcForm ctcForm) throws IOException {

		NumberToWords toWords = new NumberToWords();

		String words = toWords.convert((int) ctcForm.getTotalGrossSalaryComponentsAMonth());
		double EmployeesContributionToPF= ctcForm.getEmployeesContributionToPF() / 12;
		double EmployeesContributionToESI = ctcForm.getEmployeesContributionToESI() / 12;
		double de=EmployeesContributionToPF+EmployeesContributionToESI;
		String Deduct = String.valueOf(de);
		double basic = ctcForm.getBasic()/12;
		double hra = ctcForm.getHouseRentAllowance()/12;
		double other= ctcForm.getOtherAllowance()/12;
		
		
		final byte[] userpass = employee.getEmpid().getBytes();
		final byte[] adminpass = "password_admin".getBytes();
		WriterProperties writerProperties = new WriterProperties();
		writerProperties.setStandardEncryption(userpass, adminpass, EncryptionConstants.ALLOW_PRINTING, 0);
		String path = "D:\\invoice"+month.toUpperCase()+".pdf";
		
		
		
		FileOutputStream fileoutputStream = new FileOutputStream(path);
		PdfWriter pdfWriter = new PdfWriter(fileoutputStream, writerProperties);

		PdfDocument pdfdocument = new PdfDocument(pdfWriter);
		pdfdocument.setDefaultPageSize(PageSize.A4);
		Document document = new Document(pdfdocument);
		ImageData imagedata = ImageDataFactory.create("C:\\java project\\payslip\\src\\main\\webapp\\image\\123.jpg");
		Image image = new Image(imagedata);

		float[] arr = { 570f, 150f };
		Table table = new Table(arr);
		Table table2 = new Table(new float[] { 570f });
		table2.addCell(new Cell().add(
				"3rd Floor Lakshmi sundaram complex,\nKaalavasal Junction,\nTheni Main Road,\nMadurai Tamil Nadu -625016")
				.setFontSize(12f).setBorder(Border.NO_BORDER));
		Cell cell = new Cell().add("Geons Logix private Limited").setFontSize(16f).setBorder(Border.NO_BORDER);
		cell.add(table2);

		table.addCell(cell);

		table.addCell(new Cell().add(image).setBorder(Border.NO_BORDER));

		Table large = new Table(new float[] { 720f });

		large.addCell(new Cell().add("PAYSLIP FOR MONTH OF " + month.toUpperCase()).setBorder(Border.NO_BORDER))
				.setFontSize(19f).setTextAlignment(TextAlignment.CENTER).setBold();
		Table table3 = new Table(new float[] { 190f });
		table3.addCell(new Cell().add("Employee Pay Summary").setBorder(Border.NO_BORDER)).setFontSize(13f).setBold()
				.setUnderline().setTextAlignment(TextAlignment.LEFT);
		table3.setBorder(Border.NO_BORDER);
		large.addCell(table3);

		large.setBorder(Border.NO_BORDER);

		Table table4 = new Table(new float[] { 220f, 200f, 300f });
		Table table4nest = new Table(new float[] { 120f, 100f });

		table4nest.addCell(new Cell().add("EMP CODE :").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest.addCell(new Cell().add(employee.getEmpid()).setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		System.out.println("down");
		table4nest.addCell(new Cell().add("EMP NAME :").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest.addCell(new Cell().add(employee.getFullname()).setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest.addCell(new Cell().add("DATE OF JOINING:").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest.addCell(new Cell().add(employee.getDoj()).setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest.addCell(new Cell().add("DESIGNATION:").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest.addCell(new Cell().add(employee.getDesignation()).setFontSize(10f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table4nest.addCell(new Cell().add("DEPARTMENT:").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest.addCell(new Cell().add(employee.getDepartment()).setFontSize(10f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table4nest.addCell(new Cell().add("GENDER:").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest.addCell(new Cell().add(employee.getGenter()).setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));

		table4.addCell(table4nest);
		table4.addCell(new Cell().setBorder(Border.NO_BORDER));
		table4.addCell(new Cell().setBorder(Border.NO_BORDER));

		Table table4nest1 = new Table(new float[] { 120f, 100f });
		table4nest1.addCell(
				new Cell().add("\n").setFontSize(10f).setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table4nest1.addCell(
				new Cell().add("\n").setFontSize(10f).setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table4nest1.addCell(new Cell().add("UAN :").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest1.addCell(new Cell().add(employee.getUan()).setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest1.addCell(new Cell().add("PF AC NO :").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest1.addCell(new Cell().add(String.valueOf(employee.getPf())).setFontSize(10f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table4nest1.addCell(new Cell().add("ESI NO :").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest1.addCell(new Cell().add(String.valueOf(employee.getEsi())).setFontSize(10f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table4nest1.addCell(new Cell().add("PAN NO :").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest1.addCell(new Cell().add(employee.getPan()).setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4.addCell(table4nest1);

		table4.addCell(new Cell().setBorder(Border.NO_BORDER));

		Table netTotalTable = new Table(new float[] { 300f });

		netTotalTable.addCell(new Cell().add("Net Total").setBorder(Border.NO_BORDER).setFontSize(11f).setBold()
				.setTextAlignment(TextAlignment.CENTER).setBackgroundColor(Color.LIGHT_GRAY, 20f));
		netTotalTable.addCell(new Cell().add("\n").setBorder(Border.NO_BORDER).setFontSize(11f).setBold()
				.setTextAlignment(TextAlignment.CENTER));
		netTotalTable.addCell(new Cell().add(String.valueOf(ctcForm.getTotalGrossSalaryComponentsAMonth()))
				.setBorder(Border.NO_BORDER).setFontSize(14f).setBold().setTextAlignment(TextAlignment.CENTER));
		netTotalTable.addCell(new Cell().add("\n").setBorder(Border.NO_BORDER).setFontSize(11f).setBold()
				.setTextAlignment(TextAlignment.CENTER));
		netTotalTable.addCell(new Cell().add("Paid Days:30|Lop:1").setBorder(Border.NO_BORDER).setFontSize(11f)
				.setBold().setTextAlignment(TextAlignment.CENTER).setBackgroundColor(Color.LIGHT_GRAY, 20f));

		table4.addCell(netTotalTable);

		Table table4nest2 = new Table(new float[] { 120f, 100f });
		table4nest2.addCell(new Cell().add("CASUAL LEAVE :").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest2.addCell(new Cell().add(String.valueOf(employee.getcLeave())).setFontSize(10f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table4nest2.addCell(new Cell().add("SICK LEAVE :").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest2.addCell(new Cell().add(String.valueOf(employee.getsLeave())).setFontSize(10f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table4nest2.addCell(new Cell().add("PRIVELEGE LEAVE :").setFontSize(10f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table4nest2.addCell(new Cell().add(String.valueOf(employee.getpLeave())).setFontSize(10f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));

		table4.addCell(table4nest2);
		table4.addCell(new Cell().setBorder(Border.NO_BORDER));
		table4.addCell(new Cell().setBorder(Border.NO_BORDER));

		large.addCell(table4);

		Table table5 = new Table(new float[] { 200f, 160f, 200f, 160f, });
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("Earnings").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBackgroundColor(Color.LIGHT_GRAY, 20f));
		table5.addCell(new Cell().add("INR").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold().setBackgroundColor(Color.LIGHT_GRAY, 20f));
		table5.addCell(new Cell().add("DEDUCTION").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold().setBackgroundColor(Color.LIGHT_GRAY, 20f));
		table5.addCell(new Cell().add("INR").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold().setBackgroundColor(Color.LIGHT_GRAY, 20f));

		table5.addCell(new Cell().add("BASIC").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add(String.valueOf(basic)).setFontSize(12f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add("PF AMOUNT").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add(String.valueOf(EmployeesContributionToPF)).setFontSize(12f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add("HRA").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add(String.valueOf(hra)).setFontSize(12f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add("PROFESSIONAL TAX").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table5.addCell(
				new Cell().add("0").setFontSize(12f).setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add("OTHER ALLOWANCE").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add(String.valueOf(other)).setFontSize(12f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add("ESI").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add(String.valueOf(EmployeesContributionToESI)).setFontSize(12f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER));
		table5.addCell(new Cell().add("").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("GROSS TOTAL").setFontSize(13f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBackgroundColor(Color.LIGHT_GRAY, 10f));
		table5.addCell(new Cell().add(String.valueOf(ctcForm.getTotalGrossSalaryComponentsAMonth())).setFontSize(12f)
				.setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER)
				.setBackgroundColor(Color.LIGHT_GRAY, 10f));
		table5.addCell(new Cell().add("DEDUCTION TOTAL").setFontSize(13f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBackgroundColor(Color.LIGHT_GRAY, 10f));
		table5.addCell(new Cell().add(Deduct).setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBackgroundColor(Color.LIGHT_GRAY, 10f));

		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		table5.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());

		large.addCell(table5);
		Table computer = new Table(new float[] { 720f });

		computer.addCell(new Cell()
				.add("NET TOTAL : " + ctcForm.getTotalGrossSalaryComponentsAMonth() + "(" + words + "Rupees only)")
				.setFontSize(12f).setTextAlignment(TextAlignment.LEFT).setBorder(Border.NO_BORDER).setBold());
		computer.addCell(new Cell().add("\n").setFontSize(12f).setTextAlignment(TextAlignment.LEFT)
				.setBorder(Border.NO_BORDER).setBold());
		computer.addCell(new Cell().add("This is Computer generated Payslip. No Signature required").setFontSize(12f)
				.setTextAlignment(TextAlignment.CENTER).setBorder(Border.NO_BORDER));

		// Removing borders for the large table and its cells
		for (int i = 0; i < large.getNumberOfRows(); i++) {
			for (int j = 0; j < large.getNumberOfColumns(); j++) {
				large.getCell(i, j).setBorder(Border.NO_BORDER);
			}
		}

		document.add(table);
		document.add(large);
		document.add(computer);

		document.close();
		fileoutputStream.close();

	}

}
