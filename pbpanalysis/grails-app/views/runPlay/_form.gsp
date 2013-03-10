<%@ page import="com.nfldraftscience.domain.RunPlay" %>



<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'YAC', 'error')} required">
	<label for="YAC">
		<g:message code="runPlay.YAC.label" default="YAC" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="YAC" type="number" value="${runPlayInstance.YAC}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'ballcarrier', 'error')} required">
	<label for="ballcarrier">
		<g:message code="runPlay.ballcarrier.label" default="Ballcarrier" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ballcarrier" name="ballcarrier.id" from="${com.nfldraftscience.domain.Player.list()}" optionKey="id" required="" value="${runPlayInstance?.ballcarrier?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'down', 'error')} ">
	<label for="down">
		<g:message code="runPlay.down.label" default="Down" />
		
	</label>
	<g:textField name="down" value="${runPlayInstance?.down}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'drive', 'error')} required">
	<label for="drive">
		<g:message code="runPlay.drive.label" default="Drive" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="drive" name="drive.id" from="${com.nfldraftscience.domain.Drive.list()}" optionKey="id" required="" value="${runPlayInstance?.drive?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'locaton', 'error')} required">
	<label for="locaton">
		<g:message code="runPlay.locaton.label" default="Locaton" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="locaton" from="${com.nfldraftscience.domain.Location?.values()}" keys="${com.nfldraftscience.domain.Location.values()*.name()}" required="" value="${runPlayInstance?.locaton?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="runPlay.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${runPlayInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'playNumber', 'error')} required">
	<label for="playNumber">
		<g:message code="runPlay.playNumber.label" default="Play Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="playNumber" type="number" value="${runPlayInstance.playNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'runConcept', 'error')} required">
	<label for="runConcept">
		<g:message code="runPlay.runConcept.label" default="Run Concept" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="runConcept" from="${com.nfldraftscience.domain.RunConcepts?.values()}" keys="${com.nfldraftscience.domain.RunConcepts.values()*.name()}" required="" value="${runPlayInstance?.runConcept?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'yardsGained', 'error')} required">
	<label for="yardsGained">
		<g:message code="runPlay.yardsGained.label" default="Yards Gained" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="yardsGained" type="number" value="${runPlayInstance.yardsGained}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'yardsToGo', 'error')} ">
	<label for="yardsToGo">
		<g:message code="runPlay.yardsToGo.label" default="Yards To Go" />
		
	</label>
	<g:textField name="yardsToGo" value="${runPlayInstance?.yardsToGo}"/>
</div>

