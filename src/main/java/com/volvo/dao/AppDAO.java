package com.volvo.dao;

import java.util.List;

import org.springframework.security.access.annotation.Secured;

import com.volvo.entity.AbstractEntity;
import com.volvo.entity.User;
@Secured(value = { "IS_AUTHENTICATED_ANONYMOUSLY" })
public interface AppDAO {
	public <T extends AbstractEntity> void save(T t);

	public <T extends AbstractEntity> void delete(T t);

	public <T extends AbstractEntity> void update(T t);

	public <T extends AbstractEntity> T findById(long id);

	public <T extends AbstractEntity> List<T> getAll();
	
	User findByUserName(String username);

}
