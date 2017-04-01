<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

<script language="JavaScript" type="text/javascript">
	function populate() {
		var form = document.getElementById("dashboardForm");
		form.submit();
	}
</script>
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
	<div class="jumbotron">
		<div class="container-fluid">
			<h2>
				<p class="text-center">
					<spring:message code="maindashboard.page.filterpanel.title" />
				</p>
			</h2>
			<form:form id="dashboardForm" method="post"
				modelAttribute="dashboard">
				<div class="row">
					<div class="col-md-5ths col-xs-6">
						<div class="row">
							<div class="col-xs-6 col-md-4">
								<spring:message code="maindashboard.page.filterpanel.year" />
							</div>
							<div class="col-xs-6 col-md-4">
								<form:select path="year" items="${yearData}"
									onchange="populate()" class="selectpicker" />
							</div>
						</div>
					</div>
					<div class="col-md-5ths col-xs-6">
						<div class="row">
							<div class="col-xs-6 col-md-4">
								<spring:message code="maindashboard.page.filterpanel.month" />
							</div>
							<div class="col-xs-6 col-md-4">
								<form:select path="month" onchange="populate()"
									class="selectpicker">
									<form:options items="${monthData}" />
								</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-5ths col-xs-6">
						<spring:message code="maindashboard.page.filterpanel.valuetype" />
						<form:select path="valueType" onchange="populate()"
							class="selectpicker">
							<form:options items="${valueTypeData}" />
						</form:select>
					</div>
					<div class="col-md-5ths col-xs-6">
						<div class="row">
							<div class="col-xs-6 col-md-4">
								<spring:message
									code="maindashboard.page.filterpanel.plantregion" />
							</div>
							<div class="col-xs-6 col-md-4">
								<form:select path="plantRegion" onchange="populate()"
									class="selectpicker">
									<form:options items="${plantRegionData}" />
								</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-5ths col-xs-6">
						<div class="row">
							<div class="col-xs-6 col-md-4">
								<spring:message code="maindashboard.page.filterpanel.orglevel" />
							</div>
							<div class="col-xs-6 col-md-4">
								<form:select path="orgLevel" onchange="populate()"
									class="selectpicker">
									<form:options items="${orgLevelData}" />
								</form:select>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<div class="container-fluid" style="${showDataPanel}">
		<div class="row">
			<div class="panel-group" id="accordion">
				<!-- Safety Panel Begin -->
				<div class="col-xs-6 col-md-4">
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
								<strong><p class="text-center">
										<spring:message code="maindashboard.page.safety.panel.header" />
									</p></strong>
								<!-- Safety Panel Content Begin -->
								<div class="row">
									<div class="col-xs-6">
										<p class="text-center">
											<strong><spring:message
													code="maindashboard.page.currval" />
												</strong>
										</p>
										<div id="gaugeDemo" class="gauge gauge-big gauge-green">
											<div class="gauge-arrow" data-percentage="80"></div>
										</div>
									</div>
									<div class="col-xs-6">
										<strong><p class="text-right">
												<spring:message code="maindashboard.page.avgyear" />
											</p></strong>
										<div class="row">
											<div class="col-xs-6">
												<p class="text-right">
													<spring:message code="maindashboard.page.target" />
												</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">${resultObj.targetThisYear}%</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2016</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">${resultObj.targetThisYearMinus1}</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2015</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">${resultObj.targetThisYearMinus2}</p>
											</div>
										</div>
									</div>
								</div>
								<!-- Safety Panel Content End -->
							</div>
						</div>
					</div>
				</div>
				<!-- Safety Panel End -->
				<!-- Quality Panel Begin -->
				<div class="col-xs-6 col-md-4">
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
								<strong><p class="text-center">
										<spring:message code="maindashboard.page.quality.panel.header" />
									</p></strong>
								<!-- Quality Panel Content Begin -->
								<div class="row">
									<div class="col-xs-6">
										<p class="text-center">
											<strong><spring:message
													code="maindashboard.page.currval" /> 48%</strong>
										</p>
										<div id="gaugeDemo" class="gauge gauge-big gauge-green">
											<div class="gauge-arrow" data-percentage="40"></div>
										</div>
									</div>
									<div class="col-xs-6">
										<strong><p class="text-right">
												<spring:message code="maindashboard.page.avgyear" />
											</p></strong>
										<div class="row">
											<div class="col-xs-6">
												<p class="text-right">
													<spring:message code="maindashboard.page.target" />
												</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">48%</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2016</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">9.6%</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2015</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">6.6%</p>
											</div>
										</div>
									</div>
								</div>
								<!-- Quality Panel Content End -->
							</div>
						</div>
					</div>
				</div>
				<!-- Quality Panel End -->
				<!-- Delivery Panel Begin -->
				<div class="col-xs-6 col-md-4">
					<div class="panel panel-info" id="deliveryPanelCollapse">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-target="#deliveryPanel"
									href="#qualityPanel"> <spring:message
										code="maindashboard.page.delivery.panel.title" />
								</a>
							</h4>
						</div>
						<div id="deliveryPanel" class="panel-collapse collapse in">
							<div class="panel-body">
								<strong><p class="text-center">
										<spring:message
											code="maindashboard.page.delivery.panel.header" />
									</p></strong>
								<!-- Delivery Panel Content Begin -->
								<div class="row">
									<div class="col-xs-6">
										<p class="text-center">
											<strong><spring:message
													code="maindashboard.page.currval" /> 90%</strong>
										</p>
										<div id="gaugeDemo" class="gauge gauge-big gauge-green">
											<div class="gauge-arrow" data-percentage="15"></div>
										</div>
									</div>
									<div class="col-xs-6">
										<strong><p class="text-right">
												<spring:message code="maindashboard.page.avgyear" />
											</p></strong>
										<div class="row">
											<div class="col-xs-6">
												<p class="text-right">
													<spring:message code="maindashboard.page.target" />
												</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">90%</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2016</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">3,5%</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2015</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">${resultObj.targetThisYearMinus2}</p>
											</div>
										</div>
									</div>
								</div>
								<!-- Delivery Panel Content End -->
							</div>
						</div>
					</div>
				</div>
				<!-- Delivery Panel End -->
				<!-- Cost Panel Begin -->
				<div class="col-xs-6 col-md-4">
					<div class="panel panel-info" id="costPanelCollapse">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-target="#costPanel"
									href="#costPanel"> <spring:message
										code="maindashboard.page.cost.panel.title" />
								</a>
							</h4>
						</div>
						<div id="costPanel" class="panel-collapse collapse in">
							<div class="panel-body">
								<strong><p class="text-center">
										<spring:message code="maindashboard.page.cost.panel.header"
											arguments="${dashboard.valueType}" />
									</p></strong>
								<!-- Cost Panel Content Begin -->
								<div class="row">
									<div class="col-xs-6">
										<p class="text-center">
											<strong><spring:message
													code="maindashboard.page.currval" /> 1 010 274</strong>
										</p>
										<div id="gaugeDemo" class="gauge gauge-big gauge-green">
											<div class="gauge-arrow" data-percentage="68"></div>
										</div>
									</div>
									<div class="col-xs-6">
										<strong><p class="text-right">
												<spring:message code="maindashboard.page.fy" />
											</p></strong>
										<div class="row">
											<div class="col-xs-6">
												<p class="text-right">
													<spring:message code="maindashboard.page.target" />
												</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">68%</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2016</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">7.6%</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2015</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2.3%</p>
											</div>
										</div>
									</div>
								</div>
								<!-- Cost Panel Content End -->
							</div>
						</div>
					</div>
				</div>
				<!-- Cost Panel End -->
				<!-- Environment Panel Begin -->
				<div class="col-xs-6 col-md-4">
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
								<strong><p class="text-center">
										<spring:message code="maindashboard.page.currval" />
										12 MR
									</p></strong>
								<!-- Environment Panel Content Begin -->
								<div class="row">
									<div class="col-xs-6">
										<p class="text-center">
											<strong>${dashboard.valueType}</strong>
										</p>
										<div id="gaugeDemo" class="gauge gauge-big gauge-green">
											<div class="gauge-arrow" data-percentage="77"></div>
										</div>
									</div>
									<div class="col-xs-6">
										<strong><p class="text-right">
												<spring:message arguments="${dashboard.valueType}"
													code="maindashboard.page.mr" />
											</p></strong>
										<div class="row">
											<div class="col-xs-6">
												<p class="text-right">
													<spring:message code="maindashboard.page.target" />
												</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">77%</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2016</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">${resultObj.targetThisYearMinus1}</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2015</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">7.6%</p>
											</div>
										</div>
									</div>
								</div>
								<!-- Environment Panel Content End -->
							</div>
						</div>
					</div>
				</div>
				<!-- Environment Panel End -->
				<!-- People Panel Begin -->
				<div class="col-xs-6 col-md-4">
					<div class="panel panel-info" id="peoplePanelCollapse">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-target="#peoplePanel"
									href="#peoplePanel"> <spring:message
										code="maindashboard.page.people.panel.title" />
								</a>
							</h4>
						</div>
						<div id="peoplePanel" class="panel-collapse collapse in">
							<div class="panel-body">
								<strong><p class="text-center">
										<spring:message code="maindashboard.page.currval" />
										95%
									</p></strong>
								<!-- People Panel Content Begin -->
								<div class="row">
									<div class="col-xs-6">
										<p class="text-center">
											<strong>${dashboard.valueType}</strong>
										</p>
										<div id="gaugeDemo" class="gauge gauge-big gauge-green">
											<div class="gauge-arrow" data-percentage="95"></div>
										</div>
									</div>
									<div class="col-xs-6">
										<strong><p class="text-right">
												<spring:message code="maindashboard.page.fy" />
											</p></strong>
										<div class="row">
											<div class="col-xs-6">
												<p class="text-right">
													<spring:message code="maindashboard.page.target" />
												</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">95%</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2016</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">6.8%</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">2015</p>
											</div>
											<div class="col-xs-6">
												<p class="text-right">9.6%</p>
											</div>
										</div>
									</div>
								</div>
								<!-- People Panel Content End -->
							</div>
						</div>
					</div>
				</div>
				<!-- People Panel End -->
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#gaugeDemo .gauge-arrow').cmGauge();
		});
	</script>
</body>
</html>