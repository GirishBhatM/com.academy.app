<%@ page contentType="text/html;charset=UTF-8"%>
<div class="table-responsive table-hover">
	<table class="table" id="studentListTable">
		<thead>
			<tr>
				<th>Total Students</th>
				<th>Course Title</th>
				<th>Course Fee</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${model}" var="var">
				<tr>
					<td>
						${var.count}
					</td>
					<td>
						${var.title}
					</td>
					<td>
						${var.fee}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>
