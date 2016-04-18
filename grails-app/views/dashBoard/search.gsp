<%@ page contentType="text/html;charset=UTF-8"%>

<div class="col-xs-10">
	<table class="table">
		<thead>
			<tr>
				<th>Student name</th>
				<th>Course</th>
				<th>Fee Paid</th>
				<th>Actual Fee</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${model}" var="var">
				<tr>
					<td>
						${var.name}
					</td>
					<td>
						${var.feePaid}
					</td>
					<td>
						${var.course.title}
					</td>
					<td>
						${var.course.fee}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>

