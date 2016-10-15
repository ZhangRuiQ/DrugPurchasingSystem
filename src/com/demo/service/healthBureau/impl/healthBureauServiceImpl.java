package com.demo.service.healthBureau.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.common.domain.Hospital;
import com.common.domain.Manufacturer;
import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.domain.OrderItem;
import com.common.dto.MedicineDto;
import com.common.dto.OrderDto;
import com.common.dto.OrderItemDto;
import com.demo.action.healthBureau.PageBean;
import com.demo.dao.healthBureau.healthBureauDao;
import com.demo.service.healthBureau.healthBureauService;

public class healthBureauServiceImpl implements healthBureauService{
	private healthBureauDao healthBureauDao;
	
	//无参构造器
	public healthBureauServiceImpl() {
		super();
	}

	/**
	 * 查询单个药品service层
	 */
	@Override
	public Medicine searchSingleMedicineByNumber(String number) {
		Medicine medicine = healthBureauDao.searchSingleMedicineByNumber(number);
		
		return medicine;
	}
	
	/**
	 * 插入药品
	 * @param medicine
	 */
	public void insertMedicine(MedicineDto medicineDto){
		Medicine medicine = new Medicine();
		
		medicine.setManufacturer(medicineDto.getManufacturer());
		medicine.setName(medicineDto.getName());
		medicine.setPrice(medicineDto.getPrice());
		medicine.setStandard(medicineDto.getStandard());
		medicine.setStatus(medicineDto.getStatus());
		medicine.setStockBalance(medicineDto.getStock_Balance());
		medicine.setType(medicineDto.getType());
		
		healthBureauDao.insertMedicine(medicine);
	}
	
	/**
	 * 查询药品的总记录数
	 */
	public int getMedicineCount(){
		String hql = " select count(*) from Medicine ";
		int count = healthBureauDao.getMedicineCount(hql); // 总记录数
		
		return count;
	}
	
	/**
	 * 查询多个药品(分页查询)
	 */
	@Override
	public PageBean searchMedicines(MedicineDto medicineDto,int pageSize,int page) {
		int count = this.getMedicineCount(); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, page); // 当前页开始记录
		int length = pageSize; // 每页记录数
		int currentPage = PageBean.countCurrentPage(page);
		
		//由MedicineDto对象生成部分sql需要的一部分查询条件语句
		String sql = "";
		int i = 0;
		if (medicineDto != null ) {
			try {
				Class<?> m = Class.forName(medicineDto.getClass().getName());
				//获取get方法
				Method method1 = m.getMethod("getNumber");
				Method method2 = m.getMethod("getName");
				Method method3 = m.getMethod("getPrice");
				Method method4 = m.getMethod("getStandard");
				Method method5 = m.getMethod("getStatus");
				Method method6 = m.getMethod("getStock_Balance");
				Method method7 = m.getMethod("getType");
				Method method8 = m.getMethod("getManufacturer");
				Method[] methods = new Method[]{method1,method2,method3,method4,method5,method6,method7,method8};
				
				//上面get方法的值
				String number = (String) m.getMethod("getNumber").invoke(medicineDto);
				String name = (String) m.getMethod("getName").invoke(medicineDto);
				String price = ((Double) m.getMethod("getPrice").invoke(medicineDto)).toString();
				String stadard = (String) m.getMethod("getStandard").invoke(medicineDto);
				String status = (String) m.getMethod("getStatus").invoke(medicineDto);
				String stock_Balance = (String) m.getMethod("getStock_Balance").invoke(medicineDto);
				String type = (String) m.getMethod("getType").invoke(medicineDto);
				String manufacurer = (String) ((Manufacturer)m.getMethod("getManufacturer").invoke(medicineDto)).getNumber();
				String[] s = new String[]{number,name,price,stadard,status,stock_Balance,type,manufacurer};
				
				//第一个sql参数,由于条件格式and的问题，所以第一个条件分开写了
				while( i < methods.length ) {
					String value = s[i];
					if ( !value.isEmpty() && !value.equals("0.0") ) {
						sql = sql + " " + methods[i].getName().substring(3).toLowerCase() + " = '" + value + "' ";
						break;
					}
					i++;
				}
				
				//第二个及后面的条件
				for ( ; i < methods.length-1; i++) {
					String value = s[i+1];
					if ( !value.isEmpty() && !value.equals("0.0") ) {
						String method =  methods[i+1].getName();
						sql = sql + " and " + method.substring(3).toLowerCase() + "= '" + value + "' ";
					}
				}
			} catch (Exception e) {
			}
		}
		
		System.out.println(sql);
		
		
		List<Medicine> medicines = healthBureauDao.searchMedicines(sql, offset, length);
		
		// 把分页信息保存到Bean中
	    PageBean pageBean = new PageBean();
	    pageBean.setPageSize(pageSize);
	    pageBean.setCurrentPage(currentPage);
	    pageBean.setAllRow(count);
	    pageBean.setTotalPage(totalPage);
	    pageBean.setList(medicines);
	    pageBean.init();
		
		return pageBean;
	}
	
	
	/**
	 * 修改单个药品的数据
	 */
	public void updateMedicine(MedicineDto medicineDto) {
		Medicine medicine;
		System.out.println("service");
		
		medicine = healthBureauDao.searchSingleMedicineByNumber(medicineDto.getNumber());	//对象必须从find等语句查得的，不可new出来的，不然无法更新
		medicine.setManufacturer(medicineDto.getManufacturer());
		medicine.setName(medicineDto.getName());
		medicine.setPrice(medicineDto.getPrice());
		medicine.setStandard(medicineDto.getStandard());
		medicine.setStatus(medicineDto.getStatus());
		medicine.setStockBalance(medicineDto.getStock_Balance());
		medicine.setType(medicineDto.getType());
		System.out.println(medicine.getNumber());
		
		medicine.setStatus("0");		//设置medicine为可更新的状态
		
		System.out.println("service start");
		healthBureauDao.updateMedicine(medicine);
		System.out.println("service end");
		
	}
	
	/**
	 * 删除单个药品
	 * @param medicineDto
	 */
	public void deleteMedicineByNumber(MedicineDto medicineDto) {
		healthBureauDao.deleteMedicineByNumber(medicineDto.getNumber());
	}
	
	
	/**
	 * 查询多个订单(分页查询)
	 */
	@Override
	public PageBean searchOrders(OrderDto orderDto,int pageSize,int page, int code) {
		int count = this.getOrderCount(); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, page); // 当前页开始记录
		int length = pageSize; // 每页记录数
		int currentPage = PageBean.countCurrentPage(page);
		
		//由orderDto对象生成部分sql需要的一部分查询条件语句
		String sql = "";
		int i = 0;
		if (orderDto != null ) {
			try {
				Class<?> m = Class.forName(orderDto.getClass().getName());
				//获取get方法
				Method method1 = m.getMethod("getId");
				Method method2 = m.getMethod("getHospitalId");
				Method method3 = m.getMethod("getOrder_Time");
				Method method4 = m.getMethod("getAmount");
				Method method5 = m.getMethod("getStatus");
				Method method6 = m.getMethod("getReturn_Time");
				Method method7 = m.getMethod("getReturn_Reason");
				Method[] methods = new Method[]{method1,method2,method3,method4,method5,method6,method7};
				
				//上面get方法的值
				String id = (String) m.getMethod("getId").invoke(orderDto);
				String hospitalId = (String) m.getMethod("getHospitalId").invoke(orderDto);
				String orderTime = ( m.getMethod("getOrder_Time").invoke(orderDto)).toString();
				String amount = ((Double) m.getMethod("getAmount").invoke(orderDto)).toString();
				String status = ( m.getMethod("getStatus").invoke(orderDto)).toString();
				String returnTime = ( m.getMethod("getReturn_Time").invoke(orderDto)).toString();
				String returnReason = (String) m.getMethod("getReturn_Reason").invoke(orderDto);
				String[] s = new String[]{id,hospitalId,orderTime,amount,status,returnTime,returnReason};
				
				//第一个sql参数,由于条件格式and的问题，所以第一个条件分开写了
				while( i < methods.length ) {
					String value = s[i];
					if (  value!=null & !value.isEmpty() & !value.equals("0.0") & !value.equals("0") ) {
						sql = sql + " " + methods[i].getName().substring(3).toLowerCase() + " = '" + value + "' ";
						break;
					}
					i++;
				}
				
				//第二个及后面的条件
				for ( ; i < methods.length-1; i++) {
					String value = s[i+1];
					if ( value!=null & !value.isEmpty() & !value.equals("0.0") & !value.equals("0")) {
						String method =  methods[i+1].getName();
						sql = sql + " and " + method.substring(3).toLowerCase() + "= '" + value + "' ";
					}
				}
			} catch (Exception e) {
			}
		}
		
		System.out.println(sql);
		
		List<Order> orders = healthBureauDao.searchOrders(sql, offset, length, code);
		
		// 把分页信息保存到Bean中
	    PageBean pageBean = new PageBean();
	    pageBean.setPageSize(pageSize);
	    pageBean.setCurrentPage(currentPage);
	    pageBean.setAllRow(count);
	    pageBean.setTotalPage(totalPage);
	    pageBean.setList(orders);
	    pageBean.init();
		
		return pageBean;
	}
	
	/**
	 * 查询多个订单(分页查询)
	 */
	@Override
	public List<Object> searchOrderItems(OrderItemDto orderItemDto ,int pageSize, int page) {
//		if( 0 == page ){
//			page = 1;
//		}
		int count = this.getOrderCount(); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, page); // 当前页开始记录
		int length = pageSize; // 每页记录数
		int currentPage = PageBean.countCurrentPage(page);
		
		String order_Id ="";
		if (null == orderItemDto) {
			order_Id = ((Order)searchOrders(null, 5, page, 100).getList().get(0)).getId();		//orderItemDto为null时，直接获取第一条订单的id为参数
		}else {
			order_Id = orderItemDto.getOrder().getId();		//orderItemDto不为为null时，根据orderItemDto的id作为为参数来查询
			System.out.println(order_Id);
		}
		
		List<Object> values = new ArrayList<Object>();
		Order order = healthBureauDao.searchSingleOrderById(order_Id);
		
		List<OrderItem> orderItems = healthBureauDao.searchOrderItems(order_Id, offset, length);
		
		// 把分页信息保存到Bean中
	    PageBean pageBean = new PageBean();
	    pageBean.setPageSize(pageSize);
	    pageBean.setCurrentPage(currentPage);
	    pageBean.setAllRow(count);
	    pageBean.setTotalPage(totalPage);
	    pageBean.setList(orderItems);
	    pageBean.init();
		
	    values.add(order);
	    values.add(pageBean);
	    
		return values;
	}
	
	/**
	 * 查询单个药品service层
	 */
	@Override
	public Order searchSingleOrderById(String id) {
		Order order = healthBureauDao.searchSingleOrderById(id);
		
		return order;
	}
	
	/**
	 * 单个订单的修改
	 * @throws ParseException 
	 */
	@Override
	public void txupdateOrder(OrderDto orderDto) {
		Order order;
		Hospital hospital = new Hospital();
		hospital.setId(orderDto.getHospitalId());
		
		SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd HH:mm:ss");
		
		order = healthBureauDao.searchSingleOrderById(orderDto.getId());	//对象必须从find等语句查得的，不可new出来的，不然无法更新
		order.setAmount(orderDto.getAmount());
		order.setHospital(hospital);
		order.setId(orderDto.getId());
		order.setReturnReason(orderDto.getReturn_Reason());
		order.setStatus(orderDto.getStatus());
		try {
			order.setOrderTime(sdf.parse(orderDto.getOrder_Time()));
			order.setReturnTime(sdf.parse(orderDto.getReturn_Time()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		healthBureauDao.updateOrder(order);
		
	}
	
	/**
	 * 单个订单只修改采购单状态
	 */
	@Override
	public void txupdateOrder_status(OrderDto orderDto) {
		
		String id = orderDto.getId();	
		int status = orderDto.getStatus();
		
		healthBureauDao.updateOrder_status(id,status);
		
	}
	
	/**
	 * 删除单个订单
	 * @param medicineDto
	 */
	public void txdeleteOrderById(OrderDto orderDto) {
		healthBureauDao.deleteOrderById(orderDto.getId());
	}
	
	/**
	 * 查询订单的总记录数
	 */
	public int getOrderCount(){
		String hql = " select count(*) from Order ";
		int count = healthBureauDao.getOrderCount(hql); // 总记录数
		
		return count;
	}

	public healthBureauDao getHealthBureauDao() {
		return healthBureauDao;
	}

	public void setHealthBureauDao(healthBureauDao healthBureauDao) {
		this.healthBureauDao = healthBureauDao;
	}

	
}
