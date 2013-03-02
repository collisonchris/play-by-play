
<%@ page import="com.nfldraftscience.domain.Player" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'player.label', default: 'Player')}" />
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
				
					<g:if test="${playerInstance?.firstName}">
						<dt><g:message code="player.firstName.label" default="First Name" /></dt>
						
							<dd><g:fieldValue bean="${playerInstance}" field="firstName"/></dd>
						
					</g:if>
				
					<g:if test="${playerInstance?.lastName}">
						<dt><g:message code="player.lastName.label" default="Last Name" /></dt>
						
							<dd><g:fieldValue bean="${playerInstance}" field="lastName"/></dd>
						
					</g:if>
				
					<g:if test="${playerInstance?.number}">
						<dt><g:message code="player.number.label" default="Number" /></dt>
						
							<dd><g:fieldValue bean="${playerInstance}" field="number"/></dd>
						
					</g:if>
				
					<g:if test="${playerInstance?.pos}">
						<dt><g:message code="player.pos.label" default="Pos" /></dt>
						
							<dd><g:fieldValue bean="${playerInstance}" field="pos"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${playerInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${playerInstance?.id}">
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
