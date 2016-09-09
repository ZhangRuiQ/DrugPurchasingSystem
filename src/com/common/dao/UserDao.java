package com.common.dao;

import org.apache.catalina.ant.FindLeaksTask;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import com.common.domain.HealthBureau;
import com.common.domain.Hospital;
import com.common.service.IUserService;



public class UserDao extends HibernateDaoSupport implements IUserDao {

	@Override
	public Hospital findAtIDInHospital(String id) {
		System.out.println(id);
		String sql="from Hospital h where h.id=:ids";
		
		return (Hospital) this.getSessionFactory().openSession().createQuery(sql).setString("ids",id).list().get(0);
		 
			
		
	}

	@Override
	public HealthBureau findAtIDInHealthBureau(String id) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(HealthBureau.class, id);
	}


}
