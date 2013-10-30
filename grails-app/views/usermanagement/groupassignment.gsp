<html>
    <head>
        <meta name="layout" content="admin"/> 
        <title>Home</title>
    </head>
    <body>
        <g:each in="${userList}" var="user">
        	<p>
        	<em>User:</em> ${user.getValue().displayName}<br/>
        	<em>Email Address:</em> ${user.getValue().email}<br/>
        	<em>District:</em> ${user.getValue().district}<br/>
			<div>
				<g:select name="group" from="${groupList}" noSelection="${['null':'Select an existing group']}"/>
				OR
				<label for="newGroup">Create a new group:</label>
          		<g:textField name="newGroup" style="width: 200px;"/>
			</div>
			<br/>
			<br/>
			<g:submitButton class="button" name="submitButton" value="Finalize Creation of User Account" />
        	</p>
        	<hr/>
    	</g:each>
    </body>
</html>
