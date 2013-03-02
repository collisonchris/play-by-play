<%@ page import="com.nfldraftscience.domain.Player" %>



<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="player.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${playerInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="player.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${playerInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="player.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" value="${playerInstance.number}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'pos', 'error')} required">
	<label for="pos">
		<g:message code="player.pos.label" default="Pos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="pos" from="${com.nfldraftscience.domain.Position?.values()}" keys="${com.nfldraftscience.domain.Position.values()*.name()}" required="" value="${playerInstance?.pos?.name()}"/>
</div>

