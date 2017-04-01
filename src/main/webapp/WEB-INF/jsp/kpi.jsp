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
		<h3>
			<p class="text-center">
				<spring:message code="kpi.page.newmetricpanel.heading" />
			</p>
		</h3>
		<form:form id="kpiForm" method="post" modelAttribute="kpiObj"
			class="form-horizontal">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label"><spring:message
						code="kpi.page.table.plantName" /></label>
				<div class="col-sm-10">
					<form:select path="orgLevelData" items="${kpiTypeData}" cssClass="form-control" />
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
		</form:form>

	</div>
</body>
</html>