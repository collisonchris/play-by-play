<%@ page import="com.nfldraftscience.domain.Play" %>



<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'down', 'error')} ">
	<label for="down">
		<g:message code="play.down.label" default="Down" />
		
	</label>
	<g:textField name="down" value="${playInstance?.down}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'drive', 'error')} required">
	<label for="drive">
		<g:message code="play.drive.label" default="Drive" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="drive" name="drive.id" from="${com.nfldraftscience.domain.Drive.list()}" optionKey="id" required="" value="${playInstance?.drive?.id}" class="many-to-one"/>
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

<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'yardsGained', 'error')} required">
	<label for="yardsGained">
		<g:message code="play.yardsGained.label" default="Yards Gained" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="yardsGained" type="number" value="${playInstance.yardsGained}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'yardsToGo', 'error')} ">
	<label for="yardsToGo">
		<g:message code="play.yardsToGo.label" default="Yards To Go" />
		
	</label>
	<g:textField name="yardsToGo" value="${playInstance?.yardsToGo}"/>
</div>

