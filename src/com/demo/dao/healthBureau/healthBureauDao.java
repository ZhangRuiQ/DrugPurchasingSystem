package com.demo.dao.healthBureau;

import java.util.List;

import com.common.domain.HealthBureau;
import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.domain.OrderItem;

public interface healthBureauDao {
	public Medicine searchSingleMedicineByNumber(String number);
	public List<Medicine> searchMedicines(String s, int offset, int length);
	public void updateMedicine(Medicine medicine);
	public void deleteMedicineByNumber(String number);
	public boolean insertMedicine(Medicine medicine);
	public int getMedicineCount(String s);
	public Order searchSingleOrderById(String id);
	public int getOrderCount(String hql);
	public List<Order> searchOrders(String s, int offset, int length, int code);
	public void updateOrder(Order order);
	public void deleteOrderById(String id);
	public void updateOrder_status(String id, int status);
	public List<OrderItem> searchOrderItems(String oreder_Id, int offset, int length);
	public <T> T getPasswdById(Class<T> entityClass,  String id);
	public void updateObeject(Object obj);

}