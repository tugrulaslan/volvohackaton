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
		<div class="row">
			<div class="col-xs-12 col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<spring:message code="kpi.page.newmetricpanel.heading" />
					</div>
					<div class="panel-body">
						<form:form id="kpiForm" method="post" modelAttribute="kpiObj"
							class="form-horizontal">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="form-group col-xs-12">
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label"><spring:message
											code="kpi.page.table.plantName" /></label>
									<div class="col-sm-10">
										<form:select path="orgLevelData" items="${kpiTypeData}"
											cssClass="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label"><spring:message
											code="kpi.page.table.kpisubCat" /></label>
									<div class="col-sm-10">
										<form:select path="kpiSubCategory" class="form-control">
											<form:options items="${kpiSubCategoryData}" itemValue="Id"
												itemLabel="name" />
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label"><spring:message
											code="kpi.page.table.kpiCat" /></label>
									<div class="col-sm-10">
										<form:select path="kpiCategory" class="form-control">
											<form:options items="${kpiCategoryData}" itemValue="Id"
												itemLabel="name" />
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label"><spring:message
											code="kpi.page.table.amount" /></label>
									<div class="col-sm-10">
										<form:input path="amount" class="form-control" />
									</div>
								</div>
								<button type="submit" class="btn btn-md btn-primary btn-block">
									<spring:message code="kpi.page.newkpi.button" />
								</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>

		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>Plant Name</th>
						<th>KPI Type</th>
						<th>KPI Category</th>
						<th>KPI Sub Category</th>
						<th>Amount</th>
						<th><spring:message code="crud.operations.delete" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allKPI}" var="var">
						<tr>
							<td>${var.id}</td>
							<td>${var.plantName}</td>
							<td>${var.kpiType}</td>
							<td>${var.kpiCategory.name}</td>
							<td>${var.kpiSubCategory.name}</td>
							<td>${var.amount}</td>
							<td><a href="<c:url value="/kpi/${var.id}" />"><spring:message
										code="crud.operations.delete" /></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>