package com.volvo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.volvo.entity.AbstractEntity;
import com.volvo.entity.User;

@Repository
public class AppDAOImpl implements AppDAO {

	private static final Logger logger = Logger.getLogger(AppDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public <T extends AbstractEntity> void save(T t) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(t);
		logger.info("saved the object " + t);
	}

	@Override
	public <T extends AbstractEntity> void delete(T t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
		logger.info("deleted the object: " + t);
	}

	@Override
	public <T extends AbstractEntity> void update(T t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
		logger.info("updated the object " + t);
	}

	@Override
	public <T extends AbstractEntity> T findById(long id) {
		Session session = sessionFactory.getCurrentSession();
		T t = (T) session.load(Object.class, new Long(id));
		logger.info("found object: " + t + " by id: " + id);
		return t;
	}

	@Override
	public <T extends AbstractEntity> List<T> getAll() {
		Session session = this.sessionFactory.getCurrentSession();
		List<T> data = session.createQuery("from T").list();
		logger.info("getting all objects " + data);
		return data;
	}

	@Override
	public User findByUserName(String username) {
		List<User> data = new ArrayList<User>();
		data = sessionFactory.getCurrentSession().createQuery("from User where username=?").setParameter(0, username)
				.list();
		return data.size() > 0 ? data.get(0) : null;
	}

}
