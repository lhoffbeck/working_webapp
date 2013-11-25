<html>
     <head>
         <title>Home</title>
         <q:javascript library='jquery' />

         <link rel="stylesheet" href="${resource(dir:'css',file:'template.css')}" />

         <r:layoutResources/>
         <g:layoutHead />
         <style type="text/css">

            body { 
                margin: 0px;
                background-image: url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/light/body-overlay.png);
                background-size: 100% 100%;
                background-position: 0px 90px;
                background-repeat:no-repeat;   
             }

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
                 top: -12px;
                 height: 60px;
                 width: 890px;
                 margin: 0px auto;
                 padding: 0px 35px;

             }
             #logo{
                 height: 153px;
                 width: 145px;
                 float:left;
                 margin: -37 5 -60 8;
             }

             #topbar{
                 position: absolute;
                 width:100%;
                 height:30px; 
                 background-color: #f0f0f0;
                 background-image: url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/light/mod-gradient.png);
                 background-image:url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/patterns/textile.png); 
                 background-repeat:repeat;
                 display:block;
             }

             #mainNav ul{
                 font-family: "NovecentowideNormal",Helvetica,Arial,sans-serif;
                 font-size:12px;
                 font-weight: normal;
                 color: #fff;
                 text-shadow: -1px -1px 1px #000;
                 text-align: center;
                 list-style-type: none;
                 line-height: 30px;

                 text-transform: uppercase;

                 height: 30px; 
                 
             }
             #mainNav ul li{
                 float: left;
                 padding: 15px 20px;
                 background-image:url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/dark/menu-separator.png);
                 background-repeat:no-repeat;
                 background-position: 0% 50%;

                 transition: background-color 0.2s linear;
                 transition-property: background-color;
                 transition-duration: 0.2s;
                 transition-timing-function: linear;
                 transition-delay: initial;

                 border-bottom-color: rgb(76, 74, 71);
                border-bottom-style: none;
                border-bottom-width: 0px;
                border-image-outset: 0px;
                border-image-repeat: stretch;
                border-image-slice: 100%;
                border-image-source: none;
                border-image-width: 1;
                border-left-color: rgba(0, 0, 0, 0);
                border-left-style: solid;
                border-left-width: 7px;
                border-right-color: rgba(0, 0, 0, 0);
                border-right-style: solid;
                border-right-width: 7px;
                border-top-color: rgb(137, 189, 61);
             }

             #mainNav ul li:hover{
                background-color: #333;
             }

             #mainNav ul li a{
                 text-decoration: none;
                 white-space: nowrap;
                 cursor: pointer;
                 z-index: 100;
                 color: #fff;
             }

             #mainNav ul ul{
                display: none;
             }

           

             #content{
                 position: absolute;
                 margin-top: 20px;
                 top:125px;
                 width:100%;
             }

             #footer{
                 position: absolute;
                 bottom: 0px;

                 width: 100%;
                 margin: 0 auto;
             }
             

         </style>
     </head>
     <body>
        <crowdAuth:isAuthenticated>
            <crowdAuth:ifAllGranted group="Admins">
                 <div id="topBar"/>
                     <div id="greenNav">
                         <div id="innerBackNav">
                             <div id="mainNav">
                                <div id="logo">
                                    <img src="/webportal/static/images/logo.png" />
                                </div>
                                <ul>
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
                 <div id"backgroudGradient">
                     <div id="content">
                        <g:layoutBody />
                     </div>
                     <div id="footer">
                        <g:render template="/common/footer" />
                     </div>  <!--END #footer -->
                </div>
            </crowdAuth:ifAllGranted>
        </crowdAuth:isAuthenticated>
        <crowdAuth:isNotAuthenticated>
            <p>You do not have permission to view this page. Please <g:link controller="login">Login</g:link> or contact helpdesk@leveldatainc.com.</p>
        </crowdAuth:isNotAuthenticated>
     </body>
</html>