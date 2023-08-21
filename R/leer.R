#' @title Lectura de archivos dinamica
#' @description Lee de una manera dinamica, dependiendo de la extension, un archivo sin importar su formato.
#' @param arch Es una cadena o un vector con 2 datos.
#' En el caso de una cadena, se especifica una ruta completa para hacer la lectura, tal cual como lo haria una funcion de lectura como vroom.
#' En el caso de un vector de 2 datos, se requiere el nombre del archivo en la primera posicion y en la segunda un patron con la carpeta a utilizar.
#' @param cod Se utiliza para especificar la codificacion del archivo, por defecto es "LATIN1".
#' @param ... Son los parametros propios de las funciones \code{\link{read_excel}} y \code{\link{vroom}}.
#' @return Marco de datos.
#' @examples
#' # example code
#'
#' @details Esta funcion se encarga de leer varios tipos de datos, la lectura es simplificada, por lo tanto su uso depende por completo de
#' la funcion \code{\link{radix}}, por el mimso motivo es esencial que se especifique el directorio raiz en la misama antes de usar esta funcion.
#' @seealso \code{\link{radix}}
#' @import crayon readxl vroom dplyr tidyr
#' @importFrom tools file_ext
#' @importFrom fs dir_ls
#' @name leer
#' @export
#' @encoding LATIN1
leer <- function(arch=c(NULL,NULL),cod="LATIN1",mens = T,...){
  #Condiciones en caso de directorio o archivo no existente, o si hay mas de uno (solo direcorio)
  if (length(arch)==1) { #Si el archivo se especifica con una ruta completa
    pat <- arch
    if(!file.exists(pat)){
      stop(magenta("\n================================================================\n"),
           "El ",bold("archivo "),bold$blue(pat)," no existe.",
           magenta("\n================================================================"))
    }
  }else{ #Si el archivo se especifica con una ruta simplificada por patron
    pat <- .rdx$ds[grep(arch[2],.rdx$ds)]
    if(length(pat)==0){
      stop(magenta("\n================================================================\n"),
           "El ",bold("directorio")," que especificaste con el patron ",bold$blue(arch[2])," no existe.",
           magenta("\n================================================================"))
    }else if(length(pat)>1){
      warning(magenta("\n=====================================================\n"),
              yellow("Hay "),bold$blue(length(pat)),yellow(" directorios con el patron "),bold$blue(arch[2]),yellow(".\nSe uso el primer elemento: "),
              bold$blue(pat[1]),
              magenta("\n====================================================="))
      pat <- pat[1]
    }
    dir <- pat #Solo se usa esta variable para imprimir en el error que directorio se utilizo.
    print(pat)
    archs <- iconv(dir_ls(pat,type = "file"),to = "LATIN1") #Error con codificacion extraño
    pat <- archs[grep(arch[1],archs)]
    print(archs)
    print(pat)
    if(length(pat)==0) stop(magenta("\n================================================================\n"),
                            "El ",bold("archivo "),bold$blue(arch[1])," no existe.\nDirectorio utilizado: ",bold$blue(dir),
                            magenta("\n================================================================"))
  }
  #Condiciones para indicar que funcion utilizar para la lectura de archivos
  if(mens) message(cyan("\n=====================================================\n"),
                   green("Leyendo archivo "),blue(pat),
                   cyan("\n====================================================="))
  ext <- file_ext(pat)
  fun <- case_when(
    ext %in% c("xlsx", "xls", "xlsm") ~ 'read_excel(pat,col_types = "text",...)',
    ext == "csv" ~ "vroom(pat,',',locale = locale(encoding = cod),col_types = cols(.default = 'c'),...)",
    ext == "txt" ~ "vroom(pat,'\t',locale = locale(encoding = cod),col_types = cols(.default = 'c'),...)",
    TRUE ~ "otro"
  )
  if(fun=="otro") stop(bgWhite("El archivo no se puede leer, debe ser un archivo xlsx,xlsm,xls,txt o csv."))
  df <- eval(parse(text = fun))
  return(df)
}
