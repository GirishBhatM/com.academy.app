
<div class="masthead">
	<nav>
		<ul class="nav nav-justified">
			<li id="studentCreate"><g:remoteLink action="create"
					id="studentaCreate" controller="student" action="create" update="studentContent">
								Add Student
							</g:remoteLink></li>
			<li id="studentView"><g:remoteLink action="list"
					id="studentaView" controller="student" action="list" update="studentContent">
								View Students
							</g:remoteLink></li>
		</ul>
		<div id="studentContent"></div>
	</nav>
</div>

