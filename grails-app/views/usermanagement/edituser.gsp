<html>
<head>
    <title>Edit User</title>      
    <meta name="layout" content="admin"/> 

    <link rel="stylesheet" href="${resource(dir:'css',file:'form_style.css')}" />
    <script src="${resource(dir:'js',file:'1.8.0.jquery.min.js')}"></script>
    <script type="text/javascript">
        $(document).ready(function(){
          $("#hide").click(function(){
            $("#districtPicker").slideUp();
            $("#hide").css("display","none");
            $("#show").css("display","block");
          });
          $("#show").click(function(){
            $("#districtPicker").slideDown();
            $("#show").css("display","none");
            $("#hide").css("display","block");
          });
        });
    </script>



     <style type="text/css">

       /* #all{
            width: 900px;
            height: 100%;
            margin: 0px auto;
            text-align: center;
        }

        #column{
            float: left;
        }

        #filter{
            margin-top: -100px;
        }

        #users{
            margin-top: 30px;
            border-collapse:collapse;
            border: 1px solid black;
        }

        #users th, #users td{
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }

        #users td{
            width: 200px;
            margin: 5px;
            text-align: center;
        }

        #edit{
            margin-left: 50px;
            text-align: left;
        }


        
        input, td, #all{
            font-size: 20px;
        }

        tr{
            font-size: 22px;
        }
        select{
            font-size: 18px;
        }*/

        .sliderControls{
            width:165px;
            margin: 0 auto; 
        }

        .hidden {
            display: none
        }

        #all{
            padding-top:20px;
        }
        #show{
            display: none;
        }

    </style>
</head>
<body>
   
    <div id="all">

        <div id="districtPicker">
            <g:form url="[controller:'usermanagement', action:'edituser']" id="filter" style="width:275px;">
                <g:select name="district" class="dropdown" from="${groupList}" value="test" onchange="this.form.submit()" noSelection="${['null':'Select a district']}"/>
                <br/>
                <br/>
                <h1 class="featuredarticle title" style="padding-left:107.5px;">OR</h1>
                <div style="padding-left:30px;" id="buttonContainer">
                    <g:submitButton class="button-link" name="submitButton" value="View All" />
                </div>
            </g:form>
        </div>
        <div class="sliderControls">
            <a href="#" id="hide">hide district selector</a>
            <a href="#" id="show">show district selector</a>
        </div>

        <br/>
        <br/>
        <br/>

        <div id="top">

            <g:if test="${userList}">
            	<table id="users" class="fancyTable">

            		<tr>
            			<th>Last</th>
            			<th>First</th>
            		</tr>

            		<g:each var="user" in="${userList}">
            			<tr id="${user.getValue().username.split('\\@')[0]}">

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
        </div>
        <div id="bottom">

            <br/>
                <g:form url="[controller:'usermanagement', action:'edituser']" id="edit">

                    <label for="userName">Username: </label>
                    <g:textField name="userName" value="" style="width: 310px;"/>
                    <br/>
                    <label for="displayName">Display Name: </label>
                    <g:textField name="displayName" value="" style="width: 275px;"/>
                    <br/>
                    <label for="firstName">First Name:</label>
                    <g:textField name="firstName" value="" style="width: 300px;"/>
                    <br/>
                    <label for="lastName">Last Name:</label>
                    <g:textField name="lastName" value="" style="width: 300px;"/>
                    <br/>
                    <label for="email">Email:</label>
                    <g:textField name="email" value="" style="width: 340px;"/>
                    <br/>
                    <g:hiddenField name="oldDistrict" value=""/>
                    <label for="group">District:</label>
                    <g:select name="district" from="${groupList}" value="test" noSelection="${['null':'Select a district']}"/>
                    <br/>
                    <br/>

                    <table id="permisions">
                        <g:each var="${perm}" in="${permList}">
                            <tr>
                                <td>${perm}:</td>
                                <g:hiddenField name="oldperm${perm}" value=""/>
                                <td><g:checkBox name="perm${perm}" value=""/></td>
                            </tr>
                        </g:each>
                    </table>

                    </br>

                    <g:submitButton class="button" name="submitButton" value="Save" />
                </g:form>
            </g:if>
        </div>
    </div>
    
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

                        $("#edit #userName")[0].value =  $("#users #"+ this.cells[0].parentNode.id+" #userName")[0].innerHTML;
                        $("#edit #displayName")[0].value =  $("#users #"+this.cells[0].parentNode.id+" #displayName")[0].innerHTML;
                        $("#edit #firstName")[0].value =  $("#users #"+this.cells[0].parentNode.id+" #firstName")[0].innerHTML;
                        $("#edit #lastName")[0].value =  $("#users #"+this.cells[0].parentNode.id+" #lastName")[0].innerHTML;
                        $("#edit #email")[0].value =  $("#users #"+this.cells[0].parentNode.id+" #email")[0].innerHTML;
                        $("#edit #oldDistrict")[0].value =  $("#users #"+this.cells[0].parentNode.id+" #district")[0].innerHTML;

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
                        var permisionsHad = $("#users #"+this.cells[0].parentNode.id+" #permisions")
                        for (var i = 0; i < permisionOptions.length; i++) {permisionOptions[i].checked = false;}
                        for (var i = 0; i < permisionOptions.length; i++) {
                            for (var j = 0; j < permisionsHad.length; j++) {
                                if (permisionOptions[i].id == "perm"+permisionsHad[j].innerHTML) {
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
