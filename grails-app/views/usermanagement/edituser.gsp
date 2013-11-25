<html>
<head>
    <meta name="layout" content="admin"/> 

    <link rel="stylesheet" href="${resource(dir:'css',file:'form_style.css')}" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'edituser.css')}" />
    <script type="text/javascript">
        $(document).ready(function(){
            $("#hide").click(function(){
                hide();
            });
            $("#show").click(function(){
                show();
            });
        });

        function hide(){
            $("#districtPicker").slideUp();
            $("#hide").css("display","none");
            $("#show").css("display","block");
        }

        function show(){
            $("#districtPicker").slideDown();
            $("#show").css("display","none");
            $("#hide").css("display","block");
        }

        function submitUserTable(row){ 

            // gets the email rd from the selected row
            var username = row.cells[2].innerHTML;
            document.getElementById('usertable_username').value = username;
            document.forms['userform'].submit(); 
        }
    </script>
    
    <title>Edit User</title>      
</head>
<body>
    <br/>
    <br/>
    <g:if test="${ flash.message }" >
        <div id="successMessage">${ flash.message }</div>
    </g:if>
   
    <div id="all">

        <h1 class="featuredarticle title" style="text-align:center;">Edit<span> a user account</span> </h1><br/>

        <div id="districtPicker">

            <g:form  class="fancyForm" url="[controller:'usermanagement', action:'edituser']" id="filter" style="width:275px;">
                <g:select name="district" class="dropdown" from="${districtList}" value="${selectedDistrict ? selectedDistrict : ''}" onchange="this.form.submit()" noSelection="${['':'Select a district']}"/>
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

        <!--<g:if test="${userMap && userMap.size == 0}">
            <h2>There are no users currently in this district</h2>
        </g:if>-->

        <div class="wrapper" style="margin: 0 auto; width: 850px">
            <g:if test="${userMap}">

                <div class="leftColumn" style="width: 350px; float:left;">

                    <g:form url="[controller:'usermanagement', action:'edituser']" id="userform" name="userform">

                        <g:hiddenField name="usertable_username" id="usertable_username" value=""/>
                        <g:hiddenField name="district" id="district" value="${selectedDistrict}"/>
                        <table id="userTable" class="">

                            <tr>
                                <th>First</th>
                                <th>Last</th>
                                <th>Email</th>
                            </tr>

                            <!-- counter used to do odd/even row coloring -->
                            <g:def var="counter" value="${1}" /> 

                            <g:each var="user" in="${userMap}">
                                <tr id="${user.value.username.split('\\@')[0]}" onclick="submitUserTable(this);" class="${counter++ % 2 == 0 ? 'alt' : ''}" >
                                    <td id="firstName">${user.value.firstName}</td>
                                    <td id="lastName">${user.value.lastName}</td>
                                    <td id="email">${user.value.email}</td>
                                </tr>
                            </g:each>
                        </table>
                    </g:form>
                </div>
            </g:if>
        <g:if test="${selectedUser}">
            <div class="rightColumn" style="width: 400px; margin-left: 400px;">
                <g:form class="fancyForm" url="[controller:'usermanagement', action:'edituser']" id="edit">
                    <g:hiddenField name="district" id="district" value="${selectedDistrict}"/>
                    <p>
                        <label for="userName">Username: </label>
                        <g:textField name="userName" value="${selectedUser.username}" readonly style="background-color:#CFCFCF;"/>
                    <p>
                        <label for="displayName">Display Name: </label>
                        <g:textField name="displayName" value="${selectedUser.displayName}" />
                    <p>
                        <label for="firstName">First Name:</label>
                        <g:textField name="firstName" value="${selectedUser.firstName}"/>
                    <p>
                        <label for="lastName">Last Name:</label>
                        <g:textField name="lastName" value="${selectedUser.lastName}" />
                    <p>
                        <label for="email">Email:</label>
                        <g:textField name="email" value="${selectedUser.email}" />
                        <g:hiddenField name="oldDistrict" value="${selectedUser.district}"/>
                    <p>
                        <label for="group">District:</label>
                        <g:select name="newDistrict" from="${districtList}" class="dropdown" noSelection="${['null':'Select a district']}" value="${selectedUser.district}"/>
                    <br/>
                    <br/>

                    <div class="checkbox">
                        <g:each var="${perm}" in="${permList}">
                            <g:def var="perm_no_spaces" value="${perm.toString().replace(' ','_')}" /> 

                            <g:hiddenField name="old_perm${perm_no_spaces}" value="${userPerms.contains(perm)}"/>
                            <g:checkBox style="border:none;box-shadow:none;" id="perm${perm_no_spaces}" name="perm${perm_no_spaces}" checked="${userPerms.contains(perm)}"/>
                            <label for="perm${perm_no_spaces}" class="ckbx">${perm}</label>
                            <br/>
                        </g:each>
                    </div>

                    </br>
                    <g:submitButton name="submitButton" class="button-link" value="Save" />
                </g:form>
            </div>
        </g:if>
    </div>
    
    <g:javascript library="jquery" plugin="jquery"/>

	<script type="text/javascript">

        // handle hover event in jquery to make it easier to work with the alternating row color in the table.
        $("table").delegate('tr','mouseover mouseleave', function(e) {
            if (e.type == 'mouseover') {
              $(this).addClass("hover");
            }
            else {
              $(this).removeClass("hover");
            }
        });

    </script>
    <g:if test="${userMap}">
        <script type="text/javascript">
            $("#show").css("display","block");
            $("#hide").css("display","none");
            $("#districtPicker").css("display","none");
        </script>
    </g:if>
</body>
</html>
