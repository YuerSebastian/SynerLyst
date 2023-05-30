#' @encoding UTF-8
#' @title Escritura
#' @description Escribe el archivo, sea en una ruta completa o por un patron.
#' @param dir direccion
#' @return Nada
#' @examples
#' # example code
#' @details La funcion escribe de manera rapida los archivos.
#' @seealso \code{\link{radix}}, \code{\link{leer}}, \code{\link{fwrite}}.
#' @importFrom data.table fwrite
#' @name escribir
#' @export
escribir <- function(dir = c("",""),...){
  if(length(dir)==1){
    fwrite(dir,bom = T,...)
  }else{
    message("Nada")
  }
}
