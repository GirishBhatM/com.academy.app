<%@ page contentType="text/html;charset=UTF-8"%>
<br>
<div class="table-responsive table-hover">
	<table class="table" id="feeUnitListTable">
		<thead>
			<tr>
				<th>Student Name</th>
				<th>Course</th>
				<th>Fee Paid</th>
				<th>Date</th>
				<th>Print</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td><g:link action="printAll" params="${[id:id] }" controller="fee">
						<span class="glyphicon glyphicon-print">Print All</span>
					</g:link></td>
			</tr>
		</tfoot>
		<tbody>
			<g:each in="${model}" var="fee">
				<tr>
					<td>
						${name}
					</td>
					<td>
						${title}
					</td>
					<td>
						${fee.feepaid}
					</td>
					<td>
						${fee.date}
					</td>
					<td><g:link action="print" params="${[name:name,feepaid:fee.feepaid,title:title,date:fee.date]}" controller="fee">
						<span class="glyphicon glyphicon-print"> Print</span>
						</g:link></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>