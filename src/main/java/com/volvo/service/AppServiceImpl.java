package com.volvo.service;

import com.volvo.dao.AppDAO;
import io.swagger.annotations.Api;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.NotNull;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Service
@Transactional
@Path("/api/service")
@Api(value="Application Services")
public class AppServiceImpl implements AppService {
	static final Logger logger = Logger.getLogger(AppServiceImpl.class);

	@Autowired
	private AppDAO appDAO;

	@GET
	@Path("/dummy")
	@NotNull
	@Produces(MediaType.APPLICATION_JSON)
	@Override
	public Response dummyService() {
		return Response.status(200).entity("dummyresponse").build();
	}

}
