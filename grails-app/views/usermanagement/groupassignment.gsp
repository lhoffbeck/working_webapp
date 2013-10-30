<html>
<<<<<<< HEAD
    <head>
        <meta name="layout" content="admin"/> 
        <title>Home</title>
    </head>
    <body>
        <h1>Users pending group approval</h1>
        <p>Assign each user to a district to complete their sign up process.</p>
        <br/>
        <hr/>
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
=======
    <crowdAuth:isAuthenticated>
        <crowdAuth:ifAllGranted group="Admins">
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
        </crowdAuth:ifAllGranted>
        <crowdAuth:ifAllNotGranted group="Admins">
            <body>
                You must be an administrator to access this page.
            </body>
        </crowdAuth:ifAllNotGranted>
    </crowdAuth:isAuthenticated>
    <crowdAuth:isNotAuthenticated>
        <body>
            You must logged in to access this page.
        </body>
    </crowdAuth:isNotAuthenticated>
>>>>>>> 2246baedaea9437f0e7b630cc73057af347878f9
</html>
