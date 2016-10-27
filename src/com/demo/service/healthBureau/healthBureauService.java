package com.demo.service.healthBureau;

import java.util.List;

import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.dto.HealthBureauDto;
import com.common.dto.MedicineDto;
import com.common.dto.OrderDto;
import com.common.dto.OrderItemDto;
import com.demo.action.healthBureau.PageBean;

public interface healthBureauService {
	public Medicine searchSingleMedicineByNumber(String number);
	public PageBean searchMedicines(MedicineDto medicineDto,int pageSize,int count);
	public void updateMedicine(MedicineDto medicineDto);
	public void deleteMedicineByNumber(MedicineDto medicineDto);
	public boolean txinsertMedicine(MedicineDto medicineDto);
	public int getMedicineCount();
	public PageBean searchOrders(OrderDto orderDto, int pageSize, int page, int code);
	public void txupdateOrder(OrderDto orderDto);
	public Order searchSingleOrderById(String id);
	public void txdeleteOrderById(OrderDto orderDto);
	public void txupdateOrder_status(OrderDto orderDto);
	public List<Object> searchOrderItems(OrderItemDto orderItemDto ,int pageSize, int page);
	public boolean txmodify_passwd(String id, String oldPasswd, String newPasswd);

}
