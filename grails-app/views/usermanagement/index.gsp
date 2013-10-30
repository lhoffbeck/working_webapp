<html>
	<crowdAuth:isAuthenticated>
	    <crowdAuth:ifAllGranted group="Admins">
		    <head>
		        <meta name="layout" content="Admin"/> 
		        <title>Home</title>
		    </head>
		    <body>
		        <g:link controller="usermanagement" action="groupassignment">Assign Pending Users to Groups</g:link>
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
</html>