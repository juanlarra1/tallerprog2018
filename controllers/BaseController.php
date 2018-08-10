<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of BaseController
 *
 * @author Larra
 */
class BaseController {
    function render ($view, $data){


/* Agarra la view y la data, renderea en smarty con las variables asignadas. 
 * setea la view adentro del layout*/
        
    $smarty = new Smarty();

    //Indicamos las carpetas a usar por SMARTY
    $smarty->template_dir = "views";
    $smarty->compile_dir = "templates_c";
    foreach ($data as $key => $value){
        $smarty->assign($key, $value);
        
    }
    $smarty->assign("viewFile", $view . ".tpl");
    $smarty->display("layout.tpl");
    
        
        
    }
    
    function jsonEncode ($data){ //Encondea el Json  
        header("Content-Type: application/json");
        echo (json_encode($data));    
        exit();
    }
}
