package com.demo.common.UserTest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.demo.dto.hospital.DownloadInformation;

//合并了单元格后，获得该单元格只能通过首行标和首列标（对于包含在该合并单元格的下标是取不到任何数据的）
public class ExcelOpen {
//	 static XSSFRow row;
public static void main(String[] args) throws IOException {
	

	System.out.println(Charset.defaultCharset());
	
//	
//	FileInputStream fis = new FileInputStream(new File("D:/createworkbook.xlsx"));
//	
//		      XSSFWorkbook workbook = new XSSFWorkbook(fis);
//		      //获取工作簿
//		      XSSFSheet spreadsheet = workbook.getSheetAt(0);
//		      //获取行
//		      row=spreadsheet.getRow(6);
//		      //获取单元格
//		   XSSFCell cell = row.getCell(0);
//		   //遍历单元格
//		    Iterator<Cell> itercell=row.cellIterator();
//		    while(itercell.hasNext()){
//		    System.out.println(	itercell.next().getStringCellValue());
//		  
//		    }
//		    //修改excel的内容
//		    row=spreadsheet.getRow(4);
//		    row.getCell(0).setCellValue("咋说的发sdfsdafsdafsafasfaweytj放的");
//		      fis.close();
//		      //保存excel内容
//		      FileOutputStream fos=new FileOutputStream("D:/createworkbook.xlsx");
//		      workbook.write(fos);
//		      fos.close();
//	
}
}