<%@ page import="com.nfldraftscience.domain.Drive" %>



<div class="fieldcontain ${hasErrors(bean: driveInstance, field: 'driveNumber', 'error')} required">
	<label for="driveNumber">
		<g:message code="drive.driveNumber.label" default="Drive Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="driveNumber" type="number" value="${driveInstance.driveNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: driveInstance, field: 'game', 'error')} required">
	<label for="game">
		<g:message code="drive.game.label" default="Game" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="game" name="game.id" from="${com.nfldraftscience.domain.Game.list()}" optionKey="id" required="" value="${driveInstance?.game?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: driveInstance, field: 'offTurnover', 'error')} ">
	<label for="offTurnover">
		<g:message code="drive.offTurnover.label" default="Off Turnover" />
		
	</label>
	<g:checkBox name="offTurnover" value="${driveInstance?.offTurnover}" />
</div>

<div class="fieldcontain ${hasErrors(bean: driveInstance, field: 'plays', 'error')} ">
	<label for="plays">
		<g:message code="drive.plays.label" default="Plays" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${driveInstance?.plays?}" var="p">
    <li><g:link controller="play" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="play" action="create" params="['drive.id': driveInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'play.label', default: 'Play')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: driveInstance, field: 'startingYardLine', 'error')} ">
	<label for="startingYardLine">
		<g:message code="drive.startingYardLine.label" default="Starting Yard Line" />
		
	</label>
	<g:textField name="startingYardLine" value="${driveInstance?.startingYardLine}"/>
</div>

