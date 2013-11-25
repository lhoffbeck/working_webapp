<html>
     <head>
         <title>Home</title>
         <q:javascript library='jquery' />
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
         <script src="${resource(dir:'js',file:'dropit.js')}"></script>
         <link rel="stylesheet" href="${resource(dir:'css',file:'dropit.css')}" />
         <link rel="stylesheet" href="${resource(dir:'css',file:'template.css')}" />

         <r:layoutResources/>
         <g:layoutHead />

         <style type="text/css">
            #successMessage{
                background-color: #66A366;
            }
            .errors{
                background-color: #FF4D4D;
            }
            .errors ul {
                list-style-type: none;
                padding:0.5em; 
                margin:0;
            }

             #topbar{
                 position: absolute;
                 width:100%;
                 height:30px; background-image:url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/patterns/plaid-fabric.png); 

                 background-repeat:repeat;
                 display:block;
             }
             #greenNav{
                 background-color: #8cc13f;
                 position: absolute;
                 top: 30px;
                 width:100%;
                 height:68px;
                 display:block;
             }
             #innerBackNav{
                 background-color: #333;
                 background-image: url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/dark/mod-gradient.png);
                 background-repeat:repeat;
                 position: absolute;
                 top: 4px;
                 width:100%;
                 height:60px;
             }
             #innerBackNav{
                 background-image: url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/dark/nav-lines.png);
                 background-repeat:repeat;
                 position: absolute;
                 top: 4px;
                 width:100%;
                 height:60px;
             }
             #mainNav
             {
                 position: relative;
                 top: -16px;
                 height: 60px;
                 width: 866px;
                 margin: 0px 50px;

             }
             #logo{
                 height: 153px;
                 width: 158px;
                 float:left;
             }

             #logo img{
                 margin: -37 5 -60 8;
             }

             #mainNav ul{
                 height: 60px;
                 margin-left: 50px;
                 float:left;
                 list-style-type: none;
                 text-align: center;
                 padding:0px;
             }
             #mainNav ul li{
                 float: left;
                 padding: 15px 20px;
             }

             #mainNav ul li a{
                 text-decoration: none;
                 white-space: nowrap;
                 cursor: pointer;
                 z-index: 100;
                 line-height: 30px;
                 font-size: 0.9em;
                 font-family: "NovecentowideNormal",Helvetica,Arial,sans-serif;
                 text-shadow: -1px -1px 1px #000;
                 color: #fff;
             }
             #content{
                 position: absolute;
                 margin: 5px;
                 top:125px;
                 width:100%;
             }
             body { 
                margin: none;
                size: 100% 100%;
                background-color: #fff;
                background-image: url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/light/body-overlay.png);
                background-size: 100% 100%;
                background-repeat:no-repeat;   
            }
             #footer{
                 position: absolute;
                 bottom: 0px;
                 width: 100%;
                 margin: 0 auto;
             }
             #mainNav ul ul{
                display: none;
             }
             #mainNav ul li:hover > ul{
                display: block;
             }
             .subnav{
                display: block;
             }
             .topnav{
                display: inline-block;
             }

         </style>
         <script type="text/javascript">
            $(document).ready(function() {
                $('.menu').dropit();
            });
         </script>
     </head>
     <body >
        <crowdAuth:isAuthenticated>
            <crowdAuth:ifAllGranted group="Admins">
                 <div id="topBar"/>
                     <div id="greenNav">
                         <div id="innerBackNav">
                             <div id="mainNav">
                                <div id="logo">
                                    <img src="/webportal/static/images/logo.png" />
                                </div>
                                <ul class="menu">
                                    <li id="userManagement">
                                        <a href="/webportal/usermanagement/index" style="color:white;"> USER MANAGEMENT</a>
                                        <ul>
                                           <li><g:link controller="usermanagement" action="adduser">Add a User</g:link></li>
                                           <li><g:link controller="usermanagement" action="edituser">Pending Users</g:link></li>
                                       </ul>
                                    </li>
                                    <li id="reports">
                                        <a href="/webportal/usermanagement/index" style="color:white;"> REPORTS</a>
                                    </li>
                                </ul>
                             </div>
                         </div>
                     </div>
                 </div>
                    <div id="content">
                        <g:layoutBody />
                    </div>
                 <div id="footer">
                    <g:render template="/common/footer" />
                 </div>  <!--END #footer -->
            </crowdAuth:ifAllGranted>
        </crowdAuth:isAuthenticated>
        <crowdAuth:isNotAuthenticated>
            <p>You do not have permission to view this page. Please <g:link controller="login">Login</g:link> or contact helpdesk@leveldatainc.com.</p>
        </crowdAuth:isNotAuthenticated>
     </body>
</html>