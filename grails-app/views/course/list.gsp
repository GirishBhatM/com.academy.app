<%@ page contentType="text/html;charset=UTF-8"%>
<br>
<div class="alert alert-info" id="message">
<strong>Message:</strong>
</div>
<div class="table-responsive table-hover">
	<table class="table" id="courseListTable">
		<thead>
			<tr>
				<th>Title</th>
				<th>Duration(in months)</th>
				<th>Fee (Rs)</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${model}" var="course">
				<tr>
					<td>
						${course.title}
					</td>
					<td>
						${course.duration}
					</td>
					<td>
						${course.fee}
					</td>
					<td><input type="button" class="btn btn-primary"
						name="${course.id }" value="Edit" id="courseEdit"></td>
					<td><input type="button" value="Delete" name="${course.id }"
						id="courseDelete" class="btn btn-primary"></td>
				</tr>
			</g:each>
		</tbody>

	</table>
</div>
<ul class="pager">
	<li><a id="previous">&lt;</a></li>
	<li><a id="next">&gt;</a></li>
	<g:hiddenField name="offset" value="${offset }" />
	<g:hiddenField name="controller" value="course" />
</ul>