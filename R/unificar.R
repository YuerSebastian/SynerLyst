#' @encoding UTF-8
#' @title Unificacion de archivo
#' @description Unifica archivos en un dolo dataframe, incluso si tienen diferente extension.
#' @param dir direccion
#' @param id identificador
#' @return Marco de datos.
#' @examples
#' # example code
#' @details Esta funcion se encarga de leer varios tipos de datos, la lectura es simplificada, por lo tanto su uso depende por completo de
#' la funcion \code{\link{radix}}, por el mimso motivo es esencial que se especifique el directorio raiz en la misama antes de usar esta funcion.
#' @seealso \code{\link{radix}}, \code{\link{leer}}.
#' @import crayon
#' @importFrom stats setNames
#' @importFrom fs dir_ls
#' @name unificar
#' @export
unificar <- function(dir=c("",""),id=NULL){
  if(length(dir)==1) pat <- .rdx$ds[grep(dir,.rdx$ds)] else pat <- .rdx$ds[grep(dir[1],.rdx$ds)]
  #Especificando direcciones y funciones a usar.
  dirs <- dir_ls(pat,type = "file",regexp = if(length(dir)==1) NULL else dir[2])
  df <- bind_rows(lapply(dirs, leer) %>% setNames(basename(dirs)),.id = id)
  message(cyan("\n=====================================================\n"),
          bold$blue(length(dirs)),green(" archivos unificados."),
          cyan("\n====================================================="))
  return(df)
}













