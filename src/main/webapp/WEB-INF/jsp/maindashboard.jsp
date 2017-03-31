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
.panel-heading a:after {
	font-family: 'Glyphicons Halflings';
	content: "\e114";
	float: right;
	color: grey;
}

.panel-heading a.collapsed:after {
	content: "\e080";
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

	<nav id="myNavbar"
		class="navbar navbar-default navbar-inverse navbar-fixed-top"
		role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Tutorial Republic</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#"><spring:message code="security.login.text" /></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="jumbotron">
		<div class="container-fluid">
			<div class="panel-group">
				<div class="panel panel-default">
					<div class="panel-body">
						<h2>
							<spring:message code="maindashboard.page.filterpanel.title" />
						</h2>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-body">
						<form:form id="dashboardForm" method="post"
							modelAttribute="dashboard">
							<div class="table-responsive">
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
											<td><form:select path="plantRegion"
													onchange="populate()">
													<form:options items="${plantRegionData}" />
												</form:select></td>
											<td><form:select path="orgLevel" onchange="populate()">
													<form:options items="${orgLevelData}" />
												</form:select></td>
										</tr>
									</tbody>
								</table>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="panel-group" id="accordion">
			<div class="row">
				<div class="col-xs-4">
					<div class="panel panel-info" id="safetyPanelCollapse">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-target="#safetyPanel"
									href="#qualityPanel"> <spring:message
										code="maindashboard.page.safety.panel.title" />
								</a>
							</h4>
						</div>
						<div id="safetyPanel" class="panel-collapse collapse in">
							<div class="panel-body">
								<center>
									<b><spring:message
											code="maindashboard.page.safety.panel.header" /></b>
								</center>
														<div class="container-fluid">
							<div class="row">
								<!-- Vertical Alignment -->
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<!-- Horizontal Alignment -->
											<div class="col-lg-12">${dashboard.valueType}</div>
											<div class="col-lg-12">fancy bar goes here</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<div class="col-lg-12">
												<spring:message code="maindashboard.page.avgyear" />
											</div>
											<div class="col-lg-12">
												<div class="col-lg-6">
													<spring:message code="maindashboard.page.target" />
												</div>
												<div class="col-lg-6">TARGET%</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="panel panel-info" id="qualityPanelCollapse">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-target="#qualityPanel"
							href="#qualityPanel"> <spring:message
								code="maindashboard.page.quality.panel.title" />
						</a>
					</h4>
				</div>
				<div id="qualityPanel" class="panel-collapse collapse in">
					<div class="panel-body">
						<center>
							<b><spring:message
									code="maindashboard.page.quality.panel.header" /></b>
						</center>
						<div class="container-fluid">
							<div class="row">
								<!-- Vertical Alignment -->
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<!-- Horizontal Alignment -->
											<div class="col-lg-12">${dashboard.valueType}</div>
											<div class="col-lg-12">fancy bar goes here</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<div class="col-lg-12">
												<spring:message code="maindashboard.page.avgyear" />
											</div>
											<div class="col-lg-12">
												<div class="col-lg-6">
													<spring:message code="maindashboard.page.target" />
												</div>
												<div class="col-lg-6">TARGET%</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="panel panel-info" id="deliveryPanelCollapse">
				<div class="panel-heading">

					<h4 class="panel-title">
						<a data-toggle="collapse" data-target="#deliveryPanel"
							href="#deliveryPanel"> <spring:message
								code="maindashboard.page.delivery.panel.title" />
						</a>
					</h4>
				</div>
				<div id="deliveryPanel" class="panel-collapse collapse in">
					<div class="panel-body">
						<center>
							<b><spring:message
									code="maindashboard.page.delivery.panel.header" /></b>
						</center>
						<div class="container-fluid">
							<div class="row">
								<!-- Vertical Alignment -->
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<!-- Horizontal Alignment -->
											<div class="col-lg-12">${dashboard.valueType}</div>
											<div class="col-lg-12">fancy bar goes here</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<div class="col-lg-12">
												<spring:message code="maindashboard.page.avgyear" />
											</div>
											<div class="col-lg-12">
												<div class="col-lg-6">
													<spring:message code="maindashboard.page.target" />
												</div>
												<div class="col-lg-6">TARGET%</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="panel panel-info" id="costPanelCollapse">
				<div class="panel-heading">

					<h4 class="panel-title">
						<a data-toggle="collapse" data-target="#costPanel"
							href="#qualityPanel"> <spring:message
								code="maindashboard.page.cost.panel.title" />
						</a>
					</h4>
				</div>
				<div id="costPanel" class="panel-collapse collapse in">
					<div class="panel-body">
						<center>
							<b><spring:message
									code="maindashboard.page.cost.panel.header"
									arguments="${dashboard.valueType}" /></b>
						</center>
						<div class="container-fluid">
							<div class="row">
								<!-- Vertical Alignment -->
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<!-- Horizontal Alignment -->
											<div class="col-lg-12">${dashboard.valueType}</div>
											<div class="col-lg-12">fancy bar goes here</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<div class="col-lg-12">
												<spring:message code="maindashboard.page.fy" />
											</div>
											<div class="col-lg-12">
												<div class="col-lg-6">
													<spring:message code="maindashboard.page.target" />
												</div>
												<div class="col-lg-6">TARGET%</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="panel panel-info" id="environmentPanelCollapse">
				<div class="panel-heading">

					<h4 class="panel-title">
						<a data-toggle="collapse" data-target="#environmentPanel"
							href="#environmentPanel"> <spring:message
								code="maindashboard.page.environment.panel.title" />
						</a>
					</h4>
				</div>
				<div id="environmentPanel" class="panel-collapse collapse in">
					<div class="panel-body">
						<center>
							<b><spring:message
									code="maindashboard.page.environment.panel.header" /></b>
						</center>
						<div class="container-fluid">
							<div class="row">
								<!-- Vertical Alignment -->
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<!-- Horizontal Alignment -->
											<div class="col-lg-12">${dashboard.valueType}</div>
											<div class="col-lg-12">fancy bar goes here</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<div class="col-lg-12">
												<spring:message  arguments="${dashboard.valueType}" code="maindashboard.page.mr"/>
											</div>
											<div class="col-lg-12">
												<div class="col-lg-6">
													<spring:message code="maindashboard.page.target" />
												</div>
												<div class="col-lg-6">TARGET%</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="panel panel-info" id="peoplePanelCollapse">
				<div class="panel-heading">

					<h4 class="panel-title">
						<a data-toggle="collapse" data-target="#peoplePanel"
							href="#peopleyPanel"> <spring:message
								code="maindashboard.page.people.panel.title" />
						</a>
					</h4>
				</div>
				<div id="peoplePanel" class="panel-collapse collapse in">
					<div class="panel-body">
						<center>
							<b><spring:message
									code="maindashboard.page.people.panel.header" /></b>
						</center>
						<div class="container-fluid">
							<div class="row">
								<!-- Vertical Alignment -->
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<!-- Horizontal Alignment -->
											<div class="col-lg-12">${dashboard.valueType}</div>
											<div class="col-lg-12">fancy bar goes here</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="container-fluid">
										<div class="row">
											<div class="col-lg-12">
												<spring:message code="maindashboard.page.fy" />
											</div>
											<div class="col-lg-12">
												<div class="col-lg-6">
													<spring:message code="maindashboard.page.target" />
												</div>
												<div class="col-lg-6">TARGET%</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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