package com.demo.service.hospital;

import java.text.ParseException;
import java.util.List;

import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.domain.OrderItem;
import com.common.dto.HospitalDto;
import com.common.dto.OrderDto;
import com.demo.dto.hospital.MedicineSearchCondition;
import com.demo.dto.hospital.OrderSearchCondition;

public interface IHospitalService {
	// 修改密码
	public Boolean txModifyPasswd(String id, String newPasswd, String oldPasswd);
	//------------------------------------------------------------------------------------------

	// 药品目录加载
	public List<Medicine> loadMedicines(MedicineSearchCondition condition,
			int page);

	// 有条件查看总页数

	public int PageCountByCondition(MedicineSearchCondition conditian);

	// 生成药品目录文件
	public void createAndDownloadMedicineFile(String fileName) throws Exception;

	// 药品类型查询
	public List<String> loadTypeByMedicine();

	// 采购单创建（在药品目录页面点击加入购物单）
	public void txajax_purchase_new(String[] medicine_id_array, String hid);
	//------------------------------------------------------------------------------------------
	// 采购单创建页面加载
	public Order load_purchase_new(String hid);
	//更新(只对订单项进行删减或者增加单品数量)订单
	public void txupdateOrder(String hid,List<String> orderItem_id_list,List<Integer> orderItem_number,int changeStatus,String orderId);
	//订单导出
	public void createAndDownloadPurchase(HospitalDto h,String fileName,OrderSearchCondition orderSearchCondition) throws Exception;
	//加载某个采购单的订单项(分页)
			public List<OrderItem> load_order_item(String orderId, int page);
			
			//计算某个采购单的订单项的页数
			public int PageCountByOrderItem(String orderId);
			//分页查看采购单订单项的页数
			public int PageCountByOrder(String hid,OrderSearchCondition orderCondition) throws ParseException;
			// 加载order
			public Order loadOrder(String oid);
			//订单退货操作
			public void txReturnOrder(Order o);
	// 采购单修改
	// 采购单入库
			public void txPutOrder(List<String> oid);
	// 采购单列表
	// 操作手册下载
	public void createAndDownloadBrochure(String fileName) throws Exception;
	//查找订单
	public List<Order> loadPurchaseOrder(String hid,OrderSearchCondition orderCondition,boolean paging, int page) throws ParseException;
}
