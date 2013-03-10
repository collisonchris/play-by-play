
<%@ page import="com.nfldraftscience.domain.RunPlay" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'runPlay.label', default: 'RunPlay')}" />
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
				
					<g:if test="${runPlayInstance?.YAC}">
						<dt><g:message code="runPlay.YAC.label" default="YAC" /></dt>
						
							<dd><g:fieldValue bean="${runPlayInstance}" field="YAC"/></dd>
						
					</g:if>
				
					<g:if test="${runPlayInstance?.ballcarrier}">
						<dt><g:message code="runPlay.ballcarrier.label" default="Ballcarrier" /></dt>
						
							<dd><g:link controller="player" action="show" id="${runPlayInstance?.ballcarrier?.id}">${runPlayInstance?.ballcarrier?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${runPlayInstance?.down}">
						<dt><g:message code="runPlay.down.label" default="Down" /></dt>
						
							<dd><g:fieldValue bean="${runPlayInstance}" field="down"/></dd>
						
					</g:if>
				
					<g:if test="${runPlayInstance?.drive}">
						<dt><g:message code="runPlay.drive.label" default="Drive" /></dt>
						
							<dd><g:link controller="drive" action="show" id="${runPlayInstance?.drive?.id}">${runPlayInstance?.drive?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${runPlayInstance?.locaton}">
						<dt><g:message code="runPlay.locaton.label" default="Locaton" /></dt>
						
							<dd><g:fieldValue bean="${runPlayInstance}" field="locaton"/></dd>
						
					</g:if>
				
					<g:if test="${runPlayInstance?.notes}">
						<dt><g:message code="runPlay.notes.label" default="Notes" /></dt>
						
							<dd><g:fieldValue bean="${runPlayInstance}" field="notes"/></dd>
						
					</g:if>
				
					<g:if test="${runPlayInstance?.playNumber}">
						<dt><g:message code="runPlay.playNumber.label" default="Play Number" /></dt>
						
							<dd><g:fieldValue bean="${runPlayInstance}" field="playNumber"/></dd>
						
					</g:if>
				
					<g:if test="${runPlayInstance?.runConcept}">
						<dt><g:message code="runPlay.runConcept.label" default="Run Concept" /></dt>
						
							<dd><g:fieldValue bean="${runPlayInstance}" field="runConcept"/></dd>
						
					</g:if>
				
					<g:if test="${runPlayInstance?.yardsGained}">
						<dt><g:message code="runPlay.yardsGained.label" default="Yards Gained" /></dt>
						
							<dd><g:fieldValue bean="${runPlayInstance}" field="yardsGained"/></dd>
						
					</g:if>
				
					<g:if test="${runPlayInstance?.yardsToGo}">
						<dt><g:message code="runPlay.yardsToGo.label" default="Yards To Go" /></dt>
						
							<dd><g:fieldValue bean="${runPlayInstance}" field="yardsToGo"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${runPlayInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${runPlayInstance?.id}">
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
