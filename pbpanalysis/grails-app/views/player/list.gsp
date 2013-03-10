
<%@ page import="com.nfldraftscience.domain.Player" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
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
						
							<g:sortableColumn property="firstName" title="${message(code: 'player.firstName.label', default: 'First Name')}" />
						
							<g:sortableColumn property="height" title="${message(code: 'player.height.label', default: 'Height')}" />
						
							<g:sortableColumn property="lastName" title="${message(code: 'player.lastName.label', default: 'Last Name')}" />
						
							<g:sortableColumn property="number" title="${message(code: 'player.number.label', default: 'Number')}" />
						
							<g:sortableColumn property="pos" title="${message(code: 'player.pos.label', default: 'Pos')}" />
						
							<g:sortableColumn property="weight" title="${message(code: 'player.weight.label', default: 'Weight')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${playerInstanceList}" var="playerInstance">
						<tr>
						
							<td>${fieldValue(bean: playerInstance, field: "firstName")}</td>
						
							<td>${fieldValue(bean: playerInstance, field: "height")}</td>
						
							<td>${fieldValue(bean: playerInstance, field: "lastName")}</td>
						
							<td>${fieldValue(bean: playerInstance, field: "number")}</td>
						
							<td>${fieldValue(bean: playerInstance, field: "pos")}</td>
						
							<td>${fieldValue(bean: playerInstance, field: "weight")}</td>
						
							<td class="link">
								<g:link action="show" id="${playerInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${playerInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
