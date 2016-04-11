<%@ page contentType="text/html;charset=UTF-8"%>
<br>
<div id="message"></div>
<table class="table" id="studentListTable">
	<thead>
		<tr>
			<th>Student Name</th>
			<th>School Name</th>
			<th>Course</th>
			<th>Slot</th>
			<th>Fee Paid</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${model}" var="student">
			<tr>
				<td>
					${student.name}
				</td>
				<td>
					${student.schoolName}
				</td>
				<td>
					${student.course.title}
				</td>
				<td>
					${student.slot.startTime+" "+student.slot.endTime}
				</td>
				<td>${student.feePaid}
				<td><input type="button" class="btn btn-primary"
					name="${student.id }" value="Edit" id="studentEdit"></td>
				<td><input type="button" value="Delete" name="${student.id }"
					id="studentDelete" class="btn btn-primary"></td>
			</tr>
		</g:each>
	</tbody>

</table>