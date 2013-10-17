<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Home</title>
    </head>
    <body>
        <div class="body">
            <h1>Home</h1>
 
            <crowdAuth:isAuthenticated>
                <p>I am authenticated!</p>
                <p>According to Crowd:<br/>
                    My Name is: <crowdAuth:authenticatedUserInfo property="name"/><br/>
                    My Email address is: <crowdAuth:authenticatedUserInfo property="email"/><br/>
                    My Username is: <crowdAuth:authenticatedUserInfo property="username"/><br/>
                </p>
                <p>
                    <crowdAuth:ifAllGranted group="Guitarists">
                        I am a guitarist.<br/>
                    </crowdAuth:ifAllGranted>
                    <crowdAuth:ifAnyGranted group="Guitarists,Lead Singers">
                        I am either a guitarist or a Lead Singer.<br/>
                    </crowdAuth:ifAnyGranted>
                    <crowdAuth:ifAllGranted group="Guitarists,Lead Singers">
                        I am a guitarist and a Lead Singer.<br/>
                    </crowdAuth:ifAllGranted>
                    <crowdAuth:ifAllNotGranted group="Guitarists">
                        I am not a guitarist.<br/>
                    </crowdAuth:ifAllNotGranted>
                    <crowdAuth:ifAllNotGranted group="Drummers">
                        I am not a drummer.<br/>
                    </crowdAuth:ifAllNotGranted>
                    <crowdAuth:ifAllNotGranted group="Drummers,Lead Singers">
                        I am not a drummer, nor a Lead Singer.<br/>
                    </crowdAuth:ifAllNotGranted>
                    <crowdAuth:ifAnyNotGranted group="Drummers,Guitarists">
                        I am either not a drummer, or not a guitarist, or both.<br/>
                    </crowdAuth:ifAnyNotGranted>
                </p>
            </crowdAuth:isAuthenticated>
            <crowdAuth:isNotAuthenticated>
                <p>I am not authenticated! Perhaps I should <g:link controller="login">Login</g:link>.</p>
            </crowdAuth:isNotAuthenticated>
        </div>
    </body>
</html>