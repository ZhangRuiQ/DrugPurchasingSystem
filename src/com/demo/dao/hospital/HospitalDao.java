package com.demo.dao.hospital;

import java.util.List;

import org.hibernate.Session;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.common.domain.Medicine;
import com.common.domain.Order;
import com.common.domain.OrderItem;

public class HospitalDao extends HibernateDaoSupport implements IHospitalDao {

	@Override
	public String modifyPasswd(String id, String newPasswd) {
		
		return null;
	}

	@Override
	public List<Medicine> findAllMedicine() {
		String sql="FROM Medicine";
		List<Medicine> li= (List<Medicine>) this.getHibernateTemplate().find(sql);
		
		System.out.println(li.size());
		
		// TODO Auto-generated method stub
		return li;
	}

}
