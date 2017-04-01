package com.volvo.dao;

import com.volvo.entity.KPISubCategory;
import org.springframework.security.access.annotation.Secured;

import java.util.List;

@Secured(value = { "IS_AUTHENTICATED_ANONYMOUSLY" })
public interface KPISubCategoryDAO {


    void save(KPISubCategory m);

    void delete(KPISubCategory m);

    void update(KPISubCategory m);

    KPISubCategory findById(int id);

    List findAll();

    long count();
}
