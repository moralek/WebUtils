## WebUtils (for GX wars)
*Busca y elimina archivos en base a scripts.*

Archivos .fde: 

Los archivos .fde son simples archivos de texto plano con extensión .fde. Estos archivos pueden contener los siguientes comandos:

| Comando    | Descripción                                                  | Ejemplo                           |
| ---------- | ------------------------------------------------------------ | --------------------------------- |
| **MSGRUN** | (Message In Run) Muestra un mensaje durante la ejecución.    | MSGRUN=>>Hola Mundo!!             |
| **DELFIL** | (Delete File) Elimina archivos (permite comodines (* ?).     | DELFIL=*.war                      |
| **CHKFIL** | (Check File) Informa si el archivo Existe o no. (permite comodines (* ?) | CHKFIL=WEB-INF\PDFReport.ini      |
| **DELDIR** | (Delete Dir) Borra Una Carpeta(y todo su contenido).         | DELDIR=NOVALIDO                   |
| **CHKDIR** | (Check Dir) Informa si la Carpeta Existe o no.               | CHKDIR=WEB-INF                    |
| **CREDIR** | (Create Dir) Crea Una Carpeta.                               | CREDIR=WEB-INF\PrivateTempStorage |
| **CLRDIR** | (Clean Dir) Elimina el contenido de una carpeta(sin eliminar la carpeta). | CLRDIR=WEB-INF\PrivateTempStorage |

------


