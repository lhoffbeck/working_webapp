<html>
    <head>
        <meta name="layout" content="admin"/> 
        <title>Home</title>
        <style>
        	
        </style>
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

    	<g:form url="[controller:'usermanagement', action:'adduser']">
	        <label for="email">Email:</label>
	        <div>
	          <g:textField name="email" value="${PendingUser?.email}"
	            class="${hasErrors(bean:PendingUser,field:'email','errors')} input" style="width: 200px;"/>
	        </div>
	        <br/>
	       	<label for="group">District:</label>
			<div>
				<g:select name="district" from="${groupList}" value="${PendingUser?.district}" noSelection="${["":'Select a district']}"/>
			</div>
			<br/>
			<br/>

			<table>
				<tr>
					<td>Operational Changes:</td>
					<td><g:checkBox name="permOperational_Changes"/></td>
				</tr>
				<tr>
					<td>Reports:</td>
					<td><g:checkBox name="permReports"/></td>
				</tr>
				<tr>
					<td>Notifications:</td>
					<td><g:checkBox name="permNotifications"/></td>
				</tr>
			</table>

			</br>

			<g:submitButton class="button" name="submitButton" value="Create!" />
		</g:form>
    </body>
</html>
