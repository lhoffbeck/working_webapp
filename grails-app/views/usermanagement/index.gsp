<html>
	<crowdAuth:isAuthenticated>
	    <crowdAuth:ifAllGranted group="Admins">
		    <head>
		        <meta name="layout" content="Admin"/> 
		        <title>Home</title>
		    </head>
		    <body>
		       
		    </body>
		</crowdAuth:ifAllGranted>
    	<crowdAuth:ifAllNotGranted group="Admins">
			<body>
			    You must be an administrator to access this page.
			</body>
		</crowdAuth:ifAllNotGranted>
    </crowdAuth:isAuthenticated>
    <crowdAuth:isNotAuthenticated>
    	
    </crowdAuth:isNotAuthenticated>
</html>