<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0028)http://www.leveldatainc.com/ -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb" lang="en-gb" slick-uniqueid="3">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


      <title><g:layoutTitle default="Login to Web Portal" /></title>
      <g:layoutHead />
      <link rel="stylesheet" href="${resource(dir:'css',file:'rokbox-style.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'grid-12.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'gantry-core.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'joomla-core.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'overlays.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'body-light.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'menu-dark.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'typography.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'extensions.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'demo-styles.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'template.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'template-webkit.css')}" />
      <link rel="stylesheet" href="${resource(dir:'css',file:'fusionmenu.css')}" />

      <style type="text/css">
         th:hover, tr:hover {
              background: #E1F2B6;
            }
            html{
                min-height: 100%;
                height: auto;
                margin: 0 auto -50px;
            } 
            #loginDialog{
                height: 300px;
                float: right;
                margin-top: 150px;
                border: 0px solid black;
                text-align: center;
            }
         #rt-main-container a, #rt-main-container h1 span, #rt-main-container .module-title .title span,#rt-body-surround .sprocket-lists .sprocket-lists-container li.active .sprocket-lists-title, body #roksearch_results h3, body #roksearch_results a, .item-title {color:#A3CD65;}
         #rt-navigation, #rt-navigation .rt-menubar ul.menutop li.active {background-color:#8cc13f;}
         #rt-main-container .readon span, #rt-main-container .readon .button, .component-content .formelm-buttons button {background-color:#8cc13f;}
         #rt-body-surround .box1 .module-surround, #rt-body-surround .box4 .module-surround, .rg-grid-view .tag, .rg-list-view .tag, .rg-detail-slicetag .tag, .rg-detail-filetag .tag  {background-color:#A3CD65;}
         .menutop .rt-arrow-pointer {border-top-color:#89bd3d;}
         #rt-main-container.body-overlay-light a:hover, #rt-main-container.body-overlay-light .title a:hover span {color:#7ead38;}
         #rt-main-container.body-overlay-dark a:hover, #rt-main-container.body-overlay-dark .title a:hover span {color:#c6e09f;}
         #rt-body-surround.body-accentoverlay-dark .box1 a, #rt-body-surround.body-accentoverlay-dark .box1 .title span, #rt-body-surround.body-accentoverlay-dark .box4 a, #rt-body-surround.body-accentoverlay-dark .box4 .title span, #rt-body-surround.body-accentoverlay-dark .box5 .title span {color:#c6e09f;}
         #rt-body-surround .box4 .title, #rt-body-surround .box1 .title {text-shadow: -1px 1px 0 #A3CD65, -3px 3px 0 rgba(0,0,0,0.15);}
         #rt-body-surround .box1 a, #rt-body-surround .box1 a, #rt-body-surround .box1 .title span, #rt-body-surround #rt-top .box4 a, #rt-body-surround #rt-header .box4 a, #rt-body-surround .box4 .title span {color:#c6e09f;}
         #rt-headerblock h1 span, #rt-headerblock .module-title .title span, body #rt-menu ul.menu li a {color:#A3CD65;}
         #rt-headerblock .readon span, #rt-headerblock .readon .button {background-color:#8cc13f;}
         #rt-headerblock,#rt-headerblock .sprocket-features-arrows .prev, #rt-headerblock .sprocket-features-arrows .next, .layout-showcase .sprocket-features-pagination li {background-color:#f0f0f0;}
         #rt-headerblock .title, #rt-headerblock .paneltitle, #rt-headerblock .panelsubtitle, #rt-headerblock .sprocket-features-title {text-shadow: -1px 1px 0 #f0f0f0, -3px 3px 0 rgba(0,0,0,0.2);}
         #rt-headerblock .box1 .module-surround, #rt-headerblock .box4 .module-surround {background-color:#A3CD65;}
         #rt-headerblock #rt-top a, #rt-headerblock #rt-header a {color:#A3CD65;}
         .headerpanel-overlay-light#rt-headerblock #rt-top a:hover, .headerpanel-overlay-light#rt-headerblock #rt-header a:hover {color:#8cc13f;}
         .headerpanel-overlay-dark#rt-headerblock #rt-top a:hover, .headerpanel-overlay-dark#rt-headerblock #rt-header a:hover {color:#bada8c;}
         #rt-headerblock #rt-top .box1 a, #rt-headerblock #rt-header .box1 a, #rt-headerblock .box1 .title span, #rt-headerblock #rt-top .box4 a, #rt-headerblock #rt-header .box4 a, #rt-headerblock .box4 .title span {color:#c6e09f;}
         #rt-headerblock .box4 .title, #rt-headerblock .box1 .title {text-shadow: -1px 1px 0 #A3CD65, -3px 3px 0 rgba(0,0,0,0.15);}
         #rt-feature h1 span, #rt-feature .module-title .title span {color:#A3CD65;}
         #rt-feature .readon span, #rt-feature .readon .button {background-color:#8cc13f;}
         #rt-feature {background-color:#B0B8AD;}
         #rt-feature .box1 .module-surround, #rt-feature .box4 .module-surround {background-color:#A3CD65;}
         #rt-feature a {color:#A3CD65;}
         #rt-feature .title, #rt-feature .paneltitle, #rt-feature .panelsubtitle {text-shadow: -1px 1px 0 #96a092, -3px 3px 0 rgba(0,0,0,0.2);}
         #rt-feature .feature-accentoverlay-dark .box1 a, #rt-feature feature-accentoverlay-dark .box1 .title span, #rt-feature .feature-accentoverlay-dark .box4 a, #rt-feature .feature-accentoverlay-dark .box4 .title span {color:#c6e09f;}
         #rt-feature .box1 .title, #rt-feature .box4 .title {text-shadow: -1px 1px 0 #A3CD65, -3px 3px 0 rgba(0,0,0,0.2);}
         #rt-feature .box1 a, #rt-feature .box4 a, #rt-feature .box1 .title span, #rt-feature #rt-top .box4 a, #rt-feature #rt-header .box4 a, #rt-feature .box4 .title span {color:#c6e09f;}
         #rt-showcase h1 span, #rt-showcase .module-title .title span, #rt-bottom h1 span, #rt-bottom .module-title .title span {color:#A3CD65;}
         #rt-showcase .readon span, #rt-showcase .readon .button, #rt-bottom .readon span, #rt-bottom .readon .button {background-color:#8cc13f;}
         #rt-showcase, #rt-bottom {background-color:#333;}
         #rt-showcase .box1 .module-surround, #rt-showcase .box4 .module-surround, #rt-bottom .box1 .module-surround, #rt-bottom .box4 .module-surround, #rt-bottom .bottom-accentoverlay-dark .box1 a, #rt-bottom .bottom-accentoverlay-dark .box4 .title span, #rt-bottom .bottom-accentoverlay-dark .box4 a, #rt-bottom .bottom-accentoverlay-dark .box1 .title span {background-color:#A3CD65;}
         #rt-showcase .title, #rt-bottom .title, #rt-showcase .paneltitle, #rt-showcase .panelsubtitle, #rt-bottom .paneltitle, #rt-bottom .panelsubtitle {text-shadow: -1px 1px 0 #333, -3px 3px 0 rgba(0,0,0,0.2);}
         #rt-showcase a, #rt-bottom a {color:#A3CD65;}
         #rt-showcase.showcasepanel-overlay-light a:hover, #rt-bottom.showcasepanel-overlay-light a:hover {color:#8cc13f;}
         #rt-showcase.showcasepanel-overlay-dark a:hover, #rt-bottom.showcasepanel-overlay-dark a:hover {color:#bada8c;}
         #rt-showcase .box1 a, #rt-showcase .box1 .title span, #rt-showcase .box4 a, #rt-showcase .box4 .title span, #rt-bottom .box1 a, #rt-bottom .box1 .title span, #rt-bottom .box4 a, #rt-bottom .box4 .title span {color:#c6e09f;}
         #rt-showcase .box4 .title, #rt-showcase .box1 .title, #rt-bottom .box4 .title, #rt-bottom .box1 .title {text-shadow: -1px 1px 0 #A3CD65, -3px 3px 0 rgba(0,0,0,0.15);}
         #rt-footer-surround h1 span, #rt-footer-surround .module-title .title span {color:#A3CD65;}
         #rt-footer-surround .readon span, #rt-footer-surround .readon .button {background-color:#8cc13f;}
         #rt-footer-surround {background-color:#8BB757;}
         #rt-footer-surround .box1 .module-surround, #rt-footer-surround .box4 .module-surround {background-color:#A3CD65;}
         #rt-footer-surround.footerpanel-overlay-light .module-title .title span {color:#98c752;}
         #rt-footer-surround.footerpanel-overlay-dark .module-title .title span {color:#d1e6b2;}
         #rt-footer-surround a {color:#ddecc5;}
         #rt-footer-surround.footerpanel-overlay-dark a:hover {color:#c6e09f;}
         #rt-footer-surround.footerpanel-overlay-light a:hover {color:#7ead38;}
         #rt-footer-surround .title, #rt-footer-surround .paneltitle, #rt-footer-surround .panelsubtitle {text-shadow: -1px 1px 0 #8BB757, -3px 3px 0 rgba(0,0,0,0.15);}
         #rt-footer-surround .box1 a, #rt-footer-surround .box1 .title span, #rt-footer-surround .box4 a, #rt-footer-surround .box4 .title span {color:#c6e09f;}
         #rt-footer-surround .box4 .title, #rt-footer-surround .box1 .title {text-shadow: -1px 1px 0 #A3CD65, -3px 3px 0 rgba(0,0,0,0.15);}
      </style>
   </head>
   <body class="presets-preset1 textshadow-1 font-family-diametric font-size-is-default logo-type-diametric logo-diametric-logostyle-style1 menu-type-fusionmenu inputstyling-enabled-1 typography-style-light col12 option-com-content menu-home apr12-home">
      <div id="rt-page-surround">
         <div id="rt-headerblock" class="headerpanel-overlay-light">
            <div id="rt-headerblock2" class="headerpanel-pattern-textile">
               <div id="rt-headerblock3" class="headerpanel-accentoverlay-dark">
                  <div id="rt-top-surround">
                     <div id="rt-drawer">
                        <div class="rt-container">
                           <div class="clear"></div>
                        </div>
                     </div>
                  </div>
                  <div id="rt-navigation" class="menu-overlay-dark">
                     <div id="rt-navigation2">
                        <div id="rt-navigation3">
                           <div class="rt-container">
                              <div class="rt-grid-12 rt-alpha rt-omega">
                                 <div class="rt-block menu-block">
                                    <div class="rt-fusionmenu">
                                       <div class="nopill">
                                          <div class="rt-menubar">
                                             <ul class="menutop level1 " style="margin-left: 0px;">
                                                <li class="item179 root menu-module">
                                                   <div class="fusion-module ">
                                                      <div class="custom">
                                                         <a href="http://www.leveldatainc.com/index.php" class="logo-module"></a>
                                                      </div>
                                                   </div>
                                                </li>
                                                <li class="item206 root">
                                                   <span class="rt-arrow-pointer"></span>
                                                   <a class="orphan item bullet" href="http://www.leveldatainc.com/about-us" id="a-1382024891915983">
                                                   <span>
                                                   <span>
                                                   About Us                                                            </span>
                                                   </span>
                                                   </a>
                                                </li>
                                                <li class="item101 root">
                                                   <span class="rt-arrow-pointer"></span>
                                                   <a class="orphan item bullet" href="http://www.leveldatainc.com/testimonials" id="a-1382024891918292">
                                                   <span>
                                                   <span>
                                                   Testimonials                                                            </span>
                                                   </span>
                                                   </a>
                                                </li>
                                                <li class="item219 root">
                                                   <span class="rt-arrow-pointer"></span>
                                                   <a class="orphan item bullet" href="http://www.leveldatainc.com/core-services" id="a-1382024891920345">
                                                   <span>
                                                   <span>
                                                   CORE Services                                                            </span>
                                                   </span>
                                                   </a>
                                                </li>
                                                <li class="item106 parent root f-main-parent f-mainparent-item">
                                                   <span class="rt-arrow-pointer"></span>
                                                   <a class="daddy item bullet" href="http://www.leveldatainc.com/contact-us" id="a-1382024891921851">
                                                   <span>
                                                   <span>
                                                   Contact Us                                                            <span class="daddyicon"></span>
                                                   </span>
                                                   </span>
                                                   </a>
                                                </li>
                                                <li class="item220 root">
                                                   <span class="rt-arrow-pointer"></span>
                                                   <a class="orphan item bullet" href="http://www.leveldatainc.com/request-demo" id="a-1382024891927268">
                                                   <span>
                                                   <span>
                                                   Request Demo                                                            </span>
                                                   </span>
                                                   </a>
                                                </li>
                                                <li class="item116 root">
                                                   <span class="rt-arrow-pointer"></span>
                                                   <a class="orphan item bullet" href="http://www.leveldatainc.com/helpdesk" target="_blank" id="a-138202489192750">
                                                   <span>
                                                   <span>
                                                   Support                                                            </span>
                                                   </span>
                                                   </a>
                                                </li>
                                                <li class="item116 root">
                                                   <span class="rt-arrow-pointer"></span>
                                                   <a class="orphan item bullet" href="http://nextleveldata.biz/login/index" id="a-138202489192751">
                                                   <span>
                                                   <span>
                                                   Portal Login                                                           </span>
                                                   </span>
                                                   </a>
                                                </li>
                                             </ul>
                                          </div>
                                          <div class="clear"></div>
                                       </div>
                                    </div>
                                    <div class="clear"></div>
                                 </div>
                              </div>
                              <div class="clear"></div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div id="rt-transition" class="rt-visible">
            <div id="rt-main-container" class="body-overlay-light">
               <div id="rt-body-surround" class="body-accentoverlay-dark">
                  <div class="rt-container">
                     <div id="rt-main" class="sa5-mb7">
                        <div class="rt-container">
                           <div class="rt-grid-7 rt-push-5">
                              <div id="rt-main-column">
                                 <div class="rt-block component-block">
                                    <div id="rt-mainbody">
                                       <div class="component-content rt-joomla">
                                          <div class="rt-article">
                                             <div class="item-page">
                                                <div class="article-header">
                                                   <div class="clear"></div>
                                                </div>
                                                
                                                <div id="content">
                                                  <g:layoutBody />
                                                </div> <!-- END #content -->
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="clear"></div>
                                 </div>
                              </div>
                           </div>
                           <div class="rt-grid-5 sidebar-left rt-pull-7">
                              <div class="rt-sidebar-surround">
                                 <div id="rt-sidebar-b">
                                    <div class="rt-block">
                                       <div class="module-surround">
                                          <div class="module-content">
                                             <div class="custom">
                                                <p><img alt="LevelData bug wphotos rgb" src="http://www.leveldatainc.com/images/article_images/LevelData_bug_wphotos_rgb.png" height="432" width="370" smartload="0"></p>
                                             </div>
                                             <div class="clear"></div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="clear"></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
      </div>
      <div id="rokbox-overlay" class="rokbox-overlay" style="opacity: 0; display: none; position: absolute; top: 0px; left: 0px; cursor: pointer; background-color: rgb(0, 0, 0); z-index: 65550;"></div>
      <div id="rokbox-wrapper" class="rokbox-clean" style="position: absolute; z-index: 65555; opacity: 0; display: none; top: 378px; left: 617px;">
         <div id="rokbox-top" class="rokbox-left">
            <div class="rokbox-right">
               <div class="rokbox-center"></div>
            </div>
         </div>
         <div id="rokbox-middle" class="rokbox-left">
            <div class="rokbox-right">
               <div class="rokbox-center"><a id="rokbox-close" href="http://www.leveldatainc.com/#"><span>[x] close</span></a></div>
            </div>
         </div>
         <div id="rokbox-bottom" class="rokbox-left">
            <div class="rokbox-right">
               <div class="rokbox-center"></div>
            </div>
         </div>
         <div class="clr"></div>
      </div>
      <div class="fusion-js-container level1 menutop">
         <div class="fusion-js-subs" style="display: none; visibility: visible; z-index: 1; width: 198px; padding-bottom: 20px; padding-top: 10px; padding-left: 9px; top: 88px; left: 679px;">
            <div class="fusion-submenu-wrapper level2  " style="width: 180px; margin-top: -31px; height: 31px; left: 0px; display: none; opacity: 0;">
               <ul class="level2" style="width:180px;">
                  <li class="item199 f-submenu-item">
                     <a class="orphan item bullet" href="http://www.leveldatainc.com/contact-us/employment" id="a-1382024891926841" tabindex="-1">
                     <span>
                     Employment                                                             </span>
                     </a>
                  </li>
               </ul>
               <div class="drop-bot"></div>
            </div>
         </div>
      </div>
    <div id="footer">
      <g:render template="/common/footer" />
    </div> <!-- END #footer -->
   </body>
</html>