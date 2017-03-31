package com.volvo.service;

import com.volvo.dao.TargetDAO;
import com.volvo.entity.Target;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class Service1 implements Service1I{

    @Autowired
    private TargetDAO targetDAO;


    @Override
    public void save(Target t) {
        targetDAO.save(t);
    }

    @Override
    public void delete(Target t) {
        targetDAO.delete(t);
    }

    @Override
    public void update(Target t) {
        targetDAO.update(t);
    }

    @Override
    public Target findById(int id) {
        return targetDAO.findById(id);
    }

    @Override
    public List findAll() {
        return targetDAO.findAll();
    }

    @Override
    public int count() {
        return targetDAO.count();
    }
}
