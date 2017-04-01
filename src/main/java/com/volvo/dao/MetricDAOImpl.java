package com.volvo.dao;

import com.volvo.entity.KPISubCategory;
import com.volvo.entity.Metric;
import com.volvo.entity.Target;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
@Repository
public class MetricDAOImpl implements MetricDAO {

    private static final Logger logger = Logger.getLogger(MetricDAOImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Metric m) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(m);
        logger.info("saved the object " + m);
    }

    @Override
    public void delete(Metric m) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(m);
        logger.info("deleted the object: " + m);
    }

    @Override
    public void update(Metric m) {
        Session session = sessionFactory.getCurrentSession();
        session.update(m);
        logger.info("updated the object " + m);
    }

    @Override
    public Metric findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Metric m = (Metric) session.load(Metric.class, id);
        logger.info("found object: " + m + " by id: " + id);
        return m;
    }

    @Override
    public List findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        List data = session.createQuery("from Metric").list();
        logger.info("getting all objects " + data);
        return data;
    }

    @Override
    public long count() {
        Session session = this.sessionFactory.getCurrentSession();
        long count = (long) session.createQuery("select count(*) from Metric").uniqueResult();
        logger.info("getting count " + count);
        return count;
    }
}
