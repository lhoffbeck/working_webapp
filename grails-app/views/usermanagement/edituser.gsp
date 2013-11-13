<html>
    <head>
        <meta name="layout" content="admin"/> 
        <title>Home</title>
        
    

    </head>
    <body>

    <g:if test="${userList}">
    	<table id="users">
    		<tr>
    			<th>Last</th>
    			<th>First</th>
    		</tr>
    		<g:each in="${userList}">
    			<tr id="${it.getValue().username}" data-information='${it}'>
    				<td id="lastName">${it.getValue().lastName}</td>
    				<td id="firstName">${it.getValue().firstName}</td>
                    <div id="hidden information">
                        <td id="displayName">${it.getValue().displayName}</td>
                        <td id="username">${it.getValue().username}</td>
                        <td id="district">${it.getValue().district}</td>
                        <td id="email">${it.getValue().email}</td>
                    </div>
    			</tr>
    		</g:each>
    	</table>
    </g:if>
    <br/>

    <g:form url="[controller:'usermanagement', action:'edituser']" id="edit">
        <label for="email">Email:</label>
            <g:textField name="email" value="" style="width: 200px;"/>
            <br/>
            <label for="group">District:</label>
            <g:select name="district" from="${groupList}" value="" noSelection="${['null':'Select a district']}"/>
            <br/>
            <br/>

            <table>
                <tr>
                    <td>Information:</td>
                    <td><g:checkBox name="perm1" value=""/></td>
                </tr>
                <tr>
                    <td>Reports:</td>
                    <td><g:checkBox name="perm2" value=""/></td>
                </tr>
                <tr>
                    <td>Special Sauce:</td>
                    <td><g:checkBox name="perm3" value=""/></td>
                </tr>
            </table>

            </br>

            <g:submitButton class="button" name="submitButton" value="save" />
        </g:form>

        <g:javascript library="jquery" plugin="jquery"/>

    	<script type="text/javascript">
        	window.onload = addRowHandlers;

        	function addRowHandlers(){
	        	table = document.getElementById("users");
                rows = table.rows;
	        	for (var i = 0; i < rows.length; i++) {
                    rows[i].onclick = (function() {
                        var cnt = i;
                        return function() {
                            $("#edit #email")[0].value =  $("#users #"+this.cells[0].parentNode.id+" #email")[0].innerHTML;
                        }    
                    })(i);
                }
			}

			
        </script>
    </body>
</html>
