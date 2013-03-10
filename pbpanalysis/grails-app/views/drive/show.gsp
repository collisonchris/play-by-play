
<%@ page import="com.nfldraftscience.domain.Drive" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'drive.label', default: 'Drive')}" />
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
				
					<g:if test="${driveInstance?.driveNumber}">
						<dt><g:message code="drive.driveNumber.label" default="Drive Number" /></dt>
						
							<dd><g:fieldValue bean="${driveInstance}" field="driveNumber"/></dd>
						
					</g:if>
				
					<g:if test="${driveInstance?.game}">
						<dt><g:message code="drive.game.label" default="Game" /></dt>
						
							<dd><g:link controller="game" action="show" id="${driveInstance?.game?.id}">${driveInstance?.game?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${driveInstance?.offTurnover}">
						<dt><g:message code="drive.offTurnover.label" default="Off Turnover" /></dt>
						
							<dd><g:formatBoolean boolean="${driveInstance?.offTurnover}" /></dd>
						
					</g:if>
				
					<g:if test="${driveInstance?.plays}">
						<dt><g:message code="drive.plays.label" default="Plays" /></dt>
						
							<g:each in="${driveInstance.plays}" var="p">
							<dd><g:link controller="play" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${driveInstance?.startingYardLine}">
						<dt><g:message code="drive.startingYardLine.label" default="Starting Yard Line" /></dt>
						
							<dd><g:fieldValue bean="${driveInstance}" field="startingYardLine"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${driveInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${driveInstance?.id}">
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
