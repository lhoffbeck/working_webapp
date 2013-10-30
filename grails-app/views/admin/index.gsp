
<html>
	<crowdAuth:isAuthenticated>
		<crowdAuth:ifAllGranted group="Admins">
		    <head>
		        <meta name="layout" content="admin"/> 
		        <title>Home</title>
		    </head>
		    <body>
		    This is a user management page with lotsa user management functions.
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
