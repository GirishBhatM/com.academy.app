<%@ page contentType="text/html;charset=UTF-8"%>
<br>
<g:form class="form-horizontal">
	<g:hiddenField name="courseID" value="${course.id}" />
	<div class="form-group">
		<label class="control-label col-xs-2">Title</label>
		<div class="col-xs-10">
			<input type="text" name="title" maxlength="15" required="required"
				value="${course.title }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Description</label>
		<div class="col-xs-10">
			<textarea class="form-control" rows="5" name="description">${course.description}</textarea>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Duration (month/s)</label>
		<div class="col-xs-10">
			<input type="number" name="duration" min="1" max="12"
				required="required" value="${course.duration }">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Fee (Rs)</label>
		<div class="col-xs-10">
			<input type="text" name="fee" required="required"
				value="${course.fee }">
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-offset-2 col-xs-10">
			<g:submitToRemote value="Update" controller="course" action="update"
				class="btn btn-primary" update="message" />
		</div>
	</div>
</g:form>
<div class="alert alert-info" id="message">
<strong>Message:</strong>
</div>
