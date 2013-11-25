<html>
    <head>
        <meta name="layout" content="admin"/> 
        <title>Home</title>

 		<link rel="stylesheet" href="${resource(dir:'css',file:'form_style.css')}" />
  		<link rel="stylesheet" href="${resource(dir:'css',file:'nod.css')}" />

 		<script src="${resource(dir:'js',file:'1.8.0.jquery.min.js')}"></script>
		<script src="${resource(dir:'js',file:'bootstrap.min.js')}"></script>
		<script src="${resource(dir:'js',file:'nod.js')}"></script>
    </head>
    <body>
		<g:if test="${ flash.message }" >
	        <div id="successMessage">${ flash.message }</div>
	    </g:if>
    	<g:hasErrors bean="${pendUser}">
	        <div class="errors">
	          <g:renderErrors bean="${pendUser}" as="list"/>
	        </div>
      	</g:hasErrors>
    	
      	<br/>
      	<br/>

    	<g:form id="theform" class="fancyForm" style="width: 400;" url="[controller:'usermanagement', action:'adduser']">

      		<h1 class="featuredarticle title" style="padding-left:65px;">ADD<span> an account</span> </h1><br/>

    		<p>
	        	<label for="email">Email:</label>
	          	<g:textField name="email" id="email" value="${PendingUser?.email}" style="width: 200px;"/>
	        </p>

	        <p>
	       		<label for="group">District:</label>
				<g:select name="district" from="${districtList}" class="dropdown" value="${PendingUser?.district}" noSelection="${["":'Select a district']}"/>
			</p>

			<div class="checkbox">
				<g:checkBox style="border:none;box-shadow:none;" id="check1" name="permOperational_Changes"/>
				<label for="check1" class="ckbx">Operational Changes</label>
				<br>
				<g:checkBox style="border:none;box-shadow:none;" id="check2" name="permReports"/>				
				<label for="check2" class="ckbx">Reports</label>
				<br>
				<g:checkBox style="border:none;box-shadow:none;" id="check3" name="permNotifications"/>
				<label for="check3" class="ckbx">Notifications</label>
			</div>

			<g:submitButton class="button-link" name="submitButton" value="Create!" />
			<script type="text/javascript">
				var metrics = [
	        		[ '#email', 'presence', 'Cannot be empty' ],
			        [ '#email', 'email' , 'Invalid email address' ]
			    ];

		      	$("#theform").nod(metrics);

			</script>
		</g:form>
    </body>
</html>
