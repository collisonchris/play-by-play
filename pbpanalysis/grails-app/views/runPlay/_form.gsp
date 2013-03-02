<%@ page import="com.nfldraftscience.domain.RunPlay" %>



<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'ballCarrier', 'error')} required">
	<label for="ballCarrier">
		<g:message code="runPlay.ballCarrier.label" default="Ball Carrier" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ballCarrier" name="ballCarrier.id" from="${com.nfldraftscience.domain.Player.list()}" optionKey="id" required="" value="${runPlayInstance?.ballCarrier?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'down', 'error')} ">
	<label for="down">
		<g:message code="runPlay.down.label" default="Down" />
		
	</label>
	<g:textField name="down" value="${runPlayInstance?.down}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'driveNumber', 'error')} required">
	<label for="driveNumber">
		<g:message code="runPlay.driveNumber.label" default="Drive Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="driveNumber" type="number" value="${runPlayInstance.driveNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'gain', 'error')} required">
	<label for="gain">
		<g:message code="runPlay.gain.label" default="Gain" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gain" type="number" value="${runPlayInstance.gain}" required=""/>
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

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'startingYardLine', 'error')} ">
	<label for="startingYardLine">
		<g:message code="runPlay.startingYardLine.label" default="Starting Yard Line" />
		
	</label>
	<g:textField name="startingYardLine" value="${runPlayInstance?.startingYardLine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'yardsToGo', 'error')} ">
	<label for="yardsToGo">
		<g:message code="runPlay.yardsToGo.label" default="Yards To Go" />
		
	</label>
	<g:textField name="yardsToGo" value="${runPlayInstance?.yardsToGo}"/>
</div>

