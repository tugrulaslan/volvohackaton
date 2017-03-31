package com.volvo.dao;

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
public class TargetDAOImpl implements TargetDAO {

    private static final Logger logger = Logger.getLogger(TargetDAOImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Target t) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(t);
        logger.info("saved the object " + t);
    }

    @Override
    public void delete(Target t) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(t);
        logger.info("deleted the object: " + t);
    }

    @Override
    public void update(Target t) {
        Session session = sessionFactory.getCurrentSession();
        session.update(t);
        logger.info("updated the object " + t);
    }

    @Override
    public Target findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Target t = (Target) session.load(Target.class, id);
        logger.info("found object: " + t + " by id: " + id);
        return t;
    }

    @Override
    public List findAll() {
        Session session = this.sessionFactory.getCurrentSession();
        List data = session.createQuery("from Target").list();
        logger.info("getting all objects " + data);
        return data;
    }

    @Override
    public long count() {
        Session session = this.sessionFactory.getCurrentSession();
        long count = (long) session.createQuery("select count(*) from Target").uniqueResult();
        logger.info("getting count " + count);
        return count;
    }
}
