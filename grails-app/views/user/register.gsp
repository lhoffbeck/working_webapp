<html>
<head>
  <title>POP - User Registration</title>
  <meta name="layout" content="login" />
</head>
<body>
 
<g:form class="simpleform" url="[controller:'user',action:'register']">
  <fieldset>
    <h1 class="featuredarticle title"><span>User</span> Registration</h1><br/>
    <span class="desc-text">Please enter and submit your registration information. Your email address will be your username. Level Data will confirm your information and an email will be sent to you when your account has been created.</span><br/>
    <g:hasErrors bean="${user}">
      <div class="errors">
        <g:renderErrors bean="${user}"/>
      </div>
    </g:hasErrors>
     
    <label for="firstName">First Name:</label>
    <div class="rightcol">
      <g:textField name="firstName" value="${user?.firstName}"
        class="${hasErrors(bean:user,field:'firstName','errors')}"/>
    </div>

    <label for="lastName">Last Name:</label>
    <div class="rightcol">
      <g:textField name="lastName" value="${user?.lastName}"
        class="${hasErrors(bean:user,field:'lastName','errors')}"/>
    </div>

    <label for="email">Email:</label>
    <div class="rightcol">
      <g:textField name="email" value="${user?.email}"
        class="${hasErrors(bean:user,field:'email','errors')}"/>
    </div>
 
    <label for="password">Password:</label>
    <div class="rightcol">
      <g:passwordField name="password"
        class="${hasErrors(bean:user,field:'password','errors')}" />
    </div>
 
    <label for="confirm">Confirm Password</label>
    <div class="rightcol">
      <g:passwordField name="confirm"
        class="${hasErrors(bean:user,field:'password','errors')}" />
    </div>
    <label for="district">School District:</label>
    <div class="rightcol">
      <g:textField name="district" value="${user?.district}"
        class="${hasErrors(bean:user,field:'district','errors')}"/>
    </div>
      <label>&nbsp;</label>
    <div class="rightcol">
      <g:submitButton class="button" name="submitButton" value="Create Account" />
    </div>
  </fieldset>
</g:form>
</body>
</html>