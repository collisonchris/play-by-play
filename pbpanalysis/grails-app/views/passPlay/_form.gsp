<%@ page import="com.nfldraftscience.domain.PassPlay" %>



<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'down', 'error')} ">
	<label for="down">
		<g:message code="passPlay.down.label" default="Down" />
		
	</label>
	<g:textField name="down" value="${passPlayInstance?.down}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'driveNumber', 'error')} required">
	<label for="driveNumber">
		<g:message code="passPlay.driveNumber.label" default="Drive Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="driveNumber" type="number" value="${passPlayInstance.driveNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="passPlay.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="location" from="${com.nfldraftscience.domain.Location?.values()}" keys="${com.nfldraftscience.domain.Location.values()*.name()}" required="" value="${passPlayInstance?.location?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="passPlay.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${passPlayInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'passer', 'error')} required">
	<label for="passer">
		<g:message code="passPlay.passer.label" default="Passer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="passer" name="passer.id" from="${com.nfldraftscience.domain.Player.list()}" optionKey="id" required="" value="${passPlayInstance?.passer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'playNumber', 'error')} required">
	<label for="playNumber">
		<g:message code="passPlay.playNumber.label" default="Play Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="playNumber" type="number" value="${passPlayInstance.playNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'route', 'error')} required">
	<label for="route">
		<g:message code="passPlay.route.label" default="Route" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="route" from="${com.nfldraftscience.domain.Route?.values()}" keys="${com.nfldraftscience.domain.Route.values()*.name()}" required="" value="${passPlayInstance?.route?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'startingYardLine', 'error')} ">
	<label for="startingYardLine">
		<g:message code="passPlay.startingYardLine.label" default="Starting Yard Line" />
		
	</label>
	<g:textField name="startingYardLine" value="${passPlayInstance?.startingYardLine}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'target', 'error')} required">
	<label for="target">
		<g:message code="passPlay.target.label" default="Target" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="target" name="target.id" from="${com.nfldraftscience.domain.Player.list()}" optionKey="id" required="" value="${passPlayInstance?.target?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'yardsGain', 'error')} required">
	<label for="yardsGain">
		<g:message code="passPlay.yardsGain.label" default="Yards Gain" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="yardsGain" type="number" value="${passPlayInstance.yardsGain}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'yardsTargeted', 'error')} required">
	<label for="yardsTargeted">
		<g:message code="passPlay.yardsTargeted.label" default="Yards Targeted" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="yardsTargeted" type="number" value="${passPlayInstance.yardsTargeted}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'yardsToGo', 'error')} ">
	<label for="yardsToGo">
		<g:message code="passPlay.yardsToGo.label" default="Yards To Go" />
		
	</label>
	<g:textField name="yardsToGo" value="${passPlayInstance?.yardsToGo}"/>
</div>

