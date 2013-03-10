
<%@ page import="com.nfldraftscience.domain.PassPlay" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'passPlay.label', default: 'PassPlay')}" />
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
						
							<g:sortableColumn property="down" title="${message(code: 'passPlay.down.label', default: 'Down')}" />
						
							<th class="header"><g:message code="passPlay.drive.label" default="Drive" /></th>
						
							<g:sortableColumn property="location" title="${message(code: 'passPlay.location.label', default: 'Location')}" />
						
							<g:sortableColumn property="notes" title="${message(code: 'passPlay.notes.label', default: 'Notes')}" />
						
							<th class="header"><g:message code="passPlay.passer.label" default="Passer" /></th>
						
							<g:sortableColumn property="playNumber" title="${message(code: 'passPlay.playNumber.label', default: 'Play Number')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${passPlayInstanceList}" var="passPlayInstance">
						<tr>
						
							<td>${fieldValue(bean: passPlayInstance, field: "down")}</td>
						
							<td>${fieldValue(bean: passPlayInstance, field: "drive")}</td>
						
							<td>${fieldValue(bean: passPlayInstance, field: "location")}</td>
						
							<td>${fieldValue(bean: passPlayInstance, field: "notes")}</td>
						
							<td>${fieldValue(bean: passPlayInstance, field: "passer")}</td>
						
							<td>${fieldValue(bean: passPlayInstance, field: "playNumber")}</td>
						
							<td class="link">
								<g:link action="show" id="${passPlayInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${passPlayInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
