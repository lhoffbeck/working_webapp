<html>
<head>
    <title>Home</title>
        
        
    <meta name="layout" content="admin"/> 
</head>
<body>
    <style type="text/css">
            .hidden {
                visibility:hidden;
            }
    </style>

    <g:form url="[controller:'usermanagement', action:'edituser']" id="filter">
        <g:select name="district" from="${groupList}" value="test" noSelection="${['null':'Select a district']}"/>
        <g:submitButton class="button" name="submitButton" value="Filter" />
    </g:form>

    <g:if test="${userList}">
    	<table id="users">
    		<tr>
    			<th>Last</th>
    			<th>First</th>
    		</tr>
    		<g:each var="user" in="${userList}">
    			<tr id="${user.getValue().username}">
    				<td id="lastName">${user.getValue().lastName}</td>
    				<td id="firstName">${user.getValue().firstName}</td>

                    <td id="displayName" class="hidden">${user.getValue().displayName}</td>
                    <td id="username" class="hidden">${user.getValue().username}</td>
                    <td id="district" class="hidden">${user.getValue().confirmedDistricts[0]}</td>
                    <td id="email" class="hidden">${user.getValue().email}</td>
                    <g:each var="permision" in="${user.getValue().permisions}">
                        <td id="permisions" class="hidden">${permision}</td>
                    </g:each>
                    <g:each var="attribute" in="${user.getValue().attributes}">
                         <td id="${attribute.getKey()}" class="hidden">${attribute.getValue()}</td>
                    </g:each>
    			</tr>
    		</g:each>
    	</table>
    
    <br/>

        <g:form url="[controller:'usermanagement', action:'edituser']" id="edit">
            <label for="email">Email:</label>
            <g:textField name="email" value="" style="width: 200px;"/>
            <br/>
            <label for="group">District:</label>
            <g:select name="district" from="${groupList}" value="test" noSelection="${['null':'Select a district']}"/>
            <br/>
            <br/>

            <table id="permisions">
                <g:each var="${perm}" in="${permList}">
                    <tr>
                        <td>${perm}:</td>
                        <td><g:checkBox name="${perm}" value=""/></td>
                    </tr>
                </g:each>
            </table>

            </br>

            <g:submitButton class="button" name="submitButton" value="save" />
        </g:form>
    </g:if>
    
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
                        
                        var options = $("#edit #district option")
                        var selectedOptionText = $("#users #"+this.cells[0].parentNode.id+" #district")[0].innerHTML
                        for (var i = 0; i < options.length; i++) {
                            if (options[i].innerHTML == selectedOptionText) {
                                options[i].selected = true;
                                break;
                            }
                            options[i].selected = false;
                        }

                        var permisionOptions = $("#edit #permisions [type=checkbox]")
                        console.log(permisionOptions)
                        var permisionsHad = $("#users #"+this.cells[0].parentNode.id+" #permisions")
                        console.log(permisionsHad)
                        for (var i = 0; i < permisionOptions.length; i++) {permisionOptions[i].checked = false;}
                        for (var i = 0; i < permisionOptions.length; i++) {
                            for (var j = 0; j < permisionsHad.length; j++) {
                                console.log(permisionOptions[i].id.toString());
                                console.log(permisionsHad[j].innerHTML.toString());
                                if (permisionOptions[i].id == permisionsHad[j].innerHTML) {
                                    console.log("match");
                                    permisionOptions[i].checked = true;
                                    break;
                                }
                            }
                        }


                    }    
                })(i);
            }
		}
    </script>
</body>
</html>
