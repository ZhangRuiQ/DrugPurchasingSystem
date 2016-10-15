package com.demo.action.hospital;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.domain.OrderItem;
import com.common.dto.HospitalDto;
import com.common.dto.MedicineDto;
import com.common.dto.OrderDto;
import com.common.dto.OrderItemDto;
import com.common.util.HardCodeParsing;
import com.demo.dto.hospital.DownloadInformation;
import com.demo.dto.hospital.MedicineSearchCondition;
import com.demo.dto.hospital.OrderSearchCondition;
import com.demo.service.hospital.IHospitalService;
import com.opensymphony.xwork2.ActionSupport;

public class HospitalAction extends BaseHospitalAction  {
	
	
	//修改密码页面------------------------------------------------
	public String input_modify_passwd(){
		
		return "inputJsp";
	}
	//修改密码
	public String modifyPasswd() throws IOException {
		HospitalDto dto = (HospitalDto) this.getSession().getAttribute("hospital");
		String id = dto.getId();
		ServletActionContext.getResponse().setContentType(
				"text/html ; charset=UTF-8");
		PrintWriter out = ServletActionContext.getResponse().getWriter();

		if (this.getNewPasswd().equals(this.getNewPasswdAgain())) {

			if (this.getHospitalService().txModifyPasswd(id, this.getNewPasswd(), this.getOldPasswd())) {
				out.write("密码修改成功");

			} else {
				out.write("密码修改失败");

			}

		} else {
			out.write("密码修改失败");

		}
		out.flush();
		out.close();
		return null;
	}
	//操作手册页面------------------------------------------------
	//操作手册下载
	public String downloadBrochure() throws Exception{
		String fle=new String("医疗机构操作手册.docx".getBytes("UTF-8"),"ISO8859-1");
		String  fileAbsolutePath=	this.getApplication().getRealPath("hospital/dowdLoadFile/医疗机构操作手册.docx");
		String fileRelativePath=new File(fileAbsolutePath).getAbsolutePath();
		this.setDownloadInformation(new DownloadInformation(fle,this.getApplication().getMimeType("医疗机构操作手册.docx")));
	this.getHospitalService().createAndDownloadBrochure(fileRelativePath);
	InputStream ins=new FileInputStream(fileRelativePath);
	this.getDownloadInformation().setInputStream(ins);
		return SUCCESS;
		
	}
//---------------------------------------------------------药品页面------------------------------
	// ajax药品目录条件加载
	public String ajax_medicine_search() throws IllegalAccessException,
			InvocationTargetException, IOException {
		// 当page=0证明点击了查询按钮（即是改变的条件）
		if (this.getPage() == 0) {
			this.getSession().setAttribute("medicineSearchCondition", this.getCondition());
			this.setPage(1);
			this.getSession().setAttribute("PageCount",
					this.getHospitalService().PageCountByCondition(this.getCondition()));
		}

		MedicineSearchCondition conditionInSession = (MedicineSearchCondition) 
				this.getSession().getAttribute("medicineSearchCondition");
		List<Medicine> li;

//		if (conditionInSession == null) {
//			// 点击菜单栏的药品查询按钮的时候，condition为null
//			li = this.getHospitalService().loadMedicines(null,this.getPage());
//		} else {
			li = this.getHospitalService().loadMedicines(conditionInSession, this.getPage());
//		}
		StringBuilder strb;
		if (li.size() == 0) {
			strb = new StringBuilder("无");
		} else {
			strb = new StringBuilder("有");

		}
		strb.append(this.getSession().getAttribute("PageCount"));

		strb.append("=");
		strb.append("+");
		for (int i = 0; i < li.size(); i++) {
			Medicine m = li.get(i);
			strb.append(m.getNumber());
			strb.append("·");
			strb.append(m.getName());
			strb.append("·");
			strb.append(m.getManufacturer().getName());
			strb.append("·");
			strb.append(m.getType());
			strb.append("·");
			strb.append(m.getStandard());
			strb.append("·");
			strb.append(m.getStockBalance());
			strb.append("·");
			strb.append(m.getPrice());
			strb.append("·");
			strb.append(HardCodeParsing.parseMedicineStatus(Integer.parseInt(m.getStatus())));
			if ((i + 1) != li.size()) {
				strb.append("|");
			}

		}
		strb.append("+");
		this.getResponse().setContentType("text/html; charset=UTF-8");

		PrintWriter writer = this.getResponse().getWriter();
		writer.write(strb.toString());
		writer.flush();

		return null;
	}

	
	
	// 药品目录加载<c:url value='/hospital/jump_medicine_search.action' />无任何条件
	public String medicine_search() throws IllegalAccessException,
			InvocationTargetException {
		// 通过该页面点击的情况condition为null
		List<String> str = this.getHospitalService().loadTypeByMedicine();
		this.getSession().setAttribute("medicineType", str);
		this.getSession().setAttribute("PageCount", this.getHospitalService().PageCountByCondition(null));
		List<Medicine> li = this.getHospitalService().loadMedicines(null,1);
		this.setMedicineDtoList(new ArrayList<MedicineDto>());
		for (int i = 0; i < li.size(); i++) {
			MedicineDto mdto = new MedicineDto();
			BeanUtils.copyProperties(mdto, li.get(i));
			mdto.setStock_Balance(((Medicine)li.get(i)).getStockBalance());
			BeanUtils.copyProperties(mdto.getManufacturer(), li.get(i)
					.getManufacturer());
			mdto.setStatus(HardCodeParsing.parseMedicineStatus(Integer.parseInt(mdto.getStatus())));
			this.getMedicineDtoList().add(mdto);
			// 初始化session中的medicineSearchCondition
			this.setCondition(new MedicineSearchCondition("", "", "asc", "", "3", "0")); 
			this.getSession().setAttribute("medicineSearchCondition", this.getCondition());
	
		}
	
		return "forword";
	}
	//药品目录下载
	public String downloadMedicine() throws Exception{
		String  fileAbsolutePath=	this.getApplication().getRealPath("hospital/dowdLoadFile/药品目录.xlsx");
		String fle=new String("药品目录.xlsx".getBytes("UTF-8"),"ISO8859-1");
		this.setDownloadInformation(new DownloadInformation(fle,this.getApplication().getMimeType("药品目录.xlsx")));
		String fileRelativePath=new File(fileAbsolutePath).getAbsolutePath();
	this.getHospitalService().createAndDownloadMedicineFile(fileRelativePath);
	InputStream ins=new FileInputStream(fileRelativePath);
	this.getDownloadInformation().setInputStream(ins);
		return SUCCESS;
		
		
	}
	//药品页面采购单创建
	public String ajax_purchase_new() throws IOException{
		String[] medicineArray=this.getMedicineIdStr().split("·");
		boolean b=false;
		HospitalDto hospital= (HospitalDto) this.getSession().getAttribute("hospital");
		this.getResponse().setContentType("text/html; charset=UTF-8");
		PrintWriter writer = this.getResponse().getWriter();
		
		this.getHospitalService().txajax_purchase_new(medicineArray,hospital.getId());
		b=true;
		if(b==true)writer.write("1");
		else{
			
			writer.write("2");
		}
		

		return null;
		
	}

	
//采购单创建页面---------------------------------------------------------------------------------------	
	
	//采购单创建
	public String purchase_new() throws IllegalAccessException, InvocationTargetException{
	String hid=	((HospitalDto)this.getSession().getAttribute("hospital")).getId();
		Order o=this.getHospitalService().load_purchase_new(hid);
		if(o==null){
			this.setOrderDto(new OrderDto());
			this.getOrderDto().setAmount(0);
			this.getOrderDto().setHospitalId("");
			this.getOrderDto().setId("");
		}
		else{
			this.setOrderDto(new OrderDto());
			BeanUtils.copyProperties(this.getOrderDto(), o);
			this.getOrderDto().setReturn_Reason("");
			this.getOrderDto().setReturn_Time("");
			this.getOrderDto().setOrder_Time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getOrderTime()));
			this.getOrderDto().setHospitalId(hid);
			this.getOrderDto().setAmount(o.getAmount());
			this.setOrderItemDtoList(new ArrayList<OrderItemDto>());
			for(OrderItem oit:o.getOrderItems()){
				OrderItemDto orderItemDto=new OrderItemDto();
				BeanUtils.copyProperties(orderItemDto, oit);
				this.getOrderItemDtoList().add(orderItemDto);
				
			}
		}
		
		return "forword";
	}
	//对状态为0的采购单的保存或者提交
	public void ajax_update_purchase_status_0() throws IOException {
		String hid = ((HospitalDto) this.getSession().getAttribute("hospital")).getId();
		this.getResponse().setContentType("text/html; charset=UTF-8");
		PrintWriter writer = this.getResponse().getWriter();
		List<String> orderItem_id_list = new ArrayList<String>();
		List<Integer> orderItem_number = new ArrayList<Integer>();
		int changeStatus;
		String information_date = "";
		// 删除所有订单项的情况
		if (this.getPurchase_new_jsp_information().equals("0")|| this.getPurchase_new_jsp_information().equals("10")) {
			changeStatus = Integer.parseInt(this.getPurchase_new_jsp_information());
			this.getHospitalService().txupdateOrder(hid, orderItem_id_list,orderItem_number, changeStatus,null);
			information_date = "订单已被删除";
		} else {
			changeStatus = Integer.parseInt(this.getPurchase_new_jsp_information().substring(0, this.getPurchase_new_jsp_information().indexOf("=")));
			this.setPurchase_new_jsp_information(this.getPurchase_new_jsp_information().substring(this.getPurchase_new_jsp_information().indexOf("=") + 1));
			String[] info = this.getPurchase_new_jsp_information().split("·");

			for (int i = 0; i < info.length; i++) {
				int index = info[i].indexOf("@");
				orderItem_id_list.add(info[i].substring(0, index));
				orderItem_number.add(Integer.parseInt(info[i]
						.substring(index + 1)));
				
			}
			if (changeStatus == 10) {
				information_date = "提交失败";

			} else if (changeStatus == 0) {
				information_date = "保存失败";
			}

			
			this.getHospitalService().txupdateOrder(hid, orderItem_id_list,orderItem_number, changeStatus,null);

			if (changeStatus == 10) {
				information_date = "提交成功";

			} else if (changeStatus == 0) {
				information_date = "保存成功";
			}
		}
		writer.print(information_date);

		writer.flush();

	}
	//采购单列表------------------------------------------------------------------------
		//默认条件加载订单第一页
	public String purchase_search() throws ParseException, IllegalAccessException, InvocationTargetException{
		//初始化条件
		String hid=	((HospitalDto)this.getSession().getAttribute("hospital")).getId();
		OrderSearchCondition orderSearchCondition=new OrderSearchCondition();
			this.getSession().setAttribute("orderSearchCondition", orderSearchCondition);
			this.getSession().setAttribute("orderPageCount",
					this.getHospitalService().PageCountByOrder(hid, orderSearchCondition));
		
			List<Order> li=this.getHospitalService().loadPurchaseOrder(hid, orderSearchCondition,true, 1);
		
			List<OrderDto> orderDtoList=new ArrayList<OrderDto>();
			for(Order o:li){
				OrderDto dto=new OrderDto();
				BeanUtils.copyProperties(dto, o);
					dto.setReturn_Reason("");
				if(o.getReturnTime()==null){
					dto.setReturn_Time("");
				}
				else{
					dto.setReturn_Time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getReturnTime()));
				}		
				dto.setOrder_Time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getOrderTime()));
				dto.setHospitalId(hid);
				
				orderDtoList.add(dto);
				
			}
			this.setOrderDtoList(orderDtoList);
			
			return "forword";
		}
	//采购单列表分页加载和 查询按钮
	public String ajax_purchase_search() throws ParseException, IOException{
		
			
			
		
		
		OrderSearchCondition orderSearchCondition;
		String hid=	((HospitalDto)this.getSession().getAttribute("hospital")).getId();
		// 当page=0证明点击了查询按钮（即是改变的条件）
				if (this.getPage() == 0) {
					this.getSession().setAttribute("orderSearchCondition", this.getOrderSearchCondition());
					this.setPage(1);
					this.getSession().setAttribute("orderPageCount",
							this.getHospitalService().PageCountByOrder(hid, this.getOrderSearchCondition()));
				}

				 orderSearchCondition = (OrderSearchCondition) 
						this.getSession().getAttribute("orderSearchCondition");
				List<Order> li=this.getHospitalService().loadPurchaseOrder(hid, orderSearchCondition, true, this.getPage());
				StringBuilder strb;
				if (li.size() == 0) {
					strb = new StringBuilder("无");
				} else {
					strb = new StringBuilder("有");

				}
				strb.append(this.getSession().getAttribute("orderPageCount"));

				strb.append("=");
				strb.append("+");
				for (int i = 0; i < li.size(); i++) {
					Order o = li.get(i);
					strb.append(o.getId());
					strb.append("·");
					strb.append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getOrderTime()));
					strb.append("·");
					strb.append(o.getAmount());
					strb.append("·");
					strb.append(o.getStatus());
					strb.append("·");
					if(o.getReturnTime()==null){
						strb.append(" ");
					}
					else{
						strb.append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getReturnTime()));
					}			
					if ((i + 1) != li.size()) {
						strb.append("|");
					}

				}
				strb.append("+");
				this.getResponse().setContentType("text/html; charset=UTF-8");

				PrintWriter writer = this.getResponse().getWriter();
				writer.write(strb.toString());
				writer.flush();

				return null;
	}
	//下载订单列表
	public String downloadPurchase() throws Exception{
		String fle=new String("订单列表.xlsx".getBytes("UTF-8"),"ISO8859-1");
		String  fileAbsolutePath=	this.getApplication().getRealPath("hospital/dowdLoadFile/订单列表.xlsx");
		String fileRelativePath=new File(fileAbsolutePath).getAbsolutePath();
		this.setDownloadInformation(new DownloadInformation(fle,this.getApplication().getMimeType("订单列表.xlsx")));
		OrderSearchCondition orderSearchCondition=(OrderSearchCondition) this.getSession().getAttribute("orderSearchCondition");
		HospitalDto h=	(HospitalDto)this.getSession().getAttribute("hospital");
	this.getHospitalService().createAndDownloadPurchase(h,fileRelativePath,orderSearchCondition);
	InputStream ins=new FileInputStream(fileRelativePath);
	this.getDownloadInformation().setInputStream(ins);
		return SUCCESS;
		
	}
	
					//采购单列表之查看页面(模态框)------------------------------------------------------------
	//采购单列表之查看页面的进入(模态框)
	public String purchase_maintain() throws IllegalAccessException, InvocationTargetException{
	     
	          

		
		Order o=this.getHospitalService().loadOrder(this.getOrderDto().getId());	
		this.getSession().setAttribute("orderItemPageCount",this.getHospitalService().PageCountByOrderItem(this.getOrderDto().getId()));
		this.setOrderDto(null);
		OrderDto odto=new OrderDto();
		if(o==null){
			return "forword";
		}
		BeanUtils.copyProperties(odto, o);
		if(o.getReturnReason()==null){
			odto.setReturn_Reason("");
		}
		else{
			odto.setReturn_Reason(o.getReturnReason());
		}
		if(o.getReturnTime()==null){
			odto.setReturn_Time("");
		}
		else{
			odto.setReturn_Time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getReturnTime()));
		}		
		odto.setOrder_Time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getOrderTime()));
		this.setOrderDto(odto);
		this.setOrderItemDtoList(new ArrayList<OrderItemDto>());
	if(o.getStatus()==0||o.getStatus()==10){
		for(OrderItem oi:o.getOrderItems()){
			OrderItemDto orderItemDto=new OrderItemDto();
			BeanUtils.copyProperties(orderItemDto, oi);
			orderItemDto.setMedicine(oi.getMedicine());
			this.getOrderItemDtoList().add(orderItemDto);
		}
		}
		else{
			if(this.getPage()==0){
				this.setPage(1);
			}
			List<OrderItem> orderItemList=this.getHospitalService().load_order_item(this.getOrderDto().getId(),1);
			for(OrderItem oi:orderItemList){
				OrderItemDto orderItemDto=new OrderItemDto();
				BeanUtils.copyProperties(orderItemDto, oi);
				orderItemDto.setMedicine(oi.getMedicine());
				this.getOrderItemDtoList().add(orderItemDto);
			}
		}
		
		return "forword";
	}
	
	
	//分页查询订单项（订单状态非10和0的时候【这两种状态则在第一次进入查看页面(模态框)的时候全部订单项加载并呈现】）
	public void ajax_load_orderItem() throws IOException{
	StringBuilder strb=new StringBuilder();
		List<OrderItem> li=	this.getHospitalService().load_order_item(this.getOrderDto().getId(), this.getPage());
		for(OrderItem oi:li){
			strb.append(oi.getMedicine().getName()+"·");
			strb.append(oi.getMedicine().getNumber()+"·");
			strb.append(oi.getMedicine().getPrice()+"·");
			strb.append(oi.getNumber()+"·");
			strb.append(oi.getAmount()+"|");
			
		}
		this.getResponse().setContentType("text/html; charset=UTF-8");
		PrintWriter writer = this.getResponse().getWriter();
		writer.write(strb.toString().substring(0, strb.length()-1));
	}
	
	//采购单列表之查看页面（模态框）之修改或者提交订单按钮的实现
	public void ajax_update_purchase() throws IOException {
		String hid = ((HospitalDto) this.getSession().getAttribute("hospital")).getId();
		this.getResponse().setContentType("text/html; charset=UTF-8");
		PrintWriter writer = this.getResponse().getWriter();
		List<String> orderItem_id_list = new ArrayList<String>();
		List<Integer> orderItem_number = new ArrayList<Integer>();
		int changeStatus;
		String orderId=null;//当订单为10的时候，修改订单需要此参数
		String information_date = "";
		// 当订单状态为0的时候，提交或者保存空订单的时候（删除所有订单项的情况）
		if (this.getPurchase_maintain_jsp_information().equals("0")|| this.getPurchase_maintain_jsp_information().equals("10")) {
			changeStatus = Integer.parseInt(this.getPurchase_maintain_jsp_information());
			this.getHospitalService().txupdateOrder(hid, orderItem_id_list,orderItem_number, changeStatus,null);
			information_date = "订单已删除";
			}
		//当订单状态为10的时候，修改为空订单的时候（删除所有订单项的情况）
		else if(Integer.parseInt(this.getPurchase_maintain_jsp_information().substring(0, this.getPurchase_maintain_jsp_information().indexOf("=")))==101&&this.getPurchase_maintain_jsp_information().charAt(this.getPurchase_maintain_jsp_information().indexOf("=")+1)=='*'){
			changeStatus=10;
			orderId=this.getPurchase_maintain_jsp_information().substring(this.getPurchase_maintain_jsp_information().indexOf("*")+1);
			this.getHospitalService().txupdateOrder(hid, orderItem_id_list,orderItem_number, changeStatus,orderId);
				information_date = "订单已删除";
		}
		//提交或者保存的订单不为空
		else {
			
			
			changeStatus=Integer.parseInt(this.getPurchase_maintain_jsp_information().substring(0, this.getPurchase_maintain_jsp_information().indexOf("=")));
			//订单为10的状态，需要提取出Order的id值
			if(changeStatus==101)	
			{			
				orderId=this.getPurchase_maintain_jsp_information().substring(this.getPurchase_maintain_jsp_information().indexOf("*")+1);
			
					changeStatus=10;
					this.setPurchase_maintain_jsp_information(this.getPurchase_maintain_jsp_information().substring(0,this.getPurchase_maintain_jsp_information().indexOf("*")));
					
			}
		
			this.setPurchase_maintain_jsp_information(this.getPurchase_maintain_jsp_information().substring(this.getPurchase_maintain_jsp_information().indexOf("=") + 1));
			String[] info = this.getPurchase_maintain_jsp_information().split("·");

			for (int i = 0; i < info.length; i++) {
				int index = info[i].indexOf("@");
				orderItem_id_list.add(info[i].substring(0, index));
				orderItem_number.add(Integer.parseInt(info[i]
						.substring(index + 1)));

			}
			if (changeStatus == 10) {
				information_date = "提交失败";

			} else if (changeStatus == 0) {
				information_date = "保存失败";
			}
			
			this.getHospitalService().txupdateOrder(hid, orderItem_id_list,orderItem_number, changeStatus,orderId);

			if (changeStatus == 10) {
				information_date = "提交成功";

			} else if (changeStatus == 0) {
				information_date = "保存成功";
			}
		}
		writer.print(information_date);

		writer.flush();

	}
	
	
	
	
	
	
	//采购单列表之退货页面(模态框)------------------------------------------------------------
			//采购单列表之退货页面（模态框）之进入
			public String back_new() throws IllegalAccessException, InvocationTargetException{
				Order o=this.getHospitalService().loadOrder(this.getOrderDto().getId());	
				this.getSession().setAttribute("orderItemPageCount",this.getHospitalService().PageCountByOrderItem(this.getOrderDto().getId()));
				this.setOrderDto(null);
				if(o.getStatus()>=60){
					return "forword";
				}
				
				OrderDto odto=new OrderDto();
				BeanUtils.copyProperties(odto, o);
				if(o.getReturnReason()==null){
					odto.setReturn_Reason("");
				}
				else{
					odto.setReturn_Reason(o.getReturnReason());
				}
				if(o.getReturnTime()==null){
					odto.setReturn_Time("");
				}
				else{
					odto.setReturn_Time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getReturnTime()));
				}		
				odto.setOrder_Time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getOrderTime()));
				this.setOrderDto(odto);
				this.setOrderItemDtoList(new ArrayList<OrderItemDto>());
				List<OrderItem> orderItemList= this.getHospitalService().load_order_item(o.getId(), 1);
				for(OrderItem oi:orderItemList){
					OrderItemDto orderItemDto=new OrderItemDto();
					BeanUtils.copyProperties(orderItemDto, oi);
					orderItemDto.setMedicine(oi.getMedicine());
					this.getOrderItemDtoList().add(orderItemDto);
				}
				
				return "forword";
			}
		
		
			//分页查询订单项（订单状态非10和0的时候【这两种状态则在第一次进入查看页面(模态框)的时候全部订单项加载并呈现】）
			public void ajax_load_back_new() throws IOException{
			StringBuilder strb=new StringBuilder();
				List<OrderItem> li=	this.getHospitalService().load_order_item(this.getOrderDto().getId(), this.getPage());
				for(OrderItem oi:li){
					strb.append(oi.getMedicine().getName()+"·");
					strb.append(oi.getMedicine().getNumber()+"·");
					strb.append(oi.getMedicine().getPrice()+"·");
					strb.append(oi.getNumber()+"·");
					strb.append(oi.getAmount()+"|");
					
				}
				this.getResponse().setContentType("text/html; charset=UTF-8");
				PrintWriter writer = this.getResponse().getWriter();
				writer.write(strb.toString().substring(0, strb.length()-1));
			}
			//订单退货
			public void ajax_return_order() throws IOException{
				this.getResponse().setContentType("text/html; charset=UTF-8");
				PrintWriter writer = this.getResponse().getWriter();
				String information="";
				Order o=this.getHospitalService().loadOrder(this.getOrderDto().getId());
				if(o.getStatus()>=60){
					information="订单已退货";
				}
				else{
					if(this.getOrderDto().getReturn_Reason().trim().length()==0){
						information="请填写退货原因";
					}
					else{
						
					
						o.setReturnReason(this.getOrderDto().getReturn_Reason());
						o.setReturnTime(new Date());
						o.setStatus(60);
						this.getHospitalService().txReturnOrder(o);
						information="申请退货成功";
						}
					}
				writer.print(information);
				return;
			}
			
	//采购单入库页面----------------------------------------------------------------
			
			//采购单入库页面进入
	public String purchase_put() throws ParseException, IllegalAccessException, InvocationTargetException{
		//初始化条件
		String hid=	((HospitalDto)this.getSession().getAttribute("hospital")).getId();
		String date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		OrderSearchCondition orderSearchCondition=new OrderSearchCondition("",date+" 00:00:00",date+" 23:59:59","asc",3);

			this.getSession().setAttribute("orderSearchCondition", orderSearchCondition);
			this.getSession().setAttribute("orderPageCount",
					this.getHospitalService().PageCountByOrder(hid, orderSearchCondition));
		
			List<Order> li=this.getHospitalService().loadPurchaseOrder(hid, (OrderSearchCondition) this.getSession().getAttribute("orderSearchCondition"), true, 1);
		
			List<OrderDto> orderDtoList=new ArrayList<OrderDto>();
			for(Order o:li){
				OrderDto dto=new OrderDto();
				BeanUtils.copyProperties(dto, o);
					dto.setReturn_Reason("");
				if(o.getReturnTime()==null){
					dto.setReturn_Time("");
				}
				else{
					dto.setReturn_Time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getReturnTime()));
				}		
				dto.setOrder_Time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getOrderTime()));
				dto.setHospitalId(hid);
				
				orderDtoList.add(dto);
				
			}
			this.setOrderDtoList(orderDtoList);
			
			return "forword";
		}
			
			
	//采购单入库页面之分页查找
	public void ajax_purchase_put_search() throws ParseException, IOException{
		HospitalDto h=(HospitalDto) this.getSession().getAttribute("hospital");
		// 当page=0证明点击了查询按钮（即是改变的条件）
	
				if (this.getPage() == 0) {
					this.getSession().setAttribute("orderSearchCondition", this.getOrderSearchCondition());
					this.setPage(1);
					this.getSession().setAttribute("orderPageCount",
							this.getHospitalService().PageCountByOrder(h.getId(),this.getOrderSearchCondition()));
				}

				OrderSearchCondition conditionInSession = (OrderSearchCondition) 
						this.getSession().getAttribute("orderSearchCondition");
				List<Order> li;
			
			
					li = this.getHospitalService().loadPurchaseOrder(h.getId(), conditionInSession, true,this.getPage());		
				StringBuilder strb;
				if (li.size() == 0) {
					strb = new StringBuilder("无");
				} else {
					strb = new StringBuilder("有");

				}
				strb.append(this.getSession().getAttribute("orderPageCount"));

				strb.append("=");
				strb.append("+");
				for (int i = 0; i < li.size(); i++) {
					Order o = li.get(i);
					strb.append(o.getId());
					strb.append("·");
					strb.append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getOrderTime()));
					strb.append("·");
					strb.append(o.getAmount());
					strb.append("·");
					strb.append(o.getStatus());
					strb.append("·");
					if(o.getReturnTime()==null){
						strb.append(" ");
					}
					else{
						strb.append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(o.getReturnTime()));
						
					}
						if ((i + 1) != li.size()) {
						strb.append("|");
					}

				}
				strb.append("+");
				this.getResponse().setContentType("text/html; charset=UTF-8");

				PrintWriter writer = this.getResponse().getWriter();
				writer.write(strb.toString());
				writer.flush();
			}

		
		//操作采购单入库
	public void ajax_purchase_put() throws IOException{
		this.getResponse().setContentType("text/html; charset=UTF-8");
		PrintWriter writer = this.getResponse().getWriter();
		
		boolean b=false;
	String[] str=	this.getPurchase_put_jsp_information().split("·");
	List<String> strli=new ArrayList<String>();
	for(String s:str){
		strli.add(s);
		System.out.println(s);
	}
		this.getHospitalService().txPutOrder(strli);
		b=true;
		if(b==true)writer.write("1");
		else{
			
			writer.write("2");
		}
	}
		
		
	
		
	
	
		
	
	
	
	
	

}
