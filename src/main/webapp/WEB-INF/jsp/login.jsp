<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title><spring:message code="account.login.title" /></title>
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #eee;
}
</style>
<spring:url value="/resources/defaultStyles.css" var="defaultStylesCSS" />
<spring:url value="/resources/bootstrap/css/bootstrap.css"
	var="bootstrapCSS" />
<spring:url value="/resources/bootstrap/js/bootstrap.js"
	var="bootstrapJS" />
<spring:url value="/resources/js/jquery-3.2.0.min.js" var="jqueryLib" />
<link href="${bootstrapCSS}" rel="stylesheet" />
<link href="${defaultStylesCSS}" rel="stylesheet" />


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<div class="container">

		<form method="POST" action="/login" class="form-signin">
			<h2 class="form-heading">
				<spring:message code="account.login.header" />
			</h2>
			<input name="username" type="text" class="form-control"
				placeholder="Username" autofocus="true" /> <input name="password"
				type="password" class="form-control" placeholder="Password" /> <input
				type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			<button class="btn btn-lg btn-primary btn-block" type="submit">
				<spring:message code="account.login.header" />
			</button>
			<h4 class="text-center">
				<a href="${contextPath}/registration"><spring:message
						code="account.login.createacc" /></a>
			</h4>
			<span>${message}</span>
		</form>

	</div>
	<script src="${jqueryLib}"></script>
	<script src="${bootstrapJS}"></script>
</body>
</html>