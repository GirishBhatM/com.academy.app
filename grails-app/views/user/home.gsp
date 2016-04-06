<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>User Home</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Academy</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><g:link action="index" controller="user" id="user">Player</g:link></li>
						<li><g:link action="index" controller="course" id="course">Course</g:link></li>
						<li><g:remoteLink action="index" id="slot" controller="slot"
								update="content">
								Slot
							</g:remoteLink></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><g:link action="index" controller="dashBoard"
								id="dashBoard">Dash Board</g:link></li>
						<li><g:link action="logout" controller="user" id="logout">Logout</g:link></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</nav>
		<!-- Main component for a primary marketing message or call to action -->
		<div id="content"></div>
		<hr></hr>
		<footer class="footer">
			<p>&copy; 2015 Company, Inc.</p>
		</footer>
	</div>
	<div id="spinner" class="spinner">
		<g:img uri="${resource(dir: "images", file: "spinner.gif")}" alt="Loading..." />
	</div>
	<!-- Site footer -->
	<!-- /container -->
</body>
</html>