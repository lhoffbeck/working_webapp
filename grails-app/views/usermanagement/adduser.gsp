<html>
    <head>
        <meta name="layout" content="admin"/> 
        <title>Home</title>
    </head>
    <body>

    	<g:hasErrors bean="${user}">
	        <div class="errors">
	          <g:renderErrors bean="${PendingUser}"/>
	        </div>
      	</g:hasErrors>
    	

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
					<td><g:checkBox name="perm1" value="${PendingUser?.perm1}"/></td>
				</tr>
				<tr>
					<td>Reports:</td>
					<td><g:checkBox name="perm2" value="${PendingUser?.perm2}"/></td>
				</tr>
				<tr>
					<td>Special Sauce:</td>
					<td><g:checkBox name="perm3" value="${PendingUser?.perm3}"/></td>
				</tr>
			</table>

			</br>

			<g:submitButton class="button" name="submitButton" value="Create!" />
		</g:form>
    </body>
</html>
