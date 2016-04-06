<%@ page contentType="text/html;charset=UTF-8"%>
<table class="table" id="table">
	<thead>
		<tr>
			<th>Start Time</th>
			<th>End Time</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${model}" var="slot">
			<tr>
				<td>
					${slot.startTime}:${slot.sType}
				</td>
				<td>
					${slot.endTime }:${slot.eType}
				</td>
				<td><g:form action="update">
						<g:hiddenField name="slotID" value="${slot.id }" />
						<g:submitToRemote value="Edit" controller="slot" action="update"
							class="btn btn-primary" update="message" />
					</g:form></td>
				<td><g:form action="delete">
						<g:hiddenField name="slotID" value="${slot.id }" />
						<g:submitToRemote value="Delete" controller="slot" action="delete"
							class="btn btn-primary" update="message" />
					</g:form></td>
			</tr>
		</g:each>
	</tbody>
</table>
<div id="message"></div>