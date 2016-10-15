package com.common.dao;

import org.hibernate.Session;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.common.domain.HealthBureau;
import com.common.domain.Hospital;



public class UserDao extends HibernateDaoSupport implements IUserDao {

	@Override
	public Hospital findAtIDInHospital(String id) {
		
		return this.getHibernateTemplate().get(Hospital.class, id);
				
			
		
	}

	@Override
	public HealthBureau findAtIDInHealthBureau(String id) {
		
		return this.getHibernateTemplate().get(HealthBureau.class, id);
	}
	


}
