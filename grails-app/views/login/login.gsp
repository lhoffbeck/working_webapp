<!DOCTYPE html>
<html>
    <head>
       <meta name="layout" content="login"/> 
        <title>Login</title>
    </head>
    <body>
        <crowdAuth:isNotAuthenticated>
            <div id="login">
                <div id="loginDialog" >
                 <h1 class="featuredarticle title"><span>Log</span> In</h1><br/>

                    <g:form action="login" method="post">
                        <div class="dialog">
                            <table>
                                <tr class='prop'>
                                    <td class='name'>
                                        Username:
                                    </td>
                                    <td class="value ${hasErrors(bean: command, field: 'username', 'errors')}">
                                        <input type='text' name='username' class="login" value='${command?.username}'/>
                                    </td>
                                </tr>
                                <tr class='prop'>
                                    <td class='name'>
                                        Password:
                                    </td>
                                    <td class="value ${hasErrors(bean: command, field: 'password', 'errors')}">
                                        <input type="password" name='password' class="login" value='${command?.password}'/>
                                    </td>
                                </tr>
                                <tr class='prop'>
                                    <td colspan="3">
                                        <div class="buttons">
                                            <input type="submit" value="Login"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr class='prop'>
                                    <td colspan="3">
                                        <g:link controller="user" action="register">Sign up now!</g:link>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </g:form>
                </div>
            </div>
        </crowdAuth:isNotAuthenticated>
        <crowdAuth:isAuthenticated>
            <p style="position:absolute;right:75px;top:150px;">
                You are already logged in.<br> Please <g:link controller="logout">log out</g:link> before attempting to log in to another account.
            </p>
        </crowdAuth:isAuthenticated>
    </body>
    
</html>
