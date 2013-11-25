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

             #mainNav{
                 position: relative;
                 top: -12px;
                 height: 60px;
                 width: 890px;
                 margin: 0px auto;
                 padding: 0px 35px;
            }

             #mainNav ul ul{
                 display: none;
            }

                #mainNav ul li:hover > ul{
                     display: block;
                }

             #mainNav ul{
                 position: relative;
                 height: 30px; 
                 color: #fff;

                 font-family: "NovecentowideNormal",Helvetica,Arial,sans-serif;
                 font-size:12px;
                 font-weight: normal;
                 text-shadow: -1px -1px 1px #000;
                 text-align: center;
                 list-style-type: none;
                 line-height: 30px;
                 text-transform: uppercase;
             }

             #mainNav ul #first{
                 background-image: none;
             }

                 #mainNav ul:after {
                     clear:both;
                     display:block;
                 }

                  #mainNav ul li{
                     float: left;
                     padding: 15px 20px;
                     margin: 0px -2px;

                     background-image:url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/dark/menu-separator.png);
                     background-repeat:no-repeat;
                     background-position: 0% 50%;
                     background-position: 100% 50%;

                     transition: background-image 0.2s linear;
                     transition-property: background-color;
                     transition-duration: 0.2s;
                     transition-timing-function: linear;
                     transition-delay: initial;
                 }

                 #mainNav ul li:hover{
                     background:url(../images/333.png);
                     z-index: 1;
                 }

                    #mainNav ul li:hover a{
                        color: #8cc13f;
                    }

                 #mainNav ul li a{
                     color: #fff;
                     display: block; 
                     text-decoration: none;
                     cursor: pointer;
                 }

             #mainNav ul ul{
                 position: absolute;
                 height: 100%
             }

             #mainNav ul ul li{
                 position: relative;
                 float:none;
                 background-image:none; 
                 background-color: #333;
             }
                 #mainNav ul ul li a{
                     color: #fff;
                     cursor: pointer;
                 }

                #mainNav ul ul li a:hover {
                    color: #8cc13f;
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
                                    <li>
                                        <a href="/webportal/usermanagement/index"> USER MANAGEMENT</a>
                                        <ul>
                                           <li><g:link controller="usermanagement" action="adduser">Add a User</g:link></li>
                                           <li><g:link controller="usermanagement" action="edituser">Pending Users</g:link></li>
                                       </ul>
                                    </li>
                                    <li>
                                        <a href="/webportal/usermanagement/index"> REPORTS</a>
                                    </li>
                                    <li>
                                        <a href="/webportal/usermanagement/index"> TESTING</a>
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