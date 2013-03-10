
<%@ page import="com.nfldraftscience.domain.Game" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'game.label', default: 'Game')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
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
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${gameInstance?.date}">
						<dt><g:message code="game.date.label" default="Date" /></dt>
						
							<dd><g:formatDate date="${gameInstance?.date}" /></dd>
						
					</g:if>
				
					<g:if test="${gameInstance?.drives}">
						<dt><g:message code="game.drives.label" default="Drives" /></dt>
						
							<g:each in="${gameInstance.drives}" var="d">
							<dd><g:link controller="drive" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${gameInstance?.opponent}">
						<dt><g:message code="game.opponent.label" default="Opponent" /></dt>
						
							<dd><g:fieldValue bean="${gameInstance}" field="opponent"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${gameInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${gameInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
