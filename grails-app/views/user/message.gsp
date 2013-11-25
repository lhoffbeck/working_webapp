<html>
<head>
  <title>${params.title}</title>
  <meta name="layout" content="login" />
  <style>
    .message{
      margin-top: 150px;
      margin-left:30px;
      font-size: 18px;
    }
  </style>
</head>
<body>
    <div class="message"> 
      <span class="title featuredarticle">${params.titleMessage.decodeHTML()}</span>
      <br/>
      <br/>
      ${params.message.decodeHTML()}
    </div>
</body>
</html>