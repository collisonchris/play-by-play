
<%@ page import="com.nfldraftscience.domain.PassPlay" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'passPlay.label', default: 'PassPlay')}" />
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
				
					<g:if test="${passPlayInstance?.down}">
						<dt><g:message code="passPlay.down.label" default="Down" /></dt>
						
							<dd><g:fieldValue bean="${passPlayInstance}" field="down"/></dd>
						
					</g:if>
				
					<g:if test="${passPlayInstance?.drive}">
						<dt><g:message code="passPlay.drive.label" default="Drive" /></dt>
						
							<dd><g:link controller="drive" action="show" id="${passPlayInstance?.drive?.id}">${passPlayInstance?.drive?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${passPlayInstance?.location}">
						<dt><g:message code="passPlay.location.label" default="Location" /></dt>
						
							<dd><g:fieldValue bean="${passPlayInstance}" field="location"/></dd>
						
					</g:if>
				
					<g:if test="${passPlayInstance?.notes}">
						<dt><g:message code="passPlay.notes.label" default="Notes" /></dt>
						
							<dd><g:fieldValue bean="${passPlayInstance}" field="notes"/></dd>
						
					</g:if>
				
					<g:if test="${passPlayInstance?.passer}">
						<dt><g:message code="passPlay.passer.label" default="Passer" /></dt>
						
							<dd><g:link controller="player" action="show" id="${passPlayInstance?.passer?.id}">${passPlayInstance?.passer?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${passPlayInstance?.playNumber}">
						<dt><g:message code="passPlay.playNumber.label" default="Play Number" /></dt>
						
							<dd><g:fieldValue bean="${passPlayInstance}" field="playNumber"/></dd>
						
					</g:if>
				
					<g:if test="${passPlayInstance?.route}">
						<dt><g:message code="passPlay.route.label" default="Route" /></dt>
						
							<dd><g:fieldValue bean="${passPlayInstance}" field="route"/></dd>
						
					</g:if>
				
					<g:if test="${passPlayInstance?.target}">
						<dt><g:message code="passPlay.target.label" default="Target" /></dt>
						
							<dd><g:link controller="player" action="show" id="${passPlayInstance?.target?.id}">${passPlayInstance?.target?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${passPlayInstance?.yardsGained}">
						<dt><g:message code="passPlay.yardsGained.label" default="Yards Gained" /></dt>
						
							<dd><g:fieldValue bean="${passPlayInstance}" field="yardsGained"/></dd>
						
					</g:if>
				
					<g:if test="${passPlayInstance?.yardsTargeted}">
						<dt><g:message code="passPlay.yardsTargeted.label" default="Yards Targeted" /></dt>
						
							<dd><g:fieldValue bean="${passPlayInstance}" field="yardsTargeted"/></dd>
						
					</g:if>
				
					<g:if test="${passPlayInstance?.yardsToGo}">
						<dt><g:message code="passPlay.yardsToGo.label" default="Yards To Go" /></dt>
						
							<dd><g:fieldValue bean="${passPlayInstance}" field="yardsToGo"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${passPlayInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${passPlayInstance?.id}">
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
