<%@ page import="com.nfldraftscience.domain.Play" %>



<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'down', 'error')} ">
	<label for="down">
		<g:message code="play.down.label" default="Down" />
		
	</label>
	<g:textField name="down" value="${playInstance?.down}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'driveNumber', 'error')} required">
	<label for="driveNumber">
		<g:message code="play.driveNumber.label" default="Drive Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="driveNumber" type="number" value="${playInstance.driveNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'isPass', 'error')} ">
	<label for="isPass">
		<g:message code="play.isPass.label" default="Is Pass" />
		
	</label>
	<g:checkBox name="isPass" value="${playInstance?.isPass}" />
</div>

<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'isRun', 'error')} ">
	<label for="isRun">
		<g:message code="play.isRun.label" default="Is Run" />
		
	</label>
	<g:checkBox name="isRun" value="${playInstance?.isRun}" />
</div>

<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="play.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${playInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'playNumber', 'error')} required">
	<label for="playNumber">
		<g:message code="play.playNumber.label" default="Play Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="playNumber" type="number" value="${playInstance.playNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'startingYardLine', 'error')} ">
	<label for="startingYardLine">
		<g:message code="play.startingYardLine.label" default="Starting Yard Line" />
		
	</label>
	<g:textField name="startingYardLine" value="${playInstance?.startingYardLine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'yardsToGo', 'error')} ">
	<label for="yardsToGo">
		<g:message code="play.yardsToGo.label" default="Yards To Go" />
		
	</label>
	<g:textField name="yardsToGo" value="${playInstance?.yardsToGo}"/>
</div>

