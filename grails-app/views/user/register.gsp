<html>
<head>
  <title>POP - User Registration</title>
  <meta name="layout" content="login" />
</head>
<body>


<crowdAuth:isNotAuthenticated>
 
  <g:form class="simpleform" url="[controller:'user',action:'register']">
    <fieldset>
      <h1 class="featuredarticle title"><span>User</span> Registration</h1><br/>
      <span class="desc-text">Please enter and submit your registration information. Level Data will confirm your information and an email will be sent to you when your account has been created.</span><br/>
      <g:hasErrors bean="${user}">
        <div class="errors">
          <g:renderErrors bean="${user}"/>
        </div>
      </g:hasErrors>

      <br/>

      <div style="position:absolute;left:50px;">
        <label for="username">Username:</label>
        <div class="rightcol">
          <g:textField name="username" value="${user?.username}"
            class="${hasErrors(bean:user,field:'username','errors')} input" style="width: 200px;"/>
        </div>

        <label for="firstName">First Name:</label>
        <div class="rightcol">
          <g:textField name="firstName" value="${user?.firstName}"
            class="${hasErrors(bean:user,field:'firstName','errors')} input" style="width: 200px;"/>
        </div>

        <label for="lastName">Last Name:</label>
        <div class="rightcol">
          <g:textField name="lastName" value="${user?.lastName}"
            class="${hasErrors(bean:user,field:'lastName','errors')} input" style="width: 200px;"/>
        </div>

        <label for="email">Email:</label>
        <div class="rightcol">
          <g:textField name="email" value="${user?.email}"
            class="${hasErrors(bean:user,field:'email','errors')} input" style="width: 200px;"/>
        </div>
     
        <label for="password">Password:</label>
        <div class="rightcol">
          <g:passwordField name="password"
            class="${hasErrors(bean:user,field:'password','errors')} input" style="width: 200px;"/>
        </div>
     
        <label for="confirm">Confirm Password</label>
        <div class="rightcol">
          <g:passwordField name="confirm"
            class="${hasErrors(bean:user,field:'password','errors')} input"  style="width: 200px;"/>
        </div>

        <!-- If the user was redirected from his/her email, the url will have the token. else, they can sign up and get put into a pending users group. -->
        <g:if test="${!params.containsKey('tkn')}"> <!-- no token in URL -->
          <label for="token">Token</label>
          <div class="rightcol">
            <g:textField name="token"
              class="${hasErrors(bean:user,field:'token','errors')} input"  style="width: 200px;"/>
          </div>
        </g:if>
        <g:else> <!-- token in url -->
          <g:hiddenField name="tkn" class="${hasErrors(bean:user,field:'token','errors')}" value="${params.tkn}"/>
        </g:else> 

          <label>&nbsp;</label>
        <div class="rightcol">
          <g:submitButton class="button" name="submitButton" value="Create Account" />
        </div>
      </div>
    </fieldset>
  </g:form>
</crowdAuth:isNotAuthenticated>
<crowdAuth:isAuthenticated>
  <p style="position:absolute;right:75px;top:150px;">
    You are already logged in. Please <g:link controller="logout">log out</g:link> before attempting to register.
  </p>
</crowdAuth:isAuthenticated>
</body>
</html>