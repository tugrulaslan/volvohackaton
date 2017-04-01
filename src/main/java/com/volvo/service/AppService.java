package com.volvo.service;

import javax.ws.rs.core.Response;

import org.springframework.security.access.annotation.Secured;

import com.volvo.entity.AbstractEntity;
import com.volvo.entity.User;
@Secured(value = { "IS_AUTHENTICATED_ANONYMOUSLY" })
public interface AppService {
	public <T extends AbstractEntity> void save(T t);
	User findByUserName(String username);
	public Response dummyService();
}
