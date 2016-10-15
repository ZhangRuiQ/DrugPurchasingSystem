package com.test;

import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;

public class ExcelSample1 {

 

       public static void main(String[] args) throws IOException {

    	 HSSFWorkbook wb = new HSSFWorkbook();

    	 //添加Worksheet（不添加sheet时生成的xls文件打开时会报错）
    	 @SuppressWarnings("unused")
    	 Sheet sheet1 = wb.createSheet();
    	 @SuppressWarnings("unused")
    	 Sheet sheet2 = wb.createSheet();
    	 @SuppressWarnings("unused")
    	 Sheet sheet3 = wb.createSheet("new sheet");
    	 @SuppressWarnings("unused")
    	 Sheet sheet4 = wb.createSheet("rensanning");

    	 //保存为Excel文件
    	 FileOutputStream out = null;

    	 try {
    	     out = new FileOutputStream("c:\\text.xls");
    	     wb.write(out);        
    	 } catch (IOException e) {
    	     System.out.println(e.toString());
    	 } finally {
    	     try {
    	         out.close();
    	     } catch (IOException e) {
    	         System.out.println(e.toString());
    	     }
    	 }

       }

}