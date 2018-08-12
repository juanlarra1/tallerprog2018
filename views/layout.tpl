<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <script src="librerias/js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="index.js" type="text/javascript"></script>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>

      <!-- Boostrap -->
        <script src="librerias/js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="librerias/Bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="librerias/Bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="librerias/Bootstrap/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="Librerias/Bootstrap/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css"/>
        <script src="Librerias/Bootstrap/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <title></title>
    </head>
    <body>
          {include file="cabezal.tpl"}
          <div>
          {include file="$viewFile"}
          </div>
    </body>
</html>
