<html>
    <head>
        <meta name="layout" content="admin"/> 
        <title>Home</title>
        <style>
        	
        </style>
    </head>
    <body>
		<g:if test="${ flash.message }" >
	        <div id="hello">${ flash.message }</div>
	    </g:if>
    	<g:hasErrors bean="${pendingUser}">
	        <div class="errors">
	          <g:renderErrors bean="${pendingUser}"/>
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
				<g:select name="district" from="${groupList}" value="${PendingUser?.district}" noSelection="${['null':'Select a district']}"/>
			</div>
			<br/>
			<br/>

			<table>
				<tr>
					<td>Information:</td>
					<td><g:checkBox name="perm_information"/></td>
				</tr>
				<tr>
					<td>Reports:</td>
					<td><g:checkBox name="perm_report"/></td>
				</tr>
				<tr>
					<td>Admin:</td>
					<td><g:checkBox name="perm_admin"/></td>
				</tr>
			</table>

			</br>

			<g:submitButton class="button" name="submitButton" value="Create!" />
		</g:form>
    </body>
</html>
