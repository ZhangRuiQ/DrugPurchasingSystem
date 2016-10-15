package com.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.aop.ThrowsAdvice;

import com.common.domain.Manufacturer;
import com.common.domain.Medicine;
/**
 * 
 * @author 59238
 *
 */

public class StringPackExcel {
	
	private static void save(FileOutputStream fout,XSSFWorkbook workbook) throws IOException{
		System.out.println("数据输入完毕，正在存储。。。。。。。。。。。。。。。。。。。。");
		workbook.write(fout);
		
		fout.close();
	System.out.println("存储完毕。。。。。。。。。。。。。。。。。。。。。。。。。。。。");
	}
	
	public void Excel(String text,String fileAddress,int sheet,int beginRow,int beginCell) throws Exception{
		FileInputStream fin = null;
		File f=new File(fileAddress);
		XSSFWorkbook workBook;
		 XSSFSheet sheet1;
		if(beginCell<0||beginRow<0||text==null){
			System.out.println("参数写入有无效");
			throw new Exception("字符串写入excel过程中，方法参数写入无效");
		}
		if(!f.exists()){
			f.createNewFile();
			workBook=new XSSFWorkbook();
			 sheet1=workBook.createSheet("first");
			 
		}
		else{
			fin=new FileInputStream(new File(fileAddress));
			 workBook=new XSSFWorkbook(fin);
			  sheet1 = workBook.getSheetAt(sheet);
			  if(null==sheet1){
				  sheet1=workBook.cloneSheet(sheet);
			  }
		}
		
		
		XSSFRow row =sheet1.getRow(beginRow);
		if(null==row){
			row=sheet1.createRow(beginRow);
		}
		
		XSSFCell cell=row.getCell(beginCell);
		if(null==cell){
			cell=row.createCell(beginCell);
		}
		
		cell.setCellValue(text);
		StringPackExcel.save(new FileOutputStream(fileAddress), workBook);
		if(null!=fin){
			fin.close();
		}
	
		
		
	}
	public void deleteSheet(String fileAddress,int sheet,int beginRowNumber) throws Exception{
		FileInputStream fin = null;
		File f=new File(fileAddress);
		XSSFWorkbook workBook;
		 XSSFSheet sheet1;
		if(!f.exists()){
			System.out.println("文件不存在");
			throw new Exception("文件不存在");
			 
		}
		else{
			fin=new FileInputStream(new File(fileAddress));
			 workBook=new XSSFWorkbook(fin);
			  sheet1 = workBook.getSheetAt(sheet);
			  if(null==sheet1){
					System.out.println("不存在此工作表");
					throw new Exception("不存在此工作表");
			  }
			
		}
		int endRowNumber=sheet1.getLastRowNum();
		if(beginRowNumber<0)
		{
			System.out.println("参数写入有无效");
			throw new Exception("excel删除单元格过程中，方法参数写入无效");
		}
		
		if(beginRowNumber>endRowNumber){
			
			return;
			
		}
		
		
		
		XSSFRow beginRow =sheet1.getRow(beginRowNumber);
		XSSFRow endRow=sheet1.getRow(endRowNumber);
		if(beginRow==null||endRow==null){
			System.out.println("不存在第"+beginRowNumber+"行");
			return;
		}
		
		   int moveCount=endRowNumber-beginRowNumber+1;
			   sheet1.createRow((endRowNumber+1));
			   
			for(int i=0;i<moveCount;i++){
			sheet1.shiftRows(endRowNumber+1, sheet1.getLastRowNum(), -1);
			endRowNumber--;
			
			
			}
			StringPackExcel.save(new FileOutputStream(fileAddress), workBook);
			if(null!=fin){
				fin.close();
			}
		
		
	}
	
	

	public void deleteSheet(String fileAddress,int sheet,int beginRowNumber,int endRowNumber) throws Exception{
		FileInputStream fin = null;
		File f=new File(fileAddress);
		XSSFWorkbook workBook;
		 XSSFSheet sheet1;
		if(endRowNumber<0||beginRowNumber<0||beginRowNumber>endRowNumber){
			System.out.println("参数写入有无效");
			throw new Exception("excel删除单元格过程中，方法参数写入无效");
		}
		if(!f.exists()){
			System.out.println("文件不存在");
			throw new Exception("文件不存在");
			 
		}
		else{
			fin=new FileInputStream(new File(fileAddress));
			 workBook=new XSSFWorkbook(fin);
			  sheet1 = workBook.getSheetAt(sheet);
			  if(null==sheet1){
					System.out.println("不存在此工作表");
					throw new Exception("不存在此工作表");
			  }
			
		}
		XSSFRow beginRow =sheet1.getRow(beginRowNumber);
		XSSFRow endRow=sheet1.getRow(endRowNumber);
		if(beginRow==null){
			return;
		}
		if(endRow==null){
			endRow=sheet1.getRow(sheet1.getLastRowNum());
		}
	
	   int moveCount=endRowNumber-beginRowNumber+1;
	   if(endRowNumber==sheet1.getLastRowNum()){
		   sheet1.createRow((endRowNumber+1));
	   }
		for(int i=0;i<moveCount;i++){
		sheet1.shiftRows(endRowNumber+1, sheet1.getLastRowNum(), -1);
		endRowNumber--;
		
		}
		StringPackExcel.save(new FileOutputStream(fileAddress), workBook);
		if(null!=fin){
			fin.close();
		}
		
	}
	
	public  void Excel(List<List<String>> li,String fileAddress,int sheet,int beginRow,int beginCell) throws Exception{
		FileInputStream fin = null;
		File f=new File(fileAddress);
		XSSFWorkbook workBook;
		 XSSFSheet sheet1;
		if(beginCell<0||beginRow<0||li==null){
			System.out.println("参数写入有无效");
			throw new Exception("字符串写入excel过程中，方法参数写入无效");
		}
		if(!f.exists()){
			f.createNewFile();
			workBook=new XSSFWorkbook();
			 sheet1=workBook.createSheet("first");
			 
		}
		else{
			fin=new FileInputStream(new File(fileAddress));
			 workBook=new XSSFWorkbook(fin);
			  sheet1 = workBook.getSheetAt(sheet);
			  if(null==sheet1){
				  sheet1=workBook.cloneSheet(sheet);
			  }
		}
	
		
		if(li.isEmpty()){
			System.out.println("此list无任何数据");
			if(null!=fin){
				fin.close();
			}
			throw new Exception("字符串写入excel过程中，参数list（字符串列表）无数据");
			
		}
		
		XSSFRow row =sheet1.getRow(beginRow);
		if(null==row){
			row=sheet1.createRow(beginRow);
		}
		
		XSSFCell cell=row.getCell(beginCell);
		if(null==cell){
			cell=row.createCell(beginCell);
		}
		int maxCellNumber=0;
		for(List<String> strList:li){
			
			
			for(String str: strList){
				cell.setCellValue(str);
				int cellNumber=cell.getAddress().getColumn()+1;
				cell=row.getCell(cellNumber);
				if(null==cell){
					
					cell=row.createCell(cellNumber);
				}
				
				
			}
			if(maxCellNumber<cell.getAddress().getColumn()){
				maxCellNumber=cell.getAddress().getColumn();
			}
			row=sheet1.getRow(cell.getRowIndex()+1);
			if(null==row){
				row=sheet1.createRow(cell.getRowIndex()+1);
			}
			cell=row.getCell(beginCell);
			if(null==cell){
				cell=row.createCell(beginCell);
			}
			
		}
		for(int i=0;i<=maxCellNumber;i++){
			sheet1.autoSizeColumn(i, true);
		}
		
		
		
		StringPackExcel.save(new FileOutputStream(fileAddress),workBook);
		
		if(null!=fin){
			fin.close();
		}
		
		
		
	}


}
