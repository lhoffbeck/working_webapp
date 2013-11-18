<html>
<head>
  <title>Registration</title>
  <meta name="layout" content="login" />
  <link rel="stylesheet" href="${resource(dir:'css',file:'form_style.css')}" />
  <script src="${resource(dir:'js',file:'1.8.0.jquery.min.js')}"></script>
  <script src="${resource(dir:'js',file:'bootstrap.min.js')}"></script>
  <script src="${resource(dir:'js',file:'nod.js')}"></script>

  <style type="text/css">

  .nod_msg {
    background: #fcc;
    padding: 2px 5px;
    margin-left: 5px;
    border-radius: 5px;
    font-weight: bold;
    color: #b94a48;
    display: inline-block;
  }

  .hideme{
    background: #fcc;
    padding: 2px 5px;
    margin-left: 5px;
    border-radius: 5px;
    font-weight: bold;
    color: #b94a48;
    display: inline-block;
  }

.button-link {
    padding: 10px 15px;
    background: #4479BA;
    color: #FFF;
    width: 208px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    border: solid 1px #20538D;
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
    -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
    -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.4), 0 1px 1px rgba(0, 0, 0, 0.2);
    -webkit-transition-duration: 0.2s;
    -moz-transition-duration: 0.2s;
    transition-duration: 0.2s;
    -webkit-user-select:none;
    -moz-user-select:none;
    -ms-user-select:none;
    user-select:none;
}
.button-link:hover {
    background: #356094;
    border: solid 1px #2A4E77;
    text-decoration: none;
    cursor: pointer;
}
.button-link:active {
    -webkit-box-shadow: inset 0 1px 4px rgba(0, 0, 0, 0.6);
    -moz-box-shadow: inset 0 1px 4px rgba(0, 0, 0, 0.6);
    box-shadow: inset 0 1px 4px rgba(0, 0, 0, 0.6);
    background: #2E5481;
    border: solid 1px #203E5F;
}

/* css for the pooh bear spambot pot */
#userphone{
  display: none;
}

  </style>

  <script type="text/javascript">

  var errorsAreShowing = false;

  function showErrors(){

    if(!errorsAreShowing){
      var metrics = [
        [ '.required', 'presence', 'Cannot be empty' ],
        [ '#firstName', /^[^!@#$%^&*();]*$/ , 'Invalid characters in first name' ],
        [ '#firstName', 'between:2:50', 'Must be between 2 and 50 characters long' ],
        [ '#lastName', /^[^!@#$%^&*();]*$/ , 'Invalid characters in first name' ],
        [ '#lastName', 'between:2:75', 'Must be between 2 and 75 characters long' ],
        [ '#email', 'email' , 'Invalid email address' ],
        [ '#password', 'between:6:20', 'Must be between 6 and 20 characters long' ],
        [ '#confirm', 'same-as:#password', 'Passwords dont match' ]
      ];

      $("#signup-form").nod(metrics);
    }

    errorsAreShowing = true;
  }
      
/*
      $(".hideme").addClass("nod_msg");
      $( ".hideme" ).css( "border", "3px solid red" );
      $(".nod_msg").removeClass("hideme");*/
    

  </script>
</head>
<body>


<crowdAuth:isNotAuthenticated>

   <h1 class="featuredarticle title" style="padding-left:65px;">Register<span> for an account</span> </h1><br/>

  <g:form class="simpleform" id="signup-form" url="[controller:'user',action:'register']">

      <p>
        <label for="firstName">First Name:</label>
        <g:textField name="firstName" id="firstName" value="${user?.firstName}" class="required"/>
      </p>

      <p>
        <label for="lastName">Last Name:</label>
        <g:textField name="lastName" id="lastName" value="${user?.lastName}" class="required" />
      </p>

      <p>
        <label for="email">Email (this will be your username):</label>
        <g:textField name="email" id="email" value="${user?.email}" class="required" />
      </p>
     
      <p>
        <label for="password">Password:</label>
        <g:passwordField name="password" id="password" class="required" />
      </p>
     
      <p>
        <label for="confirm">Confirm Password</label>
        <g:passwordField name="confirm" id="confirm" class="required" />
      </p>

      <!-- If the user was redirected from his/her email, the url will have the token. else, they can sign up and get put into a pending users group. -->
      <g:if test="${!params.containsKey('token')}"> <!-- no token in URL -->
        <p>
          <label for="token">Token</label>
          <g:textField name="token" />
        </p>
      </g:if>
      <g:else> <!-- token in url -->
        <g:hiddenField name="token" value="${params.token}"/>
      </g:else> 

      <p>
        <button id="submit_btn" name="submit_btn" type="submit" onmouseover="showErrors()" class="button-link btn">Create Account</button>
      </p>

      <div id="userphone">
        If you can see this field, don't fill it out.
        <input type="text" name="body" value="" />
      </div>

  </g:form>
</crowdAuth:isNotAuthenticated>
<crowdAuth:isAuthenticated>
  <p style="position:absolute;right:75px;top:150px;">
    You are already logged in. Please <g:link controller="logout">log out</g:link> before attempting to register.
  </p>
</crowdAuth:isAuthenticated>
</body>
</html>