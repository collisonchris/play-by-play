
<%@ page import="com.nfldraftscience.domain.Play" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'play.label', default: 'Play')}" />
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
				
					<g:if test="${playInstance?.down}">
						<dt><g:message code="play.down.label" default="Down" /></dt>
						
							<dd><g:fieldValue bean="${playInstance}" field="down"/></dd>
						
					</g:if>
				
					<g:if test="${playInstance?.driveNumber}">
						<dt><g:message code="play.driveNumber.label" default="Drive Number" /></dt>
						
							<dd><g:fieldValue bean="${playInstance}" field="driveNumber"/></dd>
						
					</g:if>
				
					<g:if test="${playInstance?.isPass}">
						<dt><g:message code="play.isPass.label" default="Is Pass" /></dt>
						
							<dd><g:formatBoolean boolean="${playInstance?.isPass}" /></dd>
						
					</g:if>
				
					<g:if test="${playInstance?.isRun}">
						<dt><g:message code="play.isRun.label" default="Is Run" /></dt>
						
							<dd><g:formatBoolean boolean="${playInstance?.isRun}" /></dd>
						
					</g:if>
				
					<g:if test="${playInstance?.notes}">
						<dt><g:message code="play.notes.label" default="Notes" /></dt>
						
							<dd><g:fieldValue bean="${playInstance}" field="notes"/></dd>
						
					</g:if>
				
					<g:if test="${playInstance?.playNumber}">
						<dt><g:message code="play.playNumber.label" default="Play Number" /></dt>
						
							<dd><g:fieldValue bean="${playInstance}" field="playNumber"/></dd>
						
					</g:if>
				
					<g:if test="${playInstance?.startingYardLine}">
						<dt><g:message code="play.startingYardLine.label" default="Starting Yard Line" /></dt>
						
							<dd><g:fieldValue bean="${playInstance}" field="startingYardLine"/></dd>
						
					</g:if>
				
					<g:if test="${playInstance?.yardsToGo}">
						<dt><g:message code="play.yardsToGo.label" default="Yards To Go" /></dt>
						
							<dd><g:fieldValue bean="${playInstance}" field="yardsToGo"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${playInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${playInstance?.id}">
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
