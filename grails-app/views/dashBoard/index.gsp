
<%@page import="com.academy.app.domain.Day"%>
<div class="body" id="dasbordBody">
	<div class="panel panel-default">
		<div class="panel-heading">Dash Board</div>
		<div class="panel-body">
			<div class="row placeholders">
				<div class="col-xs-6 col-sm-3 placeholder">
					<span class="text-muted">Total Students</span> <span id="sCount"></span>
				</div>
				<div class="col-xs-6 col-sm-3 placeholder">
					<span class="text-muted">Total Courses</span> <span id="cCount"></span>
				</div>
				<div class="col-xs-6 col-sm-3 placeholder">
					<span class="text-muted">Total Slots</span> <span id="slCount"></span>
				</div>
				<div class="col-xs-6 col-sm-3 placeholder">
					<span class="text-muted">Total Amount</span> <span id="amount"></span>
				</div>
			</div>
		</div>
	</div>
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading">Students with due</div>
			<div class="panel-body" id="stDue"></div>
		</div>
	</div>
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading">Search Students</div>
			<div class="panel-body" id="search">
				<div class="form-group">
					<label class="control-label col-xs-2">Select Slot</label>
					<div class="col-xs-10" id="slotSelectDiv">
						<g:select name="day" from="${Day.values() }" id="slotDaySelect" />
						<input type="button" value="Add" name="Add" id="add"
							class="btn btn-primary slotSelect">
					</div>
				</div>
			</div>
			<div class="table-responsive table-hover form-group"
				id="searchTableDiv"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		ajaxCalls();
	});
	function ajaxCalls() {
		$.ajax({
			type : "POST",
			url : "/com.academy.app/dashBoard/totalStudentsCount",
			async : true,
			cache : false,
			success : function(response) {
				$("#sCount").empty();
				$("#sCount").append(response);
			}
		});
		$.ajax({
			type : "POST",
			url : "/com.academy.app/dashBoard/totalCourseCount",
			async : true,
			cache : false,
			success : function(response) {
				$("#cCount").empty();
				$("#cCount").append(response);
			}
		});
		$.ajax({
			type : "POST",
			url : "/com.academy.app/dashBoard/totalSlotsCount",
			async : true,
			cache : false,
			success : function(response) {
				$("#slCount").empty();
				$("#slCount").append(response);
			}
		});
		$.ajax({
			type : "POST",
			url : "/com.academy.app/dashBoard/totalAmount",
			async : true,
			cache : false,
			success : function(response) {
				$("#amount").empty();
				$("#amount").append(response);
			}
		});
		$.ajax({
			type : "POST",
			url : "/com.academy.app/dashBoard/usersPerCourse",
			async : true,
			cache : false,
			success : function(response) {
				$("#stPCourse").empty();
				$("#stPCourse").append(response);
			}
		});
		$.ajax({
			type : "POST",
			url : "/com.academy.app/dashBoard/studentsWithDue",
			async : true,
			cache : false,
			success : function(response) {
				$("#stDue").empty();
				$("#stDue").append(response);
			}
		});
		$(document)
				.on(
						"click",
						'#add',
						function() {
							var day = $("#slotDaySelect :selected").val();
							var slot = $("#slotSelect :selected").val();
							$
									.ajax({
										type : "POST",
										url : "/com.academy.app/dashBoard/listStudentsPerSlot?day="
												+ day + "&slotID=" + slot,
										async : false,
										cache : false,
										success : function(response) {
											$("#searchTableDiv").empty();
											$("#searchTableDiv").append(
													response);
										}
									});
						});

	}
</script>