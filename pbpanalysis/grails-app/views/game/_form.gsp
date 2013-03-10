<%@ page import="com.nfldraftscience.domain.Game" %>



<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="game.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${gameInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'drives', 'error')} ">
	<label for="drives">
		<g:message code="game.drives.label" default="Drives" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${gameInstance?.drives?}" var="d">
    <li><g:link controller="drive" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="drive" action="create" params="['game.id': gameInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'drive.label', default: 'Drive')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'opponent', 'error')} ">
	<label for="opponent">
		<g:message code="game.opponent.label" default="Opponent" />
		
	</label>
	<g:textField name="opponent" value="${gameInstance?.opponent}"/>
</div>

