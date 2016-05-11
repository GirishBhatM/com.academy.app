<%@ page contentType="text/html;charset=UTF-8"%>
<br>
<div class="alert alert-info" id="message">
	<strong>Message:</strong>
</div>
<div class="table-responsive table-hover">
	<table class="table" id="studentListTable">
		<thead>
			<tr>
				<th>Student Name</th>
				<th>School Name</th>
				<th>Course</th>
				<th>Fee Paid</th>
				<th>Edit</th>
				<th>Delete</th>
				<th>Fee Unit</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td><g:link action="export" controller="student">
						<span class="glyphicon glyphicon-download">Export</span>
					</g:link></td>
			</tr>
		</tfoot>
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
						${student.feePaid}
					</td>
					<td><input type="button" class="btn btn-primary"
						name="${student.id }" value="Edit" id="studentEdit"></td>
					<td><input type="button" value="Delete" name="${student.id }"
						id="studentDelete" class="btn btn-primary"></td>
					<td><input type="button" value="Fee Unit"
						name="${student.id }" id="studentFeeUnit" class="btn btn-primary"></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>
<ul class="pager">
	<li><a id="previous">&lt;</a></li>
	<li><a id="next">&gt;</a></li>
	<g:hiddenField name="offset" value="${offset }" />
	<g:hiddenField name="controller" value="student" />
</ul>