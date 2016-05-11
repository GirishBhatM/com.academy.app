<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Login</title>
</head>
<body>
	<div class="container">
		<g:form controller='user' action='validate' method="post"
			id="validate" class="form-signin">
			<label for='user.loginId' class="sr-only">Login ID:</label>
			<g:textField name="user.loginId" class="form-control"
				placeholder="Login ID" required="true" autofocus="true"
				data-toggle="tooltip" title="Login ID" />
			<label for="user.password" class="sr-only">Password:</label>
			<g:passwordField name="user.password" class="form-control"
				placeholder="Password" required="true" autofocus="true"
				data-toggle="tooltip" title="Password" />
			<g:actionSubmit class="btn btn-lg btn-primary btn-block"
				value="validate" name="Login" id="form" />
			<br>
			<g:if test="${flash.error}">
				${flash.error }<br>
			</g:if>
		</g:form>

	</div>
</body>
</html>