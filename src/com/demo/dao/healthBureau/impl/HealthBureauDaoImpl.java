package com.demo.dao.healthBureau.impl;

import java.util.ArrayList;
import java.util.List;



















import org.hamcrest.core.Is;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.domain.OrderItem;
import com.demo.dao.healthBureau.healthBureauDao;

public class HealthBureauDaoImpl extends HibernateDaoSupport implements healthBureauDao{
	
	//无参构造器
	public HealthBureauDaoImpl() {
		super();
	}
	
	/**
	 * 查询单个药品dao层
	 */
	@Override
	public Medicine searchSingleMedicineByNumber(String number) {
		
		Medicine medicine =  this.getHibernateTemplate().get(Medicine.class, number);
		
		return  medicine ;
	}
	
	/**
	 * 查询多个药品(分页查询)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Medicine> searchMedicines(String s, int offset, int length) {
		List<Medicine> medicines = new ArrayList<Medicine>();
		String hql = "";
		if (!s.isEmpty()) {
			 hql = " from Medicine medicine where " + s;
		}else {
			 hql = " from Medicine medicine ";
		}
		
		Query q =  this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);	//尽量不要用openSession，分页查询频繁的话，会卡死
		q.setFirstResult(offset);
		q.setMaxResults(length);
		medicines = (List<Medicine>)q.list();
		
		for(int i=0;i<medicines.size();i++)
		{
			System.out.println(medicines.get(i).getName());
		}
		
		return medicines;
	}
	
	/**
	 * 获取药品的总记录数
	 */
	@Override
	public int getMedicineCount(String s){
		Query q = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(s);	//尽量不要用openSession，分页查询频繁的话，会卡死
		return Integer.parseInt(q.list().get(0).toString());
	}
	
	/**
	 * 插入药品数据
	 */
	public void insertMedicine(Medicine medicine) {
		
//		this.getHibernateTemplate().save(medicine);

		Session session = this.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		   
		for ( int i=0; i<1; i++ ) {
		    session.save(medicine);
		    if ( i % 20 == 0 ) { //20, same as the JDBC batch size
		        //flush a batch of inserts and release memory:
		        session.flush();
		        session.clear();
		    }
		}
		   
		tx.commit();

		System.out.println("插入dao成功");
		
	}
	
	
	/**
	 * 删除单个药品
	 */
	public void deleteMedicineByNumber(String number) {
		String oldName = number;
		Session session = this.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		String hqlDelete = " delete Medicine m where m.number = :oldName ";
		// or String hqlDelete = "delete Customer where name = :oldName";
		session.createQuery( hqlDelete )
		        .setString( "oldName", oldName )
		        .executeUpdate();
		tx.commit();
	}
	
	/**
	 * 修改药品数据
	 */
	@Override
	@Transactional
	public void updateMedicine(Medicine medicine) {
//		String newName = "haha";
//		String oldName = "5";
//		Session session = this.getSessionFactory().openSession();
//		Transaction tx = session.beginTransaction();
//
//		String hqlUpdate = "update Medicine m set name = :newName where name = :oldName";
//		// or String hqlUpdate = "update Customer set name = :newName where name = :oldName";
//		int updatedEntities = session.createQuery( hqlUpdate )
//		        .setString( "newName", newName )
//		        .setString( "oldName", oldName )
//		        .executeUpdate();
//		tx.commit();
//		session.close();
		
		
		this.getHibernateTemplate().save(medicine);
		System.out.println("dao成功");
	}
	
	/**
	 * 查询所有的订单(分页查询)
	 * @param number
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Order> searchOrders(String s, int offset, int length, int code) {
		List<Order> orders = new ArrayList<Order>();
		String hql = "";
		if (!s.isEmpty()) {
			if (40 == code) {		//code为40时，代表查询未审核的退货单
				hql = " from Order order where order.status = 60 and " + s;
			}else if (30 == code) {		//code为30时，代表查询全部退货单
				hql = " from Order order where order.status >= 50 and " + s;
			}else if (20 == code) {		//code为20时，代表查询未入库的订单
				hql = " from Order order where   order.status  between 30 and 31  and " + s;
			}else if (10 == code) {		//code为10时，代表查询未审核的订单
				hql = " from Order order where order.status = 10 and " + s;
			}else {
				hql = " from Order order where " + s;
			}
		}else {	
			if (100 == code ) {		//code为100时，代表查询全部订单
				hql = " from Order order ";
			}
			if (10 == code) {		//code为10时，代表查询未审核的订单
				hql = " from Order order where order.status = 10 ";
			}
			if (20 == code) {		//code为20时，代表查询未入库的订单
				hql = " from Order order where order.status = 30 or order.status = 31 ";
			}
			if (30 == code) {		//code为30时，代表查询全部退货单
				hql = " from Order order where order.status >= 50 ";
			}
			if (40 == code) {		//code为40时，代表查询未审核的退货单
				hql = " from Order order where order.status = 60 ";
			}
		}
		
		Query q =  this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);	//尽量不要用openSession，分页查询频繁的话，会卡死
		q.setFirstResult(offset);
		q.setMaxResults(length);
		orders = (List<Order>)q.list();
		
		return orders;
	}
	
	/**
	 * 查询订单的订单项
	 */
	@SuppressWarnings("unchecked")
	public List<OrderItem> searchOrderItems(String oreder_Id, int offset, int length){
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		
		String hql = " from OrderItem item where item.order = " + oreder_Id;
		
		Query q =  this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(hql);	//尽量不要用openSession，分页查询频繁的话，会卡死
		q.setFirstResult(offset);
		q.setMaxResults(length);
		orderItems = (List<OrderItem>)q.list();
		
		return orderItems;
	}
	
	/**
	 * 通过Id查询单个订单
	 */
	public Order searchSingleOrderById(String id){
		Order order =  this.getHibernateTemplate().get(Order.class, id);
		
		return  order ;
	}
	
	/**
	 * 获取订单的总记录数
	 */
	public int getOrderCount(String s){
		Query q = this.getHibernateTemplate().getSessionFactory().getCurrentSession().createQuery(s);	//尽量不要用openSession，分页查询频繁的话，会卡死
		
		return Integer.parseInt(q.list().get(0).toString());
	}
	
	/**
	 * 修改订单数据
	 */
	@Override
	public void updateOrder(Order order) {
		
		this.getHibernateTemplate().save(order);
	
	}
	
	/**
	 * 
	 */
	public void updateOrder_status(String id, int status) {
		String oldName = id;
		String newName = String.valueOf(status);
		Session session = this.getSessionFactory().openSession();		//getHibernaet..getCurrentSession,无法更新？？

		String hqlUpdate = " update Order o set o.status = :newName where o.id = :oldName ";
		// or String hqlUpdate = "update Customer set name = :newName where name = :oldName";
		session.createQuery( hqlUpdate )
		        .setString( "newName", newName )
		        .setString( "oldName", oldName )
		        .executeUpdate();
		
	}
	
	/**
	 * 删除单个药品
	 */
	public void deleteOrderById(String id) {
		String oldName = id;
		Session session = this.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		String hqlDelete = " delete Order o where o.id = :oldName ";
		// or String hqlDelete = "delete Customer where name = :oldName";
		session.createQuery( hqlDelete )
		        .setString( "oldName", oldName )
		        .executeUpdate();
		
		tx.commit();
	}
	
	
	
}
