package com.volvo.service;

import com.volvo.entity.Target;
import org.springframework.security.access.annotation.Secured;

import java.util.List;

@Secured(value = { "IS_AUTHENTICATED_ANONYMOUSLY" })
public interface Service1I {

    void save(Target t);

    void delete(Target t);

    void update(Target t);

    Target findById(int id);

    List findAll();

    int count();
}
