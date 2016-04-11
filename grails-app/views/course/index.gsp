
<div class="masthead">
	<nav>
		<ul class="nav nav-justified">
			<li id="courseCreate"><g:remoteLink action="create"
					id="courseaCreate" controller="course" update="courseContent">
								Add Course
							</g:remoteLink></li>
			<li id="courseView"><g:remoteLink action="list" id="courseaView"
					controller="course" update="courseContent">
								View Courses
							</g:remoteLink></li>
		</ul>
		<div id="courseContent"></div>
	</nav>
</div>

