package com.volvo.dao;

import com.volvo.entity.Metric;
import org.springframework.security.access.annotation.Secured;

import java.util.List;

@Secured(value = { "IS_AUTHENTICATED_ANONYMOUSLY" })
public interface MetricDAO {


    void save(Metric m);

    void delete(Metric m);

    void update(Metric m);

    Metric findById(int id);

    List findAll();

    long count();
}
