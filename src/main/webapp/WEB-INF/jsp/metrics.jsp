<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%@ include file="/WEB-INF/jsp/header.jsp"%>
<body>
	<div class="container-fluid" style="padding-top: 55px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<spring:message code="metric.page.newmetricpanel.heading" />
			</div>
			<div class="panel-body">
				<form:form id="metricForm" method="post" modelAttribute="metric">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-group col-sm-3">
						<spring:message code="metric.page.table.metric" />
						<form:input path="name" class="form-control" autofocus="true" />
						&nbsp;
						<button class="btn btn-md btn-primary btn-block" type="submit">
							<spring:message code="metric.page.newmetric.button" />
						</button>
					</div>
				</form:form>
			</div>
		</div>

		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><spring:message code="metric.page.table.id" /></th>
						<th><spring:message code="metric.page.table.metric" /></th>
						<th><spring:message code="crud.operations.delete" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${metricData}" var="var">
						<tr>
							<td>${var.id}</td>
							<td>${var.name}</td>
							<td><a href="<c:url value="/metrics/${var.id}" />"><spring:message
										code="crud.operations.delete" /></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>