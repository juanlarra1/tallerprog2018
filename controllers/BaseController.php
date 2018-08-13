<?php

class BaseController
{
    function render($view, $data)
    {


        /* Agarra la view y la data, renderea en smarty con las variables asignadas.
         * setea la view adentro del layout*/

        $smarty = new Smarty();

        //Indicamos las carpetas a usar por SMARTY
        $smarty->template_dir = "views";
        $smarty->compile_dir = "templates_c";

        //Toda la data que se muestre la mando
        foreach ($data as $key => $value) {
            $smarty->assign($key, $value);

        }
        //mando la view a mostrar al layout, y hago que displayee el layout
        $smarty->assign("viewFile", $view . ".tpl");
        $smarty->display("layout.tpl");


    }


    function renderPartial($view, $data)
    {
        $smarty = new Smarty();

        //Indicamos las carpetas a usar por SMARTY
        $smarty->template_dir = "views";
        $smarty->compile_dir = "templates_c";

        //Toda la data que se muestre la mando
        foreach ($data as $key => $value) {
            $smarty->assign($key, $value);

        }
        $smarty->display( $view . ".tpl");


    }

    function jsonEncode($data)
    { //Encondea el Json
        header("Content-Type: application/json");
        echo(json_encode($data));
        exit();
    }
}

