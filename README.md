# SynerLyst
Hay que tomar en cuenta que la librería no está terminada y hay consideraciones dentro de la misma.
Simplificación de lectura, escrituda y transformaciones de datos.
La intención de esta librería es simplificar tanto lectura como escritura de datos, aún se está creando pero se tiene la intención de que tenga
las siguientes características:
1. Simpificación de rutas y función raíz: se tiene una función "raíz" en donde se puede especificar, principalmente, una ruta base, de donde
ramifiquen más rutas, las cuales se pueden consultar con otra función, esto con la intención de poder usarlas internamente con el fin de
poder utilizar otra función que permita leer por medio de un patrón un archivo, esto simplifica mucho el tener que escribir una ruta completa, por motivos
de comodidad o simplificación de código. También se puede especificar dentro de la misma función un correo de google, esto para poder
leer, descargar y subir archivos en un drive personal o laboral si se requiere, adicional se tiene a intención de añadir más fuentes,
como MySQL para simplificar la consulta.
3. Lectura de datos dinámica: se crea una sola función, en donde se especifíca qué archivo se va a leer teniendo en cuenta la función raíz que es la que
especifica toda las rutas que se van a utilizar y de esta manera basta con escribir, por ejemplo, con qué palabra termina una ruta para especificar
la ruta en donde se encuentra un archivo, que es la más común que utilizo, lo atractivo de esta función es su característica dinámica, que
permite leer cualquier archivo dentro de los que yo utilizo (.txt, .csv, gsheet, MySQL), esto tomando en cuenta todos los parámetros de funciones
ya existentes, por lo que no limita a solo lectura, si no también parámetros adicionales.
4. Unificación de archivos dinámica: esto se puede lograr de una manera sencilla, pero dentro de esta librería contaría con más consideraciones,
como por ejemplo, se utiliza la misma función de lectura anteriomente mencionada, por lo que si se requiere unificar varios archivos dependiendo de
la necesidad se pueden unificar en una sola función sin importar su extensión ni sus columnas, aunque hay que considerar que si no
empatan las mismas, simplemente se agregarán todas.

Hasta el momento es lo que se tiene pensado programar, hay más funciones pero aún no se ha llegado por completo hasta lo ya mencionado, se sugiere
revisar la librería "MultiLEDS" que también pude programar que es una versión más antigua de esta misma librería, aunque considero que su programación
no es la más adecuada ya que hay varias consideraciones que pude notar como su simplificación, por esto se está creando esta nueva mejorada.












