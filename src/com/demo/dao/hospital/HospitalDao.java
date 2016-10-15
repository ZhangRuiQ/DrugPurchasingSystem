package com.demo.dao.hospital;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import org.apache.poi.ss.formula.functions.Vlookup;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.common.domain.Hospital;
import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.domain.OrderItem;
import com.common.dto.HospitalDto;
import com.demo.dto.hospital.MedicineSearchCondition;
import com.demo.dto.hospital.OrderSearchCondition;

public class HospitalDao extends HibernateDaoSupport implements IHospitalDao {
	public static final int ONE_PAGE_NUMBER = 5;
	// 数据----------------------------------------------------------------------------
	@Override
	/**
	 * 更新数据
	 */
	public void updateObject(Object obj) {

		this.getHibernateTemplate().update(obj);

	}
	@Override
	/**
	 * 删除数据
	 */
	public void deleteObject(Object o) {
		this.getHibernateTemplate().delete(o);
	}


	@Override
	/**
	 * 根据id查询出object
	 */
	public <T> T findObjectWithId(Class<T> clazz, String id) {
		return this.getHibernateTemplate().get(clazz, id);
	}

	@Override
	/**
	 * 查找所有的object sortName 排序项 sortord 排序方式
	 */
	public <T> List<T> findAllObject(Class<T> clazz, String sortName,
			String sortord) {
		String className = clazz.getName();
		className = className.substring(className.lastIndexOf(".") + 1);
		String sql = "FROM " + className + " m  order by m." + sortName + " "
				+ sortord;
		return (List<T>) this.getHibernateTemplate().find(sql, null);

	}
	
	
	@Override
	/**
	 * 根据多个id多个数据
	 */
	public <T> List<T> findObjectListByIdList(Class<T> clazz, List<String> id) {
		String[] key = new String[id.size()];
		String[] value = new String[id.size()];
		String className = clazz.getName();
		className = className.substring(className.lastIndexOf(".") + 1);
		System.out.println(className);
		StringBuilder strb = new StringBuilder("from " + className
				+ " o where 1=1");
		if (id.size() == 0) {
			return null;
		}
		for (int i = 0; i < id.size(); i++) {
			if (i == 0) {
				strb.append(" and o.id=:id" + i);

			} else {
				strb.append(" or o.id=:id" + i);
			}
			key[i] = "id" + i;
			value[i] = id.get(i);
		}
		return (List<T>) this.getHibernateTemplate().findByNamedParam(
				strb.toString(), key, value);

	}
	// 药品------------------------------------------------------------------------------------------
	@Override
	/**
	 * 查看药品的所有类型集合
	 */
	public List<String> findAllTypeByMedicine() {
		String sql1 = "select distinct  s.type	from Medicine s	";
		List<String> str = (List<String>) this.getHibernateTemplate().find(
				sql1, null);

		return str;
	}

@Override
	/**
	 * 根据条件查询药品目录（分页）
	 */
	
	public List<Medicine> findMedicineWithcondition(
			final MedicineSearchCondition condition, final int page) {
		final StringBuilder strb;
		if (condition == null) {
			strb = new StringBuilder("FROM Medicine m  order by m.price asc");
		} else {

			strb = new StringBuilder("FROM Medicine s where 1=1");
			if (condition.getNumber().trim().length() != 0) {
				strb.append(" and s.number like :number");
			} else {
				if (condition.getName().trim().length() != 0) {
					strb.append(" and s.name like :name");
				}
			}
			if (condition.getManufacturerName().trim().length() != 0) {
				strb.append(" and s.manufacturer.name  like :manufacturerName");

			}
			if (!condition.getStatus().equals("3")) {// 3为全部
				strb.append(" and s.status= :state");
			}

			if (!condition.getType().equals("0")) {

				strb.append(" and s.type= :type");
			}

			strb.append(" order by s.price " + condition.getPricesort());
		}

		return this.getHibernateTemplate().execute(
				new HibernateCallback<List<Medicine>>() {

					@Override
					public List<Medicine> doInHibernate(Session session)
							throws HibernateException {
						Query q = session.createQuery(strb.toString());
						if (condition != null) {
							if (condition.getNumber().trim().length() != 0) {
								q.setString("number", condition.getNumber()
										+ "%");
							} else {
								if (condition.getName().trim().length() != 0) {
									q.setString("name", condition.getName()
											+ "%");
								}
							}
							if (condition.getManufacturerName().trim().length() != 0) {

								q.setString("manufacturerName",
										condition.getManufacturerName() + "%");

							}
							if (!condition.getStatus().equals("3")) {
								q.setString("state", condition.getStatus());
							}

							if (!condition.getType().equals("0")) {
								q.setString("type", condition.getType());

							}
						}
						q.setMaxResults(ONE_PAGE_NUMBER);
						q.setFirstResult(ONE_PAGE_NUMBER * (page - 1));
						return (List<Medicine>) q.list();
					}

				});

	}

	@Override
	/**
	 * 当药品分页的时候，查看总页数
	 */
	public int PageCountMedicineWithCondition(MedicineSearchCondition condition) {
		StringBuilder strb;
		int count;

		if (condition == null) {
			strb = new StringBuilder(
					"select COUNT(*) from Medicine m order by m.price asc");
			// TODO Auto-generated method stub
			count = ((Long) this.getHibernateTemplate()
					.find(strb.toString(), null).get(0)).intValue();
		}

		else {
			List<String> paramName = new ArrayList<String>();
			List<Object> values = new ArrayList<Object>();

			strb = new StringBuilder(
					"select COUNT(*) from Medicine s where 1=1");
			if (condition.getNumber().trim().length() != 0) {
				strb.append(" and s.number like :number");
				paramName.add("number");
				values.add(condition.getNumber() + "%");
			} else {
				if (condition.getName().trim().length() != 0) {
					strb.append(" and s.name like :name");
					paramName.add("name");
					values.add(condition.getName() + "%");
				}
			}
			if (condition.getManufacturerName().trim().length() != 0) {
				strb.append(" and s.manufacturer.name  like :manufacturerName");
				paramName.add("manufacturerName");
				values.add(condition.getManufacturerName() + "%");
			}
			if (!condition.getStatus().equals("3")) {// 3为全部
				strb.append(" and s.status= :state");
				paramName.add("state");
				values.add(condition.getStatus());
			}

			if (!condition.getType().equals("0")) {

				strb.append(" and s.type= :type");
				paramName.add("type");
				values.add(condition.getType());
			}

			strb.append(" order by s.price " + condition.getPricesort());
			String[] paramNameToString = new String[paramName.size()];
			for (int i = 0; i < paramName.size(); i++) {
				paramNameToString[i] = paramName.get(i);
			}

			count = ((Long) this
					.getHibernateTemplate()
					.findByNamedParam(strb.toString(), paramNameToString,
							values.toArray()).get(0)).intValue();
		}
		if (count % ONE_PAGE_NUMBER != 0) {
			return (count / ONE_PAGE_NUMBER + 1);
		} else {
			return count / ONE_PAGE_NUMBER;
		}
	}

	// 订单-------------------------------------------------------------------------------------------------
	@Override
	/**
	 * 创建订单，默认订单类型为0（未提交） 根据药品的id添加订单项
	 */
	public void new_order(String[] medicine_id_array, Hospital h) {
		// 查找选中的药品

		String[] key = new String[medicine_id_array.length];
		StringBuilder hqlstrbuider = new StringBuilder(
				"from Medicine m where 1=1");
		for (int i = 0; i < medicine_id_array.length; i++) {
			if (i == 0) {
				hqlstrbuider.append(" and m.number = :number" + i);
			} else {
				hqlstrbuider.append(" or m.number = :number" + i);
			}
			key[i] = ("number" + i);
		}

		List<Medicine> medicineList = (List<Medicine>) this
				.getHibernateTemplate().findByNamedParam(
						hqlstrbuider.toString(), key, medicine_id_array);
		int[] medicine_id_false = new int[medicineList.size()];
		List<Order> oi = this.isOrderWithStatus(h, 0);
		Order o = null;
		// 判断该用户中是否有已经保存的订单(证明所有的药品都没有添加过)
		if (oi.size() == 0) {
			// 不存在
			o = new Order();
			o.setAmount(0.0);
			o.setId(UUID.randomUUID().toString().replace("-", ""));
			o.setHospital(h);
			o.setOrderTime(new Date());
			o.setStatus(0);
			o.setOrderItems(new HashSet<OrderItem>());
		} else {
			o = oi.get(0);
			// 存在的话（需要检查药品是否添加过）
			for (OrderItem ori : o.getOrderItems()) {
				for (int i = 0; i < medicineList.size(); i++) {
					if (ori.getMedicine().getNumber()
							.equals(medicineList.get(i).getNumber())) {
						ori.setNumber(ori.getNumber() + 1);
						ori.setAmount(ori.getAmount()
								+ medicineList.get(i).getPrice());
						medicine_id_false[i] = 1;
						break;
					}
				}

			}
		}

		for (int i = 0; i < medicineList.size(); i++) {

			if (medicine_id_false[i] == 0) {

				OrderItem ot = new OrderItem();
				ot.setId(UUID.randomUUID().toString().replace("-", ""));
				ot.setAmount(medicineList.get(i).getPrice());
				ot.setMedicine(medicineList.get(i));
				ot.setNumber(1);
				ot.setOrder(o);
				o.getOrderItems().add(ot);
			}

		}
		double amount = o.getAmount();
		for (OrderItem s : o.getOrderItems()) {
			amount = amount + s.getAmount();
		}
		o.setAmount(amount);

		this.getHibernateTemplate().save(o);
	}

	@Override
	/***
	 * 查看h是否存在某个状态的订单 并返回订单集合
	 */
	public List<Order> isOrderWithStatus(Hospital h, int status) {

		String sql = "from Order o where o.hospital.id =:hid and  o.status =:status ";
		List<Object> valuelist = new ArrayList<Object>();
		List<String> keyList = new ArrayList<String>();
		keyList.add("hid");
		keyList.add("status");
		String[] keyarray = new String[keyList.size()];
		for (int i = 0; i < keyList.size(); i++) {
			keyarray[i] = keyList.get(i);

		}
		valuelist.add(h.getId());
		valuelist.add(status);
		List<Order> li = (List<Order>) this.getHibernateTemplate()
				.findByNamedParam(sql, keyarray, valuelist.toArray());

		return li;

	}

	@Override
	/**
	 * 根据订单id 分页加载订单项
	 */
	public List<OrderItem> findOrderItemWithOrderId(final String orderId,
			final int page) {
		final String hql = "from OrderItem oit where oit.order.id = :orderId";
		return this.getHibernateTemplate().execute(
				new HibernateCallback<List<OrderItem>>() {

					@Override
					public List<OrderItem> doInHibernate(Session session)
							throws HibernateException {
						Query q = session.createQuery(hql).setParameter(
								"orderId", orderId);
						q.setMaxResults(ONE_PAGE_NUMBER);
						q.setFirstResult(ONE_PAGE_NUMBER * (page - 1));
						return q.list();
					}
				});

	}

	@Override
	/**
	 * 在查找分页订单项的时候，计算出总页数 (non-Javadoc)
	 * 
	 * @see com.demo.dao.hospital.IHospitalDao#PageCountByOrderItem(java.lang.String)
	 */
	public int PageCountOrderItemWithOrderId(String orderId) {
		String pageCountSql = "select COUNT(*) from OrderItem oi where oi.order.id =:oid";
		// TODO Auto-generated method stub
		int count = ((Long) this.getHibernateTemplate()
				.findByNamedParam(pageCountSql, "oid", orderId).get(0))
				.intValue();
		if (count % ONE_PAGE_NUMBER != 0) {
			return (count / ONE_PAGE_NUMBER + 1);
		} else {
			return count / ONE_PAGE_NUMBER;
		}
	}
	
	@Override
	/** 分页情况查看该用户所有订单的总页数
	 * 
	 */
	public int pageCountOrderWithCondition(String hid,
			OrderSearchCondition orderCondition) throws ParseException {
		int count;
		final StringBuilder strb;
		// 处理时间
		SimpleDateFormat dateFomat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		final List<String> paramName;
		final List<Object> values;
		values = new ArrayList<Object>();
		paramName = new ArrayList<String>();
		strb = new StringBuilder(
				"select COUNT(*) from Order o where o.hospital.id=:hid");
		paramName.add("hid");
		values.add(hid);
		if (orderCondition.getId().trim().length() != 0) {
			strb.append(" and o.id like :ids");
			paramName.add("ids");
			values.add(orderCondition.getId() + "%");
		}

		int state = orderCondition.getStatus();
		if (state != -1) {
			if (state == 2 || state == 3 || state == 4) {
				strb.append(" and o.status = :status1 or  o.status = :status2 ");
				paramName.add("status1");
				values.add((state * 10));
				paramName.add("status2");
				values.add((state * 10 + 1));
			} else {
				strb.append(" and o.status = :status");
				paramName.add("status");
				values.add(state);
			}

		}
		strb.append(" and o.orderTime BETWEEN :beginorder_Time and :endorder_Time");
		paramName.add("beginorder_Time");
		values.add(dateFomat.parse(orderCondition.getBeginorder_Time()));
		paramName.add("endorder_Time");
		values.add(dateFomat.parse(orderCondition.getEndorder_Time()));
		if (!orderCondition.getPricesort().equals("asc")) {
			strb.append(" order by o.amount desc");
		} else {
			strb.append(" order by o.amount asc");
		}

		String[] paramNameToString = new String[paramName.size()];
		for (int i = 0; i < paramName.size(); i++) {
			paramNameToString[i] = paramName.get(i);
		}
		count = ((Long) this
				.getHibernateTemplate()
				.findByNamedParam(strb.toString(), paramNameToString,
						values.toArray()).get(0)).intValue();

		if (count % ONE_PAGE_NUMBER != 0) {
			return (count / ONE_PAGE_NUMBER + 1);
		} else {
			return count / ONE_PAGE_NUMBER;
		}

	}

	@Override
	/**
	 * 根据条件查看该医院所购买的订单（paging =true为分页查找并同时制定page ，false为不分页(此时page=0)）
	 * 
	 * @param hid
	 * @param orderCondition
	 * @param paging
	 * @return
	 * @throws ParseException
	 */
	public List<Order> findOrderWithCondition(String hid,
			OrderSearchCondition orderCondition, boolean paging, final int page)
			throws ParseException {
		final StringBuilder strb;
		// 处理时间
		SimpleDateFormat dateFomat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		final List<String> paramName;
		final List<Object> values;
		values = new ArrayList<Object>();
		paramName = new ArrayList<String>();
		strb = new StringBuilder("from Order o where o.hospital.id=:hid");
		paramName.add("hid");
		values.add(hid);
		if (orderCondition.getId().trim().length() != 0) {
			strb.append(" and o.id like :ids");
			paramName.add("ids");
			values.add(orderCondition.getId() + "%");
		}
		int state = orderCondition.getStatus();
		if (state != -1) {
			if (state == 2 || state == 3 || state == 4) {
				strb.append(" and o.status = :status1 or  o.status = :status2 ");
				paramName.add("status1");
				values.add((state * 10));
				paramName.add("status2");
				values.add((state * 10 + 1));
			} else {
				strb.append(" and o.status = :status");
				paramName.add("status");
				values.add(state);
			}

		}
		strb.append(" and o.orderTime BETWEEN :beginorder_Time and :endorder_Time");
		paramName.add("beginorder_Time");
		values.add(dateFomat.parse(orderCondition.getBeginorder_Time()));
		paramName.add("endorder_Time");
		values.add(dateFomat.parse(orderCondition.getEndorder_Time()));
		if (!orderCondition.getPricesort().equals("asc")) {
			strb.append(" order by o.amount desc");
		} else {
			strb.append(" order by o.amount asc");
		}

		String[] paramNameToString = new String[paramName.size()];
		for (int i = 0; i < paramName.size(); i++) {
			paramNameToString[i] = paramName.get(i);
		}
		// 分页的情况
		if (paging == true) {

			return this.getHibernateTemplate().execute(
					new HibernateCallback<List<Order>>() {

						@Override
						public List<Order> doInHibernate(Session session)
								throws HibernateException {
							Query q = session.createQuery(strb.toString());
							for (int i = 0; i < paramName.size(); i++) {

								q.setParameter(paramName.get(i), values.get(i));
							}

							q.setMaxResults(ONE_PAGE_NUMBER);
							q.setFirstResult((page - 1) * ONE_PAGE_NUMBER);
							// TODO Auto-generated method stub
							return q.list();
						}
					});
		}
		// 不分页的情况
		else {

			return (List<Order>) this.getHibernateTemplate().findByNamedParam(
					strb.toString(), paramNameToString, values.toArray());

		}

	}

}
