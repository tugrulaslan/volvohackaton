package com.volvo.dao;

import com.volvo.entity.KeyPerformanceIndicator;
import org.springframework.security.access.annotation.Secured;

import java.util.List;

@Secured(value = { "IS_AUTHENTICATED_ANONYMOUSLY" })
public interface KeyPerformanceIndicatorDAO {


    void save(KeyPerformanceIndicator m);

    void delete(KeyPerformanceIndicator m);

    void update(KeyPerformanceIndicator m);

    KeyPerformanceIndicator findById(int id);

    List findAll();

    long count();

    List<KeyPerformanceIndicator> getKeyPerformanceIndicator(Integer year, String plantName);
}
