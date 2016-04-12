<%@page import="com.academy.app.domain.Slot"%>
<%@page import="com.academy.app.domain.Course"%>
<%@page import="com.academy.app.domain.Level"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<br>
<g:form class="form-horizontal">
	<div class="form-group">
	<g:hiddenField name="studentID" value="${student.id}"/>
		<label class="control-label col-xs-2">Name</label>
		<div class="col-xs-10">
			<input type="text" name="studentName" maxlength="250"
				required="required" readonly="readonly" value="${student.name}">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">School Name</label>
		<div class="col-xs-10">
			<input type="text" name="schoolName" maxlength="250"
				required="required" value="${student.schoolName}">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Date Of Birth(mm/dd/yyy)</label>
		<div class="col-xs-5 date">
			<div class="input-group input-append date" id="datepicker">
				<input type="text" class="form-control" name="date" value="${student.dateOfBirth}"/> <span
					class="input-group-addon add-on"><span
					class="glyphicon glyphicon-calendar"></span></span>
				<script>
					$('#datepicker').datepicker();
				</script>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Level</label>
		<div class="col-xs-10">
			<g:select name="level" from="${Level.values() }" value="${student.level.toString()}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Select Course</label>
		<div class="col-xs-10">
			<g:select name="course" from="${courses}"
				optionValue="${titleAndfee}" optionKey="id" value="${student.course.toString()}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Select Slot</label>
		<div class="col-xs-10">
			<g:select name="slot" from="${slots}"
				optionValue="${startTimeAndendTime}" optionKey="id" value="${student.slot.toString()}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Fee paid</label>
		<div class="col-xs-10">
			<input type="text" name="fee" required="required" value="${student.feePaid}">
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-offset-2 col-xs-10">
			<g:submitToRemote value="Update" controller="student" action="update"
				class="btn btn-primary" update="message" />
		</div>
	</div>

</g:form>
<div class="alert alert-info" id="message">
<strong>Message:</strong>
</div>
