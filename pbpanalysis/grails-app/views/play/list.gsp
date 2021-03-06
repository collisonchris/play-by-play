
<%@ page import="com.nfldraftscience.domain.Play" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'play.label', default: 'Play')}" />
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
						
							<g:sortableColumn property="down" title="${message(code: 'play.down.label', default: 'Down')}" />
						
							<th class="header"><g:message code="play.drive.label" default="Drive" /></th>
						
							<g:sortableColumn property="notes" title="${message(code: 'play.notes.label', default: 'Notes')}" />
						
							<g:sortableColumn property="playNumber" title="${message(code: 'play.playNumber.label', default: 'Play Number')}" />
						
							<g:sortableColumn property="yardsGained" title="${message(code: 'play.yardsGained.label', default: 'Yards Gained')}" />
						
							<g:sortableColumn property="yardsToGo" title="${message(code: 'play.yardsToGo.label', default: 'Yards To Go')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${playInstanceList}" var="playInstance">
						<tr>
						
							<td>${fieldValue(bean: playInstance, field: "down")}</td>
						
							<td>${fieldValue(bean: playInstance, field: "drive")}</td>
						
							<td>${fieldValue(bean: playInstance, field: "notes")}</td>
						
							<td>${fieldValue(bean: playInstance, field: "playNumber")}</td>
						
							<td>${fieldValue(bean: playInstance, field: "yardsGained")}</td>
						
							<td>${fieldValue(bean: playInstance, field: "yardsToGo")}</td>
						
							<td class="link">
								<g:link action="show" id="${playInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${playInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
