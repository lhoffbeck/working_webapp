

<html>
    <head>

        <title>Home</title>

        <style type="text/css">




            #topbar{
                position: absolute;
                width:100%;
                height:30px;
background-image:url(http://www.leveldatainc.com/templates/rt_diametric/images/overlays/patterns/plaid-fabric.png);
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
                margin: 0px 386.5px;

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
                margin-left: 158px;
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

                top:125px;
                width:100%;
            }
            body { margin:0px; }
            #footer{
                position: absolute;
                bottom: 0px;
                width: 866px;
                margin: 0px 386.5px;
            }

        </style>



    </head>
    <body>
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
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="content">

    This is a user management page with lotsa user management functions.

        </div>
        <div id="footer">
           <g:render template="/common/footer" />
        </div> <!-- END #footer -->
    </body>
</html>
