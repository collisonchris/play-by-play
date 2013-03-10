
<%@ page import="com.nfldraftscience.domain.Game" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
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
						
							<g:sortableColumn property="date" title="${message(code: 'game.date.label', default: 'Date')}" />
						
							<g:sortableColumn property="opponent" title="${message(code: 'game.opponent.label', default: 'Opponent')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${gameInstanceList}" var="gameInstance">
						<tr>
						
							<td><g:formatDate date="${gameInstance.date}" /></td>
						
							<td>${fieldValue(bean: gameInstance, field: "opponent")}</td>
						
							<td class="link">
								<g:link action="show" id="${gameInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${gameInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
