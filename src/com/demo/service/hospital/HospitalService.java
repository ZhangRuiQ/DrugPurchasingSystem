package com.demo.service.hospital;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.record.chart.BeginRecord;

import com.common.domain.Hospital;
import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.domain.OrderItem;
import com.common.dto.HospitalDto;
import com.common.dto.OrderDto;
import com.common.util.HardCodeParsing;
import com.common.util.StringPackExcel;
import com.demo.dao.hospital.IHospitalDao;
import com.demo.dto.hospital.MedicineSearchCondition;
import com.demo.dto.hospital.OrderSearchCondition;

public class HospitalService implements IHospitalService {
	private IHospitalDao hospitalDao;

	//-----------------------------------------------修改密码-------------------------------------------------
	// tx为前缀，开启事务进行修改密码操作
	@Override
	public Boolean txModifyPasswd(String id, String newPasswd, String oldPasswd) {
		// TODO Auto-generated method stub
		Hospital hospital = hospitalDao.findObjectWithId(Hospital.class,id);
		if (hospital.getPasswd().equals(oldPasswd)) {
			hospital.setPasswd(newPasswd);
			hospitalDao.updateObject(hospital);

			return Boolean.TRUE;
		} else {
			return Boolean.FALSE;
		}

	}

	//---------------------------------------------药品目录页面----------------------------------
	// 
	// 有条件查看总页数,无条件则参数传入null
	@Override
	public int PageCountByCondition(MedicineSearchCondition conditian) {
		return hospitalDao.PageCountMedicineWithCondition(conditian);
	}

	// 药品类型查询
	@Override
	public List<String> loadTypeByMedicine() {
		return hospitalDao.findAllTypeByMedicine();
	}

	// 药品目录加载
	@Override
	public List<Medicine> loadMedicines(MedicineSearchCondition condition,
			int page) {

		return hospitalDao.findMedicineWithcondition(condition, page);

	}

	// ajax药品文件生成
	// 将文件生成。
	@Override
	public void createAndDownloadMedicineFile(String fileName) throws Exception {
		List<Medicine> medicineList = hospitalDao.findAllObject(Medicine.class, "price", "asc");
		List<List<String>> li = new ArrayList<List<String>>();
		for (int i = 0; i < medicineList.size(); i++) {
			List<String> strList = new ArrayList<String>();
			strList.add(medicineList.get(i).getNumber());
			strList.add(medicineList.get(i).getName());
			strList.add(medicineList.get(i).getType());
			strList.add(medicineList.get(i).getStandard());
			strList.add(medicineList.get(i).getStockBalance());
			strList.add("" + medicineList.get(i).getPrice());
			strList.add(medicineList.get(i).getStatus());
			strList.add(medicineList.get(i).getManufacturer().getName());
			strList.add(medicineList.get(i).getManufacturer().getPhone());
			strList.add(medicineList.get(i).getManufacturer().getAddress());
			li.add(strList);
		}
		new StringPackExcel().deleteSheet(fileName, 0, 8);
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy/MM/dd HH:mm:ss");
		String timestr = "时间：" + dateFormat.format(new Date());
		new StringPackExcel().Excel(timestr, fileName, 0, 4, 0);
		new StringPackExcel().Excel(li, fileName, 0, 8, 0);

	}
	//ajax
	
	//采购单创建（在药品目录页面点击加入购物单）
	@Override
	public void txajax_purchase_new(String[] medicine_id_array,String hid){
	
		hospitalDao.new_order(medicine_id_array,hospitalDao.findObjectWithId(Hospital.class, hid));
		
	}
	
	//---------------------------------------------采购单创建页面----------------------------------
	
	
	
		//采购单创建页面加载
		@Override
		public Order load_purchase_new(String hid){
			Hospital h=hospitalDao.findObjectWithId(Hospital.class,hid);
			List<Order> oi=hospitalDao.isOrderWithStatus(h, 0);
			if(oi.size()==0){
				return null;
			}
			return oi.get(0);
			
		}
		//加载某个采购单的订单项(分页)
		@Override
		public List<OrderItem> load_order_item(String orderId, int page){
			return hospitalDao.findOrderItemWithOrderId(orderId, page);
		}
		//计算某个采购单的订单项的页数
		@Override
		public int PageCountByOrderItem(String orderId){
			return hospitalDao.PageCountOrderItemWithOrderId(orderId);
		}
		//分页查看采购单订单项的页数
		@Override
		public int PageCountByOrder(String hid,OrderSearchCondition orderCondition) throws ParseException{
			return hospitalDao.pageCountOrderWithCondition(hid, orderCondition);
		}
	
		//更新(只对订单项进行删减或者增加单品数量)订单
		@Override
		public void txupdateOrder(String hid,List<String> orderItem_id_list,List<Integer> orderItem_number,int changeStatus,String orderId){
			Hospital h=hospitalDao.findObjectWithId(Hospital.class,hid);
			Order o;
			if(orderId==null)
			{
				o=	hospitalDao.isOrderWithStatus(h, 0).get(0);
			}
			else{
				o=hospitalDao.findObjectWithId(Order.class, orderId);
			}
		
		if(orderItem_id_list.size()==0){ 
			hospitalDao.deleteObject(o);
			return;
		}
		
		List<OrderItem> orderItemList=hospitalDao.findObjectListByIdList(OrderItem.class,orderItem_id_list);		
		//找到要删除的订单项，并且删除
		List<OrderItem> deleteOrderItemList=new ArrayList<OrderItem>();
		for(OrderItem oi: o.getOrderItems()){
			int plag=0;
			for(int i=0;i<orderItem_id_list.size();i++){
				if(oi.getId().equals(orderItem_id_list.get(i))){ plag=1;continue;}
			}
			if(plag==0){
				deleteOrderItemList.add(oi);
			}	
		}
		for(OrderItem deleteOI: deleteOrderItemList){
			hospitalDao.deleteObject(deleteOI);
			
		}
		
		
			
		double amount=0;
		for(int i=0;i<orderItemList.size();i++){
			
			OrderItem oi=orderItemList.get(i);
	
			oi.setNumber(orderItem_number.get(i));
			oi.setAmount(oi.getMedicine().getPrice()*oi.getNumber());
			amount=amount+oi.getAmount();
		}
		
			o.setAmount(amount);
			o.setStatus(changeStatus);
			HashSet<OrderItem> orderItemSet = new HashSet<OrderItem>();
			orderItemSet.addAll(orderItemList);
//			orderItemList.clear();
			o.getOrderItems().removeAll(o.getOrderItems());
			o.setOrderItems(orderItemSet);
			if(changeStatus==10){
				o.setOrderTime(new Date());
			}
			System.out.println("Order [id=" + o.getId() + ", hospital=" + o.getHospital() + ", orderTime="
					+ o.getOrderTime() + ", amount=" + o.getAmount() + ", status=" + o.getStatus()
					+ " orderItems=" +o. getOrderItems() + "]");
			hospitalDao.updateObject(o);
			
		}
		

	//采购单列表-----------------------------------------------------------
		//模态框中的      查看需要用到deleteOrderItemList和txupdateOrder和
		//    退货需要用到txupdateOrder
		//查找订单
		@Override
		public List<Order> loadPurchaseOrder(String hid,OrderSearchCondition orderCondition,boolean paging, int page) throws ParseException{
			return hospitalDao.findOrderWithCondition(hid, orderCondition, paging, page);
		}
		
		
		//
		//下载订单
		@Override
		public void createAndDownloadPurchase(HospitalDto h,String fileName,OrderSearchCondition orderSearchCondition) throws Exception{
			//删除第11行开始的单元格
			new StringPackExcel().deleteSheet(fileName, 0, 10);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			
			String timestr1 = "购买方："+h.getName()+":"+h.getId()+"时间：" + dateFormat.format(new Date());	
			new StringPackExcel().Excel(timestr1, fileName, 0, 4, 0);
			
			String timestr = "起始时间 "+orderSearchCondition.getBeginorder_Time()+" 终止时间：" + orderSearchCondition.getEndorder_Time()+" 订单状态:"+HardCodeParsing.parseOrderStatus(orderSearchCondition.getStatus());
			new StringPackExcel().Excel(timestr, fileName, 0, 6, 0);
			
		List<Order> orderlist=hospitalDao.findOrderWithCondition(h.getId(), orderSearchCondition, false, 0);
		if(orderlist.size()==0){return;}
		List<List<String>> li = new ArrayList<List<String>>();
		for (int i = 0; i < orderlist.size(); i++) {
			List<String> strList = new ArrayList<String>();
			strList.add(orderlist.get(i).getId());
			strList.add(h.getName());
			strList.add(dateFormat.format(orderlist.get(i).getOrderTime()));
			strList.add(orderlist.get(i).getAmount()+"");
			strList.add(HardCodeParsing.parseOrderStatus(orderlist.get(i).getStatus()));
			if(orderlist.get(i).getReturnTime()==null){
				strList.add("");
			}
			else{
				strList.add(dateFormat.format(orderlist.get(i).getReturnTime()));
			}
			if(orderlist.get(i).getReturnReason()==null){
				strList.add("");
			}
			else{
				String simpleReturnReason=orderlist.get(i).getReturnReason();
				if(simpleReturnReason.length()>=18){
					simpleReturnReason=simpleReturnReason.substring(0, 18);
					simpleReturnReason=simpleReturnReason+"···";
				}
				strList.add(simpleReturnReason);
			}
			

			li.add(strList);
		}
		new StringPackExcel().Excel(li, fileName, 0, 10, 0);
			//对订单列表进行写入
		}
		
		//退货单页面加载
		@Override
		public Order loadOrder(String oid){
		Order o= hospitalDao.findObjectWithId(Order.class, oid);	
			return o;
		}
		//订单退货操作
		public void txReturnOrder(Order o){
			hospitalDao.updateObject(o);
		}
		

		//采购单入库
		public void txPutOrder(List<String> oid){
			
			List<Order> li=hospitalDao.findObjectListByIdList(Order.class, oid);
			for(Order o:li){
				int status=(o.getStatus()%10)+40;
				o.setStatus(status);
				hospitalDao.updateObject(o);
			}
			
		}
		
		//-----------------------------------------------------------------------------------
		//退货单创建
		//退货单列表
		//采购单修改
		
		
		
		
		
		//操作手册下载
		@Override
		public void createAndDownloadBrochure(String fileName) throws Exception{
		// TODO Auto-generated method stub
		//对医疗操作手册文件进行修改
	}
	
		
		
		
	public IHospitalDao getHospitalDao() {
		return hospitalDao;
	}

	public void setHospitalDao(IHospitalDao hospitalDao) {
		this.hospitalDao = hospitalDao;
	}

	
	
}
