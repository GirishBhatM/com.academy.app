<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.academy.app.domain.TimeType"%>
<br>
<div id="message"></div>
<div class="table-responsive table-hover"> 
<table class="table" id="slotListTable">
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
				<td id="#slotStart">
					${slot.startTime+" "+slot.sType}
				</td>
				<td id="slotEnd">
					${slot.endTime+" "+slot.eType }
				</td>
				<td><input type="button" class="btn btn-primary"
					name="${slot.id }" value="Edit" id="slotEdit"></td>
				<td><input type="button" value="Delete" name="${slot.id }"
					id="slotDelete" class="btn btn-primary"></td>
			</tr>
		</g:each>
	</tbody>
</table>
</div>
<ul class="pager">
	<li><a id="previous">&lt;</a></li>
	<li><a id="next">&gt;</a></li>
	<g:hiddenField name="offset" value="${offset }" />
	<g:hiddenField name="controller" value="slot" />
</ul>
