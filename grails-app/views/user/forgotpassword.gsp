<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="login" />

    <link rel="stylesheet" href="${resource(dir:'css',file:'form_style.css')}" />
    <title>Forgot Password</title>

    <style>
      #userphone{
        display:none;
      }

      #content{
        position: relative;
        left:50px;
        top:40px;
        width:400px;
      }
    </style>
  </head>
  <body>

    <div id="content">
      <h1 class="featuredarticle title"><span>Forgot your password?</span></h1><br/>
      Please enter your email address below. An email with a link to reset your password will be sent to you soon.

      <br>
      <br>


      <g:form id="forgot_pass_form" url="[controller:'user',action:'forgotpassword']">
          <p>
            <label for="email"><span style="font-weight:bold;">Your email address:</span></label><br/>
            <g:textField name="email" id="email" class="required" />
          </p>

          <p>
            <button id="submit_btn" name="submit_btn" type="submit" class="button-link btn">Request password reset</button>
          </p>

          <div id="userphone">
            If you can see this field, don't fill it out.
            <input type="text" name="userphone" value="" />
          </div>
      </g:form>
    </div>
  </body>
</html>