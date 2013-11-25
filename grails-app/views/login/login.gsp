<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="login"/> 

        <link rel="stylesheet" href="${resource(dir:'css',file:'form_style.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'nod.css')}" />

        <script src="${resource(dir:'js',file:'1.8.0.jquery.min.js')}"></script>
        <script src="${resource(dir:'js',file:'bootstrap.min.js')}"></script>
        <script src="${resource(dir:'js',file:'nod.js')}"></script>

        <title>Login</title>

        <style>
            .inputs
            {
                background: #f1f1f1 url(../images/login-sprite.png) no-repeat;
                padding: 15px 15px 15px 30px;
                margin: 0 0 10px 0;
                width: 200px; 
                border: 1px solid #ccc;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
                border-radius: 5px;
                -moz-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
                -webkit-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
                box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
            }

            #username
            {
                background-position: 5px -2px !important;
            }

            #password
            {
                background-position: 5px -52px !important;
            }

            #inputs input:focus
            {
                background-color: #fff;
                border-color: #ADCAED;
                outline: none;
                -moz-box-shadow: 0 0 0 1px #ADCAED inset;
                -webkit-box-shadow: 0 0 0 1px #ADCAED inset;
                box-shadow: 0 0 0 1px #ADCAED inset;
            }

            #actions a
            {
                color: #3151A2;  
                margin-left: 10px;
            }
            #login{
                position:relative;
                left:200px;
                top: 100px;
            }
        </style>
    </head>
    <body>
        <crowdAuth:isNotAuthenticated>
            <div id="login">    
                <g:form action="login" method="post" id="login" style="border:none;background-color:inherit;">
                    <h1 class="featuredarticle title" style="font-size:30px;"><span>Log</span> In</h1>
                    <fieldset id="inputs">
                        <input type='text' class="inputs" name='username' id="username" placeholder="Username" value='${command?.username}' autofocus required />
                        <br>
                        <input type="password" class="inputs" name='password' id='password' value='${command?.password}' placeholder="Password" required/>
                    </fieldset>
                    <fieldset id="actions">
                        <g:link controller="user" action="forgotpassword">Forgot your password?</g:link>
                        <g:link controller="user" action="register">Sign up!</g:link>
                        <br/>
                        <input type="submit" id="login_button" class="button-link" value="Log in" style="width:80px;">
                    </fieldset>
                    <script type="text/javascript">
                        /*var metrics = [
                            [ '#username', 'email' , 'This should be your email address' ]
                        ];

                        $("#login").nod(metrics);*/

                    </script>
                </g:form>
            </div>
        </crowdAuth:isNotAuthenticated>
        <crowdAuth:isAuthenticated>
            <p style="position:absolute;right:75px;top:150px;">
                You are already logged in.<br> Please <g:link controller="logout">log out</g:link> before attempting to log in to another account.
            </p>
        </crowdAuth:isAuthenticated>
    </body>
    
</html>
