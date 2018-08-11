<?php

session_start();

$op = $_GET["op"];

if (empty($op)) {
    $op = "site/index";
}

list ($controller, $action) = explode("/", $op, 2);

// @TODO controlar inputs de $op
$controllerClass = ucfirst($controller) . "Controller"; 

try {
    include "controllers/$controllerClass.php";
} catch (Exception $e) {

    header("location: error.php");
    exit();
    // @TODO ver controlodar de error o no.
}

$actionMethod = ucfirst($action) . "Action";

if (!method_exists($controllerClass, $actionMethod)) {
    header("location: error.php");
    exit();
}
$obj = new $controllerClass();
$obj->$actionMethod();
