$(document).ready(inicializoCategoria);

function inicializoCategoria() {
    
     $("#txtNombreCategoria").blur(validarNombre);
}

function validarNombreLogico(nombre) {
    var retorno = false;

    var patron = /[A-Za-zñÑ-áéíóúÁÉÍÓÚ\s\t-]/;
    if (nombre.length >= 2 && (patron.test(nombre))) {
        retorno = true;
    }
    return retorno;
}

function validarNombre() {
    var dato = $(this).val();
    if (!validarNombreLogico(dato)) {
        $("#errorNombreC").html("El nombre ingresado no es valido.");
        $("#errorNombreC").addClass("alert alert-danger");

    } else {
        $("#errorNombreC").removeClass("alert alert-danger");
        $("#errorNombreC").html(" ");
    }

}