
<div class="masthead">
	<nav>
		<ul class="nav nav-justified">
			<li id="slotCreate"><g:remoteLink action="create"
					id="slotaCreate" controller="slot" oncomplete="showSpinner(false);"
					onloading="showSpinner(true);" update="slotContent">
								Add Slot
							</g:remoteLink></li>
			<li id="slotCreate"><g:remoteLink action="list" id="slotaView"
					controller="slot" update="slotContent">
								View Slots
							</g:remoteLink></li>
		</ul>
		<div id="slotContent"></div>
	</nav>
</div>

