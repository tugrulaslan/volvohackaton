package com.volvo.service;

import javax.ws.rs.core.Response;

import org.springframework.security.access.annotation.Secured;
@Secured(value = { "IS_AUTHENTICATED_ANONYMOUSLY" })
public interface AppService {

	public Response dummyService();
}
