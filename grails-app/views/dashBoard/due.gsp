<%@ page contentType="text/html;charset=UTF-8"%>
<div class="table-responsive table-hover">
	<table class="table" id="duetable">
		<thead>
			<tr>
				<th>Student Name</th>
				<th>Course Title</th>
				<th>Fee Paid</th>
				<th>Course Fee</th>
				<th>Difference</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${model}" var="var">
				<tr>
					<td>
						${var.name}
					</td>
					<td>
						${var.title}
					</td>
					<td>
						${var.feePaid}
					</td>
					<td>
						${var.fee}
					</td>
					<td>
						${var.difference}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>
