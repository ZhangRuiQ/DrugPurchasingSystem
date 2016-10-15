package com.demo.dao.hospital;

import java.text.ParseException;
import java.util.List;

import com.common.domain.Hospital;
import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.domain.OrderItem;
import com.common.dto.HospitalDto;
import com.demo.dto.hospital.MedicineSearchCondition;
import com.demo.dto.hospital.OrderSearchCondition;

public interface IHospitalDao {
	
	//数据-----------------------------------------------
	/**
	 * 更新数据
	 * @param obj
	 * 需要更新的数据
	 */
	public void updateObject( Object obj);
	/**
	 * 删除数据
	 * @param o
	 * 需要删除的数据
	 */
	public void deleteObject(Object o);
	
	/**
	 * 根据id查询出object
	 * @param clazz
	 * 需要被查询的数据的类的类对象
	 * @param id
	 * 查询对象的id
	 * @return
	 * 返回查询数据的类的对象
	 */
	public <T> T findObjectWithId(Class<T> clazz,String id);
	
	/**
	 * 
	 * 查找所有的object sortName 排序项 sortord 排序方式
	 * @param clazz
	 * 需要被查询的数据的类的类对象
	 * @param sortName
	 * 需要排序的字段
	 * @param sortord
	 * desc或者asc
	 * @return
	 * 返回该查询数据的list
	 */
	public <T> List<T> findAllObject(Class<T> clazz,String sortName,String sortord);
	/**
	 * 根据多个id多个数据
	 * @param clazz
	 * 需要被查询的数据的类的类对象
	 * @param id
	 * 需要被查询的数据的id的list集合
	 * @return
	 * 返回该对象的集合
	 */
	public  <T> List<T> findObjectListByIdList(Class<T> clazz,List<String> id);
			
	
	//药品---------------------------------------------------------------
	/**
	 * 查看药品的所有类型集合
	 * @return
	 * 返回所有药品的类型
	 */
	public List<String> findAllTypeByMedicine();
	/**
	 * 根据条件查询药品目录（分页）
	 * @param condition
	 * 一个MedicineSearchCondition对象
	 * @param page
	 * 查询第几页
	 * @return
	 * 返回该页的药品集合（List）
	 */
	public  List<Medicine> findMedicineWithcondition(MedicineSearchCondition condition,int page);
	
	/**
	 * 当药品分页的时候，查看总页数
	 * @param condition
	 * 一个MedicineSearchCondition
	 * @return
	 * 放回的是：当分页查询时候，药品的总页数
	 */
	public int PageCountMedicineWithCondition(MedicineSearchCondition condition);
	
	
	
	//订单-----------------------------------------------------------------
	
	/**
	 * 创建订单，默认订单类型为0（未提交） 根据药品的id添加订单项
	 * @param medicine_id_array
	 * 需要添加为订单的订单项的id数组
	 * @param h
	 * 一个Hospital对象
	 */
	public void new_order(String[] medicine_id_array, Hospital h);
	/**
	 * 查看h是否存在某个状态的订单 并返回订单集合
	 * @param h
	 * 一个hospital对象
	 * @param status
	 * 所有查询的订单的状态
	 * @return
	 * 返回该医院的相应状态的订单List
	 */
	public  List<Order> isOrderWithStatus(Hospital h,int status);
	/**
	 * 根据订单id 分页加载订单项
	 * @param orderId
	 * 订单的id
	 * @param page
	 * 查询第几页
	 * @return
	 * 返回相应订单的相应页的订单项的list
	 */
	public List<OrderItem> findOrderItemWithOrderId(final String orderId,final int page);
	/**
	 * 在根据订单id查找分页订单项的时候，计算出总页数
	 * @param orderId
	 * 订单id
	 * @return
	 * 返回分页查询相应的订单的订单项的总页数
	 */
	public int PageCountOrderItemWithOrderId(String orderId);
	/** 
	 * 分页情况查看该用户所有订单的总页数
	 * 
	 * @param hid
	 * 医院的id
	 * @param orderCondition
	 * 一个OrderSearchCondition对象
	 * @return
	 * 返回分页查询该医院的订单的总页数
	 * @throws ParseException
	 */
	public int pageCountOrderWithCondition(String hid,OrderSearchCondition orderCondition) throws ParseException;
	/**
	 * 根据条件查看该医院所购买的订单（paging =true为分页查找并同时制定page ，false为不分页(此时page=0)）
	 * 
	 * @param hid
	 * 医院id
	 * @param orderCondition
	 * 一个OrderSearchCondition对象
	 * @param paging
	 * 是否分页查询，分页为true，不分页查看全部为false
	 * @return
	 * 返回订单List
	 * @throws ParseException
	 */
	public List<Order> findOrderWithCondition(String hid,OrderSearchCondition orderCondition,boolean paging,final int page) throws ParseException;
			
			
			

}
