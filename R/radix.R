#' @encoding UTF-8
#' @title Raiz de la libreria.
#' @description Genera una lista de datos (directorios, correo y conexion MySQL) para su uso interno global.
#' @param cons Es una lista con los datos "dir", "cor" y "sql".
#' @return Nada.
#' @examples
#' # example code
#'
#' @details Es de uso meramente interno, no retorna un valor en especifico pero puede accederse al mismo a travez de otra funcion.
#' @seealso \code{\link{leer}}
#' @import crayon readxl
#' @name radix
#' @export
radix <- function(cons = list(dir="",cor="",sql=c(host="",puerto="",usuario="",contra="",db=""))){
  if(is.null(cons$dir)) warning(silver("\n========================================================\n"),
                                yellow("No se ha especificado ningun directorio raiz\nNo puedes usar la mayoria de funciones si no se corrige."),
                                silver("\n========================================================\n"))
  else if (!dir.exists(cons$dir)) stop(magenta("\n========================================================\n"),
                                       "El directorio raiz ",bold$blue(cons$dir)," no existe...\nEscribe una ruta valida.",
                                       magenta("\n========================================================\n"))
  .rdx <<- list()
  .rdx$ds <<- if(!is.null(cons$dir)) list.dirs(cons$dir,full.names = T) else "No especificado"
  .rdx$c <<- cons$cor
  message(cyan("\n========================================================\n"),
          green("Directorio raiz: "),bold$blue(cons$dir),
          green("\nTotal de directorios:",bold$blue(length(.rdx$ds))),
          cyan("\n========================================================"))
}
























