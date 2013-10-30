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
        	#innerNav{

        	}
        	.topNav{
        		list-style: none;
        		color:white;
        	}
        	.topNav li{
        		display: inline;
        	}
        	#content{
                position: absolute;
                top:125px;
                width:100%;
        	}
        	body { margin:0px; }
        </style>

    </head>
    <body>
        <div id="topBar"/>
        <div id="greenNav">
        	<div id="innerBackNav">
        		<div id="innerNav">
        			<ul class="topNav">
        				<li>
                        	<g:link controller="usermanagement" style="color:white;"> User Management</g:link>
                        </li>
        			</ul>
        		</div>
        	</div>
        </div>
        <div id="content">
        	<g:layoutBody />
        </div>

    </body>
</html>