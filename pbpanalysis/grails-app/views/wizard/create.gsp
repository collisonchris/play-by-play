<%@ page import="com.nfldraftscience.domain.RunPlay" %>
<%@ page import="com.nfldraftscience.domain.PassPlay" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:javascript library="jquery" plugin="jquery"/>
		<g:set var="entityName" value="${message(code: 'play.label', default: 'Play')}" />
		<title>Play Data Entry Wizard</title>
		<script>
			function hideShowPlay(caller) {
				var rdiv = $("#runDiv");
				var pdiv = $("#passDiv");
				console.log(caller.name);
				if(caller.name == 'run') {
					rdiv.toggle();
				}

				if(caller.name == 'pass') {
					pdiv.toggle();
				}
				
			}
		</script>
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
						<li class="active">
							<g:link class="create" action="create">
								<i class="icon-plus icon-white"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.create.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${runPlayInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${runPlayInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<g:hasErrors bean="${passPlayInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${passPlayInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="create" >
						<div id="playheader" style="display:inline">
							<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'drive', 'error')} required">
								<label for="drive">
									<g:message code="play.drive.label" default="Drive" />
									<span class="required-indicator">*</span>
								</label>
								<g:select id="drive" name="drive.id" from="${com.nfldraftscience.domain.Drive.list()}" optionKey="id" required="" value="${playInstance?.drive?.id}" class="many-to-one"/>
							</div>
							
							<div id="downHud" style="display:inline">
								<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'down', 'error')} " >
									<label for="down">
										<g:message code="play.down.label" default="Down" />
										
									</label>
									<g:textField name="down" value="${playInstance?.down}" display="float:right"/>
								</div>
								
								<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'yardsToGo', 'error')} ">
									<label for="yardsToGo">
										<g:message code="play.yardsToGo.label" default="Yards To Go" />
										
									</label>
									<g:textField name="yardsToGo" value="${playInstance?.yardsToGo}"/>
								</div>
							</div>
							
						</div>
						<fieldset>
							<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'notes', 'error')} ">
								<label for="notes">
									<g:message code="play.notes.label" default="Notes" />
									
								</label>
								<g:textArea name="notes" />
							</div>

							<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'playNumber', 'error')} required">
								<label for="playNumber">
									<g:message code="play.playNumber.label" default="Play Number" />
									<span class="required-indicator">*</span>
								</label>
								<g:field name="playNumber" type="number"  required=""/>
							</div>

							<div class="fieldcontain ${hasErrors(bean: playInstance, field: 'yardsGained', 'error')} required">
								<label for="yardsGained">
									<g:message code="play.yardsGained.label" default="Yards Gained" />
									<span class="required-indicator">*</span>
								</label>
								<g:field name="yardsGained" type="number"  required=""/>
							</div>

							<label for="run">Run</label>
							<g:checkBox id="run" name="run" onclick="hideShowPlay(run);" />
							<label for="pass">Pass</label>
							<g:checkBox id="pass" name="pass" onclick="hideShowPlay(pass);" />
							
							<div id="runDiv" style="display: none" >
								<h1>run!</h1>
								<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'ballCarrier', 'error')} required">
									<label for="ballCarrier">
										<g:message code="runPlay.ballCarrier.label" default="Ball Carrier" />
										<span class="required-indicator">*</span>
									</label>
									<g:select id="ballCarrier" name="ballCarrier.id" from="${com.nfldraftscience.domain.Player.list()}" optionKey="id" required="" value="${runPlayInstance?.ballCarrier?.id}" class="many-to-one"/>
								</div>
								<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'gain', 'error')} required">
									<label for="gain">
										<g:message code="runPlay.gain.label" default="Gain" />
										<span class="required-indicator">*</span>
									</label>
									<g:field name="gain" type="number" required=""/>
								</div>
								<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'locaton', 'error')} required">
									<label for="locaton">
										<g:message code="runPlay.locaton.label" default="Locaton" />
										<span class="required-indicator">*</span>
									</label>
									<g:select name="locaton" from="${com.nfldraftscience.domain.Location?.values()}" keys="${com.nfldraftscience.domain.Location.values()*.name()}" required="" value="${runPlayInstance?.locaton?.name()}"/>
								</div>
								<div class="fieldcontain ${hasErrors(bean: runPlayInstance, field: 'runConcept', 'error')} required">
									<label for="runConcept">
										<g:message code="runPlay.runConcept.label" default="Run Concept" />
										<span class="required-indicator">*</span>
									</label>
									<g:select name="runConcept" from="${com.nfldraftscience.domain.RunConcepts?.values()}" keys="${com.nfldraftscience.domain.RunConcepts.values()*.name()}" required="" value="${runPlayInstance?.runConcept?.name()}"/>
								</div>
							</div>
							
							<div id="passDiv" style="display: none" >
								<h1>pass!</h1>
								<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'location', 'error')} required">
									<label for="location">
										<g:message code="passPlay.location.label" default="Location" />
										<span class="required-indicator">*</span>
									</label>
									<g:select name="location" from="${com.nfldraftscience.domain.Location?.values()}" keys="${com.nfldraftscience.domain.Location.values()*.name()}" required="" value="${passPlayInstance?.location?.name()}"/>
								</div>
								<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'passer', 'error')} required">
									<label for="passer">
										<g:message code="passPlay.passer.label" default="Passer" />
										<span class="required-indicator">*</span>
									</label>
									<g:select id="passer" name="passer.id" from="${com.nfldraftscience.domain.Player.list()}" optionKey="id" required="" value="${passPlayInstance?.passer?.id}" class="many-to-one"/>
								</div>
								<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'route', 'error')} required">
									<label for="route">
										<g:message code="passPlay.route.label" default="Route" />
										<span class="required-indicator">*</span>
									</label>
									<g:select name="route" from="${com.nfldraftscience.domain.Route?.values()}" keys="${com.nfldraftscience.domain.Route.values()*.name()}" required="" value="${passPlayInstance?.route?.name()}"/>
								</div>
								<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'target', 'error')} required">
									<label for="target">
										<g:message code="passPlay.target.label" default="Target" />
										<span class="required-indicator">*</span>
									</label>
									<g:select id="target" name="target.id" from="${com.nfldraftscience.domain.Player.list()}" optionKey="id" required="" value="${passPlayInstance?.target?.id}" class="many-to-one"/>
								</div>
								<div class="fieldcontain ${hasErrors(bean: passPlayInstance, field: 'yardsTargeted', 'error')} required">
									<label for="yardsTargeted">
										<g:message code="passPlay.yardsTargeted.label" default="Yards Targeted" />
										<span class="required-indicator">*</span>
									</label>
									<g:field name="yardsTargeted" type="number" required=""/>
								</div>
							</div>
							
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.create.label" default="Create" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>
				
			</div>

		</div>
	</body>
</html>


