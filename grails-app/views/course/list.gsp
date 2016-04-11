<%@ page contentType="text/html;charset=UTF-8"%>
<br>
<div id="message"></div>
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
