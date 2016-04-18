<%@page import="com.academy.app.domain.Slot"%>
<%@page import="com.academy.app.domain.Course"%>
<%@page import="com.academy.app.domain.Level"%>
<%@page import="com.academy.app.domain.Day"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<br>
<g:form class="form-horizontal" id="studentSaveForm">
	<div class="form-group">
		<label class="control-label col-xs-2">Name</label>
		<div class="col-xs-10">
			<input type="text" name="studentName" maxlength="250"
				required="required" id="studentName">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">School Name</label>
		<div class="col-xs-10">
			<input type="text" name="schoolName" maxlength="250"
				required="required" id="schoolName">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Date Of Birth(mm/dd/yyy)</label>
		<div class="col-xs-5 date">
			<div class="input-group input-append date" id="datepicker">
				<input type="text" class="form-control" name="date" id="dob" /> <span
					class="input-group-addon add-on"><span
					class="glyphicon glyphicon-calendar"></span></span>
				<script>
					$('#datepicker').datepicker();
				</script>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Phone Number</label>
		<div class="col-xs-10">
			<input type="text" name="phoneNum" maxlength="10" id="phoneNum">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Photo</label>
		<div class="col-xs-10">
			<div>
				<img id="preview" src="" class="img-responsive" width="304" height="236"/>
			</div>
			<input type="file" value="Browse" name="Browse" id="imageBrowsebtn"
				class="btn btn-primary" accept="image/*" name="picImage">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Level</label>
		<div class="col-xs-10">
			<g:select name="level" from="${Level.values() }" id="levelSelect" />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Select Course</label>
		<div class="col-xs-10">
			<g:select name="course" from="${courses}"
				optionValue="${titleAndfee}" optionKey="id" id="courseSelect" />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Select Slot</label>
		<div class="col-xs-10" id="slotSelectDiv">
			<g:select name="day" from="${Day.values() }" id="slotDaySelect" />
			<select name="slot" class="slotSelect" id="slotSelect"></select> <input
				type="button" value="Add" name="Add" id="add"
				class="btn btn-primary slotSelect">
		</div>
	</div>
	<div class="table-responsive table-hover form-group">
		<label class="control-label col-xs-2"></label>
		<div class="col-xs-10" id="slotSelectDiv">
			<table class="table" id="selectedSlotTable">
				<thead>
					<tr>
						<th>Day</th>
						<th>Slot</th>
						<th>Remove</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-xs-2">Fee paid</label>
		<div class="col-xs-10">
			<input type="text" name="fee" required="required" id="fee">
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-offset-2 col-xs-10">
			<input type="button" class="btn btn-primary saveUser"
				id="studentSaveButton" value="Save" name="Save" />
		</div>
		<g:hiddenField name="action" value="save" id="action" />
	</div>
</g:form>
<div class="alert alert-info" id="message">
	<strong>Message:</strong>
</div>
