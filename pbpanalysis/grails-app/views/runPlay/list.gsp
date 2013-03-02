
<%@ page import="com.nfldraftscience.domain.RunPlay" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'runPlay.label', default: 'RunPlay')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<th class="header"><g:message code="runPlay.ballCarrier.label" default="Ball Carrier" /></th>
						
							<g:sortableColumn property="down" title="${message(code: 'runPlay.down.label', default: 'Down')}" />
						
							<g:sortableColumn property="driveNumber" title="${message(code: 'runPlay.driveNumber.label', default: 'Drive Number')}" />
						
							<g:sortableColumn property="gain" title="${message(code: 'runPlay.gain.label', default: 'Gain')}" />
						
							<g:sortableColumn property="locaton" title="${message(code: 'runPlay.locaton.label', default: 'Locaton')}" />
						
							<g:sortableColumn property="notes" title="${message(code: 'runPlay.notes.label', default: 'Notes')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${runPlayInstanceList}" var="runPlayInstance">
						<tr>
						
							<td>${fieldValue(bean: runPlayInstance, field: "ballCarrier")}</td>
						
							<td>${fieldValue(bean: runPlayInstance, field: "down")}</td>
						
							<td>${fieldValue(bean: runPlayInstance, field: "driveNumber")}</td>
						
							<td>${fieldValue(bean: runPlayInstance, field: "gain")}</td>
						
							<td>${fieldValue(bean: runPlayInstance, field: "locaton")}</td>
						
							<td>${fieldValue(bean: runPlayInstance, field: "notes")}</td>
						
							<td class="link">
								<g:link action="show" id="${runPlayInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${runPlayInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
