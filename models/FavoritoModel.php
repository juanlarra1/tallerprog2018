<?php

require_once("librerias/class.Conexion.BD.php");
require_once("config/configuracion.php");

class FavoritoModel
{

    var $usuario_id;
    var $publicacion_id;

    function conectarDB()
    {
        $conn = new ConexionBD(MOTOR, SERVIDOR, BASE, USUARIO, CLAVE);
        $conn->conectar();
        return $conn;
    }

    function crearFavorito()
    {
        $cn = $this->conectarDB();
        if ($cn) {
            $cn->consulta(
                "insert into favoritos"
                . "(usuario_id, publicacion_id)"
                . " values(:usu, :pub)", array(
                array("usu", $this->usuario_id, 'int'),
                array("pub", $this->publicacion_id, 'int'),
            ));
        }
    }

    function listarFavoritos()
    {
        $cn = $this->conectarDB();
        if ($cn) {
            $cn->consulta(

                ("SELECT p.titulo as titulo, SUBSTRING(p.texto, 1, 150) as texto, "
                    . "p.imagen as imagen, p.publicacion_id as publicacion_id, c.nombre as nombre, c.categoria_id "
                    . " FROM publicaciones p, categorias c, favoritos f "
                    . "WHERE (p.tipo_id = 1 AND p.categoria_id = c.categoria_id AND f.usuario_id=:usu AND f.publicacion_id = p.publicacion_id)"
                    . "ORDER BY p.Fecha DESC "), array(
                array("usu", $this->usuario_id, 'int')
            ));
            $res = $cn->restantesRegistros();
        }
        return $res;
    }


    function borrarFavorito()
    {
        $cn = $this->conectarDB();
        if ($cn) {
            $cn->consulta(
                "delete * from favoritos where usuario_id=:usu and publicacion_id=:pub", array(
                array("usu", $this->usuario_id, 'int'),
                array("pub", $this->publicacion_id, 'int')
            ));

        }
    }

}
