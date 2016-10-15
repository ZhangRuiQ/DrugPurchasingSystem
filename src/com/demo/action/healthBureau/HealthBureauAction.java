package com.demo.action.healthBureau;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.common.domain.Manufacturer;
import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.domain.OrderItem;
import com.common.dto.HealthBureauDto;
import com.common.dto.MedicineDto;
import com.common.dto.OrderDto;
import com.common.dto.OrderItemDto;
import com.demo.service.healthBureau.healthBureauService;
import com.opensymphony.xwork2.ActionSupport;

public class HealthBureauAction extends ActionSupport implements SessionAware,RequestAware,ApplicationAware{
	private Map<String,Object> request;
	private Map<String,Object> session;
	private Map<String,Object>  application;
	
	private healthBureauService healthBureauService;
	private HealthBureauDto healthBureauDto;
	private MedicineDto medicineDto;
	private OrderDto orderDto;
	private List<Medicine> medicines; 
	private List<Order> orders; 
	private File excelFile;//File对象，目的是获取页面上传的文件
	private int page;	//查看第几页的页数
	private PageBean pageBean;
	private String message; //用来判定是那个页面提交的
	private PageBean orderItems;
	private OrderItemDto orderItemDto;
	

	//药品目录查询(分页查询)
	public String medicine_search(){
		System.out.println(medicineDto);
		
		this.pageBean = healthBureauService.searchMedicines(medicineDto, 8, page);
		application.put("pageBean", pageBean);
		
		return "forward";
	}
	
	public String insertMedicine(){
		System.out.println(medicineDto);
		
		healthBureauService.insertMedicine(medicineDto);
		
		return "forward";
	}
	
	//每个药品点击修改后所需的查询
	public void medicine_search_maintain() throws IOException{
		System.out.println(medicineDto);
		
		Medicine medicine = healthBureauService.searchSingleMedicineByNumber(medicineDto.getNumber());
			
		String m = ""+medicine.getType();
		m+= ","+medicine.getStandard();
		m+= ","+medicine.getStockBalance();
		m+= ","+medicine.getNumber();
		m+= ","+medicine.getManufacturer().getNumber();
		m+= ","+medicine.getName();
		m+= ","+medicine.getPrice();
		System.out.println(m);
			
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
			
		out.write(m);
		out.flush();
		out.close();
	}
	
	//单个药品修改
	public String updateMedicine(){
		
		healthBureauService.updateMedicine(medicineDto);
		
		return "forward";
	}
	
	//删除单个药品
	public String deleteMedicineByNumber(){
		System.out.println(medicineDto);
		
		healthBureauService.deleteMedicineByNumber(medicineDto);
		
		return "forward";
	}
	
	
	//药品目录维护
	public String medicine_maintain(){
		
		medicine_search();
		
		System.out.println(medicineDto);
		
		return "forward";
	}
	
	// 药品目录的导入
	public String importExcel() {
		String number = null;
	    String name = null;
	    String standard=null;
	    String stockBalance = null;
	    double price = 0.0;
	    String type = null;
	    String status = null;
	    String manufacturerNumber = null;
	    
	    int k = 0;		//k为插入的次数
	    int flag = 0;   //指示指针所访问的位置
	    Workbook workbook = null;
	    
	    if( excelFile != null){
	    	String path = excelFile.getAbsolutePath();		//获取文件的路径
	    	InputStream is = null;
	        try {
	        	is = new FileInputStream(path);
	        	workbook = new HSSFWorkbook(is);
	             for (int numSheets = 0; numSheets < workbook.getNumberOfSheets(); numSheets++) {      //读取每一个sheet 
	                System.out.println("2003版进入读取sheet的循环");			//循环获取全部sheet
	                if ( null != workbook.getSheetAt(numSheets) ) {   
	                    HSSFSheet aSheet = (HSSFSheet)workbook.getSheetAt(numSheets);		//定义sheet对象
	                    for (int rowNumOfSheet = 1; rowNumOfSheet <= aSheet.getLastRowNum(); rowNumOfSheet++) {        //进入当前sheet的行的循环,获得一行  
	                        if ( null != aSheet.getRow(rowNumOfSheet )) {
	                            HSSFRow  aRow = aSheet.getRow(rowNumOfSheet);		 //定义行	
	                            for (int cellNumOfRow = 0; cellNumOfRow <= 7; cellNumOfRow++) {   //读取rowNumOfSheet值所对应行的数据 ，循环当前sheet的所有列
	                               HSSFCell  aCell = aRow.getCell(cellNumOfRow);      //获得列值  
	                               
	                               //根据单元格不同属性返回字符串数值
	                               String cellValue = "";      
	                               switch (aCell.getCellType()) {      
	                               case HSSFCell.CELL_TYPE_STRING://字符串类型   
	                                   cellValue = aCell.getStringCellValue();      
	                                   if(cellValue.trim().equals("")||cellValue.trim().length()<=0)      
	                                       cellValue=" ";      
	                                   break;      
	                               case HSSFCell.CELL_TYPE_NUMERIC: //数值类型   
	                                   cellValue = String.valueOf(aCell.getNumericCellValue());      
	                                   break;      
	                               case HSSFCell.CELL_TYPE_FORMULA: //公式   
	                            	   aCell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);      
	                                   cellValue = String.valueOf(aCell.getNumericCellValue());      
	                                   break;      
	                               case HSSFCell.CELL_TYPE_BLANK:      
	                                   cellValue=" ";      
	                                   break;      
	                               case HSSFCell.CELL_TYPE_BOOLEAN:      
	                                   break;      
	                               case HSSFCell.CELL_TYPE_ERROR:      
	                                   break;      
	                               default:      
	                                   break;      
	                               }   
	                               
	                               if(cellNumOfRow == 0){  
	                            	   number = cellValue;
	                               }
	                               if(cellNumOfRow == 1){  
	                            	   name = cellValue;
	                               }
	                               if(cellNumOfRow == 2){  
	                            	   type = cellValue;
	                               }
	                               if(cellNumOfRow == 3){  
	                            	   standard = cellValue;
	                               }
	                               if(cellNumOfRow == 4){  
	                            	   stockBalance = cellValue;
	                               }
	                               if(cellNumOfRow == 5){  
	                            	   price = Double.parseDouble(cellValue);
	                               }
	                               if(cellNumOfRow == 6){  
	                            	   status = cellValue;
	                               }
	                               if(cellNumOfRow == 7){  
	                            	   manufacturerNumber = cellValue;
	                               }
	                            }
	                            
	                            //如果要插入的数据不为空，则执行插入
		                        if(number != null && name != null && type != null && standard != null && stockBalance != null && price != 0.0 && status != null && manufacturerNumber != null ){
		                         	Manufacturer manufacturer = new Manufacturer();
		                        	manufacturer.setNumber(manufacturerNumber);
		                        	MedicineDto medicine_Dto = new MedicineDto();
		                        	medicine_Dto.setNumber(number);
		                        	medicine_Dto.setName(name);
		                        	medicine_Dto.setType(type);
		                        	medicine_Dto.setStandard(standard);
		                        	medicine_Dto.setStock_Balance(stockBalance);
		                        	medicine_Dto.setPrice(price);
		                        	medicine_Dto.setStatus(status);
		                        	medicine_Dto.setManufacturer(manufacturer);
		                        	healthBureauService.insertMedicine(medicine_Dto);
		                        	k++;
		                        
		                        }
	                       
                        }  
	                }  
	                    
	                System.out.println("k:"+k);		//k为插入的次数
	            } 
	          }
	       } catch (Exception ex) {
	                ex.printStackTrace();
	            }finally{
	                try {
	                    if( is != null )
	                        is.close();
	                }catch (Exception e1) {
	                        e1.printStackTrace();
	                }
	            }
		    }
	    	
	    
	    return "forward";
	}
	
	//药品目录的导出
	@SuppressWarnings("unchecked")
	public String exportExcel() {
		this.pageBean = healthBureauService.searchMedicines(null, healthBureauService.getMedicineCount(), 1);	//药品List
		medicines = pageBean.getList();
             
        String [] tableHeader={"流水号","通用名","规格","转换系数","价格","剂型","交易状态","生产企业"};
       
        int cellNumber = tableHeader.length;			 	     //表的列数
        HSSFWorkbook workbook = new HSSFWorkbook();   			 //创建一个excel
        HSSFCell cell = null;                             		 //Excel的列
        HSSFRow row = null;                                      //Excel的行
        HSSFCellStyle style = workbook.createCellStyle();        //设置表头的类型
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFCellStyle style1 = workbook.createCellStyle();       //设置数据类型
        style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font = workbook.createFont();                	 //设置字体
        HSSFSheet sheet = workbook.createSheet("sheet1");        //创建一个sheet
        HSSFHeader header = sheet.getHeader();                   //设置sheet的头
        try {              
            if(medicines.size() < 1 ){
                header.setCenter("查无资料");
            }else{
                header.setCenter("药品目录");
                row = sheet.createRow(0);
                row.setHeight((short)400);
                for(int k = 0;k < cellNumber;k++){
                    cell = row.createCell(k);//创建第0行第k列
                    cell.setCellValue(tableHeader[k]);//设置第0行第k列的值
                    sheet.setColumnWidth(k,5000);//设置列的宽度
                    font.setColor(HSSFFont.COLOR_NORMAL);      // 设置单元格字体的颜色.
                    font.setFontHeight((short)350); //设置单元字体高度
                    style1.setFont(font);//设置字体风格
                    cell.setCellStyle(style1);
                }
                        
                for(int i = 0 ;i < medicines.size() ;i++){                            
                    Medicine medicine = (Medicine)medicines.get(i);//获取Medicine对象
                    row = sheet.createRow((short) (i + 1));//创建第i+1行
                    row.setHeight((short)400);//设置行高
                   
                    if( medicine.getNumber() != null ){
                         cell = row.createCell(0);//创建第i+1行第0列
                         cell.setCellValue(medicine.getNumber());//设置第i+1行第0列的值
                cell.setCellStyle(style);//设置风格
                    }
                    if( medicine.getName() != null){
                         cell = row.createCell(1); //创建第i+1行第1列
 
                         cell.setCellValue(medicine.getName());//设置第i+1行第1列的值
 
                         cell.setCellStyle(style); //设置风格
                    }
                    //由于下面的和上面的基本相同，就不加注释了
                    if( medicine.getStandard() != null){
                         cell = row.createCell(2);
                         cell.setCellValue(medicine.getStandard());
                         cell.setCellStyle(style);
                    }
                    if( medicine.getStockBalance() != null){
                         cell = row.createCell(3);
                         cell.setCellValue(medicine.getStockBalance());
                         cell.setCellStyle(style);
                    }
                    if( medicine.getPrice() != 0.0 ){
                         cell = row.createCell(4);
                         cell.setCellValue(medicine.getPrice());
                         cell.setCellStyle(style);
                    }
                    if( medicine.getType() != null){
                        cell = row.createCell(5);
                        cell.setCellValue(medicine.getType());
                        cell.setCellStyle(style);
                   }
                    if( medicine.getStatus() != null){
                        cell = row.createCell(6);
                        cell.setCellValue(medicine.getStatus());
                        cell.setCellStyle(style);
                   }
                    if( medicine.getManufacturer().getNumber() != null){
                        cell = row.createCell(7);
                        cell.setCellValue(medicine.getManufacturer().getNumber());
                        cell.setCellStyle(style);
                   }
                }
               
            }
           
        } catch (Exception e) {
            e.printStackTrace();
        }
       
  
        HttpServletResponse response = null;//创建一个HttpServletResponse对象
        OutputStream out = null;//创建一个输出流对象
        try {
            response = ServletActionContext.getResponse();//初始化HttpServletResponse对象
            out = response.getOutputStream();
          
            String headerStr =new String("medicines");
            headerStr = new String(headerStr.getBytes("gb2312"), "ISO8859-1");//headerString为中文时转码
            response.setHeader("Content-disposition","attachment; filename="+ headerStr +".xls");//filename是下载的xls的名，建议最好用英文
            response.setContentType("application/msexcel;charset=UTF-8");//设置类型
            response.setHeader("Pragma","No-cache");//设置头
            response.setHeader("Cache-Control","no-cache");//设置头
            response.setDateHeader("Expires", 0);//设置日期头
            workbook.write(out);
            out.flush();
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
        	try {
        		if (out != null) {
        			out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
        
        return null;	//设置为null，不将其交由sturts2管理.就不会报异常了，不然报OutputStream() has already been called for this response 错误 
	}
		
	//采购单列表查询
	public String purchase_search(){
		System.out.println(orderDto);
		
		this.pageBean = healthBureauService.searchOrders(orderDto, 5, page, 100);
		session.put("pageBean", pageBean);
		
		return "forward";
	}
	
	//采购单维护(显示全部订单)
	public String purchase_maintain(){
		
		this.pageBean = healthBureauService.searchOrders(orderDto, 5, page, 100);
		
		searchOrderItems();
		
		session.put("pageBean", pageBean);
		
		return "forward";
	}
	
	//查询采购单的订单项
	public String searchOrderItems(){
		System.out.println(orderItemDto);
		session.remove("orderItems");
		
		Order order = new Order();
		
		order = (Order) healthBureauService.searchOrderItems(orderItemDto, 5, page).get(0);
		this.orderItems = (PageBean) (healthBureauService.searchOrderItems(orderItemDto, 5, page)).get(1);
		
		System.out.println(orderItems);
		
		session.put("order", order);
		session.put("orderItems", orderItems);
		
		return "forward";
	}
	
	//每个订单被点击修改后所需要做的单个查询
		public void order_search_maintain() throws IOException{
			System.out.println(orderDto);
			
			Order order = healthBureauService.searchSingleOrderById(orderDto.getId());
			
			String m = ""+order.getId();			//m存储着所要修改的单个订单的数据，这些数据将返回jsp页面
			m+= ","+order.getHospital().getId();
			m+= ","+order.getOrderTime();
			m+= ","+order.getAmount();
			m+= ","+order.getReturnTime();
			m+= ","+order.getReturnReason();
			m+= ","+order.getStatus();
			System.out.println(m);
				
			ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
			PrintWriter out = ServletActionContext.getResponse().getWriter();
				
			out.write(m);
			out.flush();
			out.close();
		}
	
	//单个订单修改
	public String updateOrder(){
		healthBureauService.txupdateOrder(orderDto);
		
		return "forward";
	}
	
	//单个订单修改(退货单的修改)
	public String updateOrder_back(){
		healthBureauService.txupdateOrder(orderDto);
		
		return "forward";
	}
	
	//单个订单只修改采购状态
		public String updateOrder_status(){
			
			healthBureauService.txupdateOrder_status(orderDto);
			
			return "forward";
		}
	
	//删除单个药品
	public String deleteOrderById(){
		System.out.println(orderDto.getId());
		
		healthBureauService.txdeleteOrderById(orderDto);
		
		return "forward";
	}
	
	//采购单审核
	public String purchase_ratify(){
		
		this.pageBean = healthBureauService.searchOrders(orderDto, 5, page, 10);
		session.put("pageBean", pageBean);
		
		return "forward";
	}
	

	//采购单入库
	public String purchase_put(){
		
		this.pageBean = healthBureauService.searchOrders(orderDto, 5, page, 20);
		session.put("pageBean", pageBean);
		
		return "forward";
	}
	
	//退货单维护
	public String back_maintain(){
		
		this.pageBean = healthBureauService.searchOrders(orderDto, 5, page, 30);
		session.put("pageBean", pageBean);
		
		return "forward";
	}
	
	//退货单审核
	public String back_ratify(){
		
		this.pageBean = healthBureauService.searchOrders(orderDto, 5, page, 40);
		session.put("pageBean", pageBean);
		
		return "forward";
	}
		
	//退货单列表查询
	public String back_search(){
		
		this.pageBean = healthBureauService.searchOrders(orderDto, 5, page, 30);
		session.put("pageBean", pageBean);
		
		return "forward";
	}

	public List<Medicine> getMedicines() {
		return medicines;
	}
	
	public void setMedicines(List<Medicine> medicines) {
		this.medicines = medicines;
	}
	
	@Override
	public void setApplication(Map<String, Object> arg0) {
		this.application = arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	
	public healthBureauService getHealthBureauService() {
		return healthBureauService;
	}
	
	public void setHealthBureauService(healthBureauService healthBureauService) {
		this.healthBureauService = healthBureauService;
	}
	
	public HealthBureauDto getHealthBureauDto() {
		return healthBureauDto;
	}
	
	public void setHealthBureauDto(HealthBureauDto healthBureauDto) {
		this.healthBureauDto = healthBureauDto;
	}
	
	public MedicineDto getMedicineDto() {
		return medicineDto;
	}

	public void setMedicineDto(MedicineDto medicineDto) {
		this.medicineDto = medicineDto;
	}
	
	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public OrderDto getOrderDto() {
		return orderDto;
	}

	public void setOrderDto(OrderDto orderDto) {
		this.orderDto = orderDto;
	}

	public File getExcelFile() {
		return excelFile;
	}

	public void setExcelFile(File excelFile) {
		this.excelFile = excelFile;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public PageBean getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(PageBean orderItems) {
		this.orderItems = orderItems;
	}

	public OrderItemDto getOrderItemDto() {
		return orderItemDto;
	}

	public void setOrderItemDto(OrderItemDto orderItemDto) {
		this.orderItemDto = orderItemDto;
	}
	
}
