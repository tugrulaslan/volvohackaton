package com.volvo.dao;

import com.volvo.entity.KPICategory;
import org.springframework.security.access.annotation.Secured;

import java.util.List;

@Secured(value = { "IS_AUTHENTICATED_ANONYMOUSLY" })
public interface KPICategoryDAO {


    void save(KPICategory m);

    void delete(KPICategory m);

    void update(KPICategory m);

    KPICategory findById(int id);

    List findAll();

    long count();
}
