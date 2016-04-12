<%@page import="com.academy.app.domain.TimeType"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<br>
<g:form class="form-horizontal">
	<div class="form-group">
	<g:hiddenField name="slotID" value="${slot.id }"/>
		<label class="control-label col-xs-2">Start Time:</label>
		<div class="col-xs-10">
			<input type="number" name="sh" min="1" max="12" required value="${slot.startTime.split(":")[0] }"> <input
				type="number" name="sm" min="0" max="59" required value="${slot.startTime.split(":")[1] }">
			<g:select name="st" from="${TimeType.values() }" value="${slot.sType.toString() }"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">End Time:</label>
		<div class="col-xs-10">
			<input type="number" name="eh" min="1" max="12" required value="${slot.endTime.split(":")[0] }"> <input
				type="number" name="em" min="0" max="59" required required value="${slot.endTime.split(":")[1] }">
			<g:select name="et" from="${TimeType.values() }" value="${slot.eType.toString() }"/>
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-offset-2 col-xs-10">
			<g:submitToRemote  value="Update"  controller="slot" action="update" class="btn btn-primary" update="message"/>
		</div>
	</div>
</g:form>
<div class="alert alert-info" id="message">
<strong>Message:</strong>
</div>