<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<spring:url value="/resources/defaultStyles.css" var="defaultStylesCSS" />
<spring:url value="/resources/bootstrap/css/bootstrap.css"
	var="bootstrapCSS" />
<spring:url value="/resources/bootstrap/js/bootstrap.js"
	var="bootstrapJS" />

<spring:url value="/resources/bootstrap-select/css/bootstrap-select.css"
	var="bootstrapSelectCSS" />
<spring:url value="/resources/bootstrap-select/js/bootstrap-select.js"
	var="bootstrapSelectJS" />

<spring:url value="/resources/cmgauge/css/cmGauge.css" var="cmGaugeCSS" />
<spring:url value="/resources/cmgauge/js/cmGauge.js" var="cmGaugeJS" />

<spring:url value="/resources/js/jquery-3.2.0.min.js" var="jqueryLib" />

<spring:url value="/resources/images/volvo.png" var="volvoLogo" />
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap core CSS -->
<link href="${bootstrapCSS}" rel="stylesheet" />
<link href="${defaultStylesCSS}" rel="stylesheet" />
<link href="${bootstrapSelectCSS}" rel="stylesheet" />
<link href="${cmGaugeCSS}" rel="stylesheet" />

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
				<a class="navbar-brand" href="#"><img src="${volvoLogo}" /></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="nav navbar-nav">
					<li><a href="/kpi"><spring:message code="navbar.kpi" /></a></li>
					<li><a href="/metrics"><spring:message
								code="navbar.metrics" /></a></li>
					<li><a href="/maindashboard"><spring:message
								code="navbar.maindashboard" /></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${jqueryLib}"></script>
	<script src="${bootstrapJS}"></script>
	<script src="${bootstrapSelectJS}"></script>
	<script src="${cmGaugeJS}"></script>
</body>
</html>