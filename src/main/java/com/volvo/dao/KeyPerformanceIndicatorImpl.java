package com.volvo.dao;

import com.volvo.entity.KeyPerformanceIndicator;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Transactional
@Repository
public class KeyPerformanceIndicatorImpl implements KeyPerformanceIndicatorDAO {

    private static final Logger logger = Logger.getLogger(KeyPerformanceIndicatorImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(KeyPerformanceIndicator m) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(m);
        logger.info("saved the object " + m);
    }

    @Override
    public void delete(KeyPerformanceIndicator m) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(m);
        logger.info("deleted the object: " + m);
    }

    @Override
    public void update(KeyPerformanceIndicator m) {
        Session session = sessionFactory.getCurrentSession();
        session.update(m);
        logger.info("updated the object " + m);
    }

    @Override
    public KeyPerformanceIndicator findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        KeyPerformanceIndicator m = (KeyPerformanceIndicator) session.load(KeyPerformanceIndicator.class, id);
        logger.info("found object: " + m + " by id: " + id);
        return m;
    }

    @Override
    public List findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        List data = session.createQuery("from KeyPerformanceIndicator").list();
        logger.info("getting all objects " + data);
        return data;
    }

    @Override
    public long count() {
        Session session = this.sessionFactory.getCurrentSession();
        long count = (long) session.createQuery("select count(*) from KeyPerformanceIndicator").uniqueResult();
        logger.info("getting count " + count);
        return count;
    }

    @Override
    public List<KeyPerformanceIndicator> getKeyPerformanceIndicator(Integer year, String plantName) {
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery("from KeyPerformanceIndicator where plantName=? and extract(Year from date)=?");
        q.setParameter(0, plantName);
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        q.setParameter(1, cal.get(1));

        return (List<KeyPerformanceIndicator>) q.list();


    }
}
