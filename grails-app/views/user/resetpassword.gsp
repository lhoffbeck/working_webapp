<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="login" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'form_style.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'nod.css')}" />
    <script src="${resource(dir:'js',file:'1.8.0.jquery.min.js')}"></script>
    <script src="${resource(dir:'js',file:'bootstrap.min.js')}"></script>
    <script src="${resource(dir:'js',file:'nod.js')}"></script>

    <title>Reset Password</title>

    <style>
      #userphone{
        display:none;
      }

      #content{
        position: relative;
        left:50px;
        top:40px;
        width:450px;
      }
    </style>
      <script type="text/javascript">

        var errorsAreShowing = false;

        function showErrors(){

          if(!errorsAreShowing){
            var metrics = [
                [ '.required', 'presence', 'Cannot be empty' ],
                [ '#password', 'between:6:20', 'Must be between 6 and 20 characters long' ],
                [ '#confirm', 'same-as:#password', 'Passwords dont match' ]
              ];

            $("#reset_pass_form").nod(metrics);
          }

          errorsAreShowing = true;
        }
      </script>
  </head>
  <body>

    <div id="content">
      <h1 class="featuredarticle title"><span>Reset your password</span></h1><br/>
      Please enter your new password below.

      <br>
      <br>


      <g:form id="reset_pass_form" url="[controller:'user', action:'resetpassword']">
          <p>
            <label for="password">New Password</label><br/>
            <g:passwordField name="password" id="password" class="required" />
          </p>
         
          <p>
            <label for="confirm">Confirm New Password</label><br/>
            <g:passwordField name="confirm" id="confirm" class="required" />
          </p>

          <g:hiddenField name="email" id="email" value="${params.email}"/>
          <g:hiddenField name="token" id="token" value="${params.token}"/>

          <p>
            <button id="submit_btn" name="submit_btn" type="submit" onmouseover="showErrors()" class="button-link">Change password</button>
          </p>

          <div id="userphone">
            If you can see this field, don't fill it out.
            <input type="text" name="userphone" value="" />
          </div>

      </g:form>
    </div>
  </body>
</html>