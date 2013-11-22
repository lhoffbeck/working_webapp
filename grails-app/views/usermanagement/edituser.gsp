<html>
<head>
    <title>Edit User</title>      
    <meta name="layout" content="admin"/> 

    <link rel="stylesheet" href="${resource(dir:'css',file:'form_style.css')}" />
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

     <style type="text/css">

        #userTable
        {
            font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
            width:100%;
            border-collapse:collapse;

            /* make the text nonselectable */
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            cursor: default;
        }
        #userTable td, #userTable th 
        {
            font-size:1em;
            border:3px solid #8CC13F;
            padding:3px 7px 2px 7px;
        }
        #userTable th 
        {
            font-size:1.1em;
            text-align:left;
            padding-top:5px;
            padding-bottom:4px;
            background-color:#8CC13F;
            color:#ffffff;
        }
        .alt 
        {
            background-color:#D1E6B2;
        }

        .hover { 
            background-color: #A3A3A3; 
        }

        tr:not(:first-child):hover {
            cursor: pointer;
        }

        #column{
            float: left;
        }

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

    <g:if test="selectedDistrict != null">
        <script type="text/javascript">
            $("#hide").css("display","block");
            $("#show").css("display","none");
            $("#districtPicker").css("display","none");
        </script>
    </g:if>
   
    <div id="all">

        <div id="districtPicker">
            <g:form  class="fancyForm" url="[controller:'usermanagement', action:'edituser']" id="filter" style="width:275px;">
                <g:select name="district" class="dropdown" from="${groupList}" value="${selectedDistrict != null ? selectedDistrict : ''}" onchange="this.form.submit()" noSelection="${['null':'Select a district']}"/>
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

        <g:if test="${userMap}">

            <g:form url="[controller:'usermanagement', action:'edituser']" id="userform" name="userform">

                <g:hiddenField name="usertable_username" id="usertable_username" value=""/>
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
        </g:if>
        <g:if test="${selectedUser}">
        <script type="text/javascript">alert("hellooooooo");</script>
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
</body>
</html>
