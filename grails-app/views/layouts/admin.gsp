 <!DOCTYPE html>
 <html>
     <head>
         <title>Home</title>
         <q:javascript library='jquery' />

         <link rel="stylesheet" href="${resource(dir:'css',file:'template.css')}" />

         <r:layoutResources/>
         <g:layoutHead />
         <style type="text/css">

            html,body{
                height: 100%;
            }

            #everything{
                position: relative;
                padding: 0 0 115px;
                height: 100%;
            }

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
                 margin: -37px 5px -60px 8px;
             }

             #topbar{
                 position: fixed;
                 width:100%;
                 height:30px; 
                 background-color: #f0f0f0;
                 background-image: url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/light/mod-gradient.png);
                 background-image:url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/patterns/textile.png); 
                 background-repeat:repeat;
                 display:block;
                 z-index: 100;
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
                 float left;
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
                     background-color: #333;
                     background-image:none;
                     z-index: 1;
                     color:#fff;
                 }

                    #mainNav ul li:hover a{
                        color: #8cc13f;
                    }

                    #mainNav ul li:hover ul a{
                        color:#fff;
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


             #mainNav #loginInfo{
                 position: relative;
                 float: left;
                 margin: 0px 50px;
                 top: -40px;
                 height: 30px; 
                 color: #fff;

                 font-family: "NovecentowideNormal",Helvetica,Arial,sans-serif;
                 font-size:12px;
                 font-weight: normal;
                 text-shadow: -1px -1px 1px #000;
                 text-align: center;
                 line-height: 30px;
             }

             #mainNav #loginInfo a{
                color: #8cc13f;
                text-decoration: none;
             }


             #content{
                 position: absolute;
                 margin-top: 20px;
                 top:125px;
                 width:100%;
                 z-index: 0;
             }             

             #foot{
                background-color: #8BB757;
                
                line-height: 1.6em;
                font-size: 12px;
                color:white;
                text-shadow: -1px -1px 1px rgba(0,0,0,0.5);

                width:100%;
                text-align: center;

                 position: absolute;
                 bottom: 0px;
                 width: 100%;
                 margin: 0 auto;
                 background-image: url(${resource(dir:'images',file:'leather.png')});
             }

             #foot a{
                color: #ddecc5;
                text-decoration: none;
                outline: none;
             }

         </style>
     </head>
     <body>
        <crowdAuth:isAuthenticated>
            <crowdAuth:ifAllGranted group="Admins">
                <div id="everything">
                     <div id="topbar">
                         <div id="greenNav">
                             <div id="innerBackNav">
                                 <div id="mainNav">
                                    <div id="logo">
                                        <img src="${resource(dir:'images',file:'logo.png')}" />
                                    </div>
                                    <ul>
                                        <li>
                                            <a href="/webportal/usermanagement/index"> USER MANAGEMENT</a>
                                            <ul>
                                               <li><g:link controller="usermanagement" action="adduser">Add a User</g:link></li>
                                               <li><g:link controller="usermanagement" action="edituser">Edit Users</g:link></li>
                                           </ul>
                                        </li>
                                        <li>
                                            <a href="/webportal/usermanagement/index"> REPORTS</a>
                                        </li>
                                        <li>
                                            <a href="/webportal/usermanagement/index"> TESTING</a>
                                        </li>
                                    </ul>
                                    <div id = "loginInfo">
                                         Hello, <crowdAuth:authenticatedUserInfo property="username"/><br/>
                                         <g:link controller="logout">Sign Out</g:link>
                                    </div>
                                 </div>
                                 
                             </div>
                         </div>
                     </div>
                     <div id="content" style="padding-bottom:75px;">
                          <g:layoutBody />
                     </div>
                     <div id="foot">
                        <g:render template="/common/footer" />
                     </div> 
                </div>
            </crowdAuth:ifAllGranted>
        </crowdAuth:isAuthenticated>
        <crowdAuth:isNotAuthenticated>
            <p>You do not have permission to view this page. Please <g:link controller="login">Login</g:link> or contact helpdesk@leveldatainc.com.</p>
        </crowdAuth:isNotAuthenticated>
        


     </body>
</html>