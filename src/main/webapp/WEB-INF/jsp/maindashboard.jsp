<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title><spring:message code="maindashboard.page.title" /></title>
<spring:url value="/resources/bootstrap/css/bootstrap.css"
	var="bootstrapCSS" />
<spring:url value="/resources/bootstrap/js/bootstrap.js"
	var="bootstrapJS" />
<spring:url value="/resources/js/jquery-3.2.0.min.js" var="jqueryLib" />
<script>
	function populate($val) {
		var form = document.getElementById("dashboardForm");
		form.submit();
	}
</script>
<style type="text/css">
body {
	min-height: 2000px;
	padding-top: 70px;
}
</style>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap core CSS -->
<link href="${bootstrapCSS}" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">${projectName}</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/login/"><spring:message
								code="security.login.text" /></a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">
		<div class="jumbotron">
			<div class="panel-group">
				<div class="panel panel-default">
					<div class="panel-body">
						<spring:message code="maindashboard.page.filterpanel.title" />
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<form:form id="dashboardForm" method="post"
							modelAttribute="dashboard">
							<table class="table table-hover">
								<thead>
									<tr>
										<th><spring:message
												code="maindashboard.page.filterpanel.year" /></th>
										<th><spring:message
												code="maindashboard.page.filterpanel.month" /></th>
										<th><spring:message
												code="maindashboard.page.filterpanel.valuetype" /></th>
										<th><spring:message
												code="maindashboard.page.filterpanel.plantregion" /></th>
										<th><spring:message
												code="maindashboard.page.filterpanel.orglevel" /></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><form:select path="year" items="${yearData}"
												onchange="populate()" /></td>
										<td><form:select path="month" onchange="populate()">
												<form:options items="${monthData}" />
											</form:select></td>
										<td><form:select path="valueType" onchange="populate()">
												<form:options items="${valueTypeData}" />
											</form:select></td>
										<td><form:select path="plantRegion" onchange="populate()">
												<form:options items="${plantRegionData}" />
											</form:select></td>
										<td><form:select path="orgLevel" onchange="populate()">
												<form:options items="${orgLevelData}" />
											</form:select></td>
									</tr>
								</tbody>
							</table>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${jqueryLib}"></script>
	<script src="${bootstrapJS}"></script>
</body>
</html>