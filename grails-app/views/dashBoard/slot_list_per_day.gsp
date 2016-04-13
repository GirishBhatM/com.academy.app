<%@page import="com.academy.app.domain.Slot"%>
<g:select name="slotForDay" from="${model}"
	optionValue="${startTimeAndendTime}" optionKey="id" class="slotSelect" id="slotSelect"/>
<input type="button" value="Add" name="Add" id="add"
	class="btn btn-primary slotSelect">