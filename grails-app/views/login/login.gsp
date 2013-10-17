<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="login"/>
        <title>Login</title>
        <style type="text/css">
            html{
                min-height: 100%;
                height: auto;
                margin: 0 auto -50px;
            }
            body{
                height: 100px;
            }
            #login{
                margin: 0 auto;
                width: 800px;
                height: 500px;
            }
            #loginPic{
                float: left;
            }
            #loginDialog{
                width: 400px;
                height: 300px;
                float: right;
                margin-top: 30px;
                border: 1px solid black;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div id="login">
            <div id="loginDialog">
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
                        </table>
                    </div>
                </g:form>
            </div>
        </div>
        
    </body>
    
</html>
