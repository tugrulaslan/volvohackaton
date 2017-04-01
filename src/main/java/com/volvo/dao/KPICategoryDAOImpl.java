package com.volvo.dao;

import com.volvo.entity.KPICategory;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
@Repository
public class KPICategoryDAOImpl implements KPICategoryDAO {

    private static final Logger logger = Logger.getLogger(KPICategoryDAOImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(KPICategory m) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(m);
        logger.info("saved the object " + m);
    }

    @Override
    public void delete(KPICategory m) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(m);
        logger.info("deleted the object: " + m);
    }

    @Override
    public void update(KPICategory m) {
        Session session = sessionFactory.getCurrentSession();
        session.update(m);
        logger.info("updated the object " + m);
    }

    @Override
    public KPICategory findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        KPICategory m = (KPICategory) session.load(KPICategory.class, id);
        logger.info("found object: " + m + " by id: " + id);
        return m;
    }

    @Override
    public List findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        List data = session.createQuery("from KPICategory").list();
        logger.info("getting all objects " + data);
        return data;
    }

    @Override
    public long count() {
        Session session = this.sessionFactory.getCurrentSession();
        long count = (long) session.createQuery("select count(*) from KPICategory").uniqueResult();
        logger.info("getting count " + count);
        return count;
    }
}
