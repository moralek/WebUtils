## WebUtils (for GX wars)
*Busca y elimina archivos en base a scripts.*

<u>Archivos .fde:</u> 

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



<u>fde.Ini:</u>

El archivo fde.ini se encuentra junto con el ejecutable posee la configuración de opciones de delfind.exe. En caso de no existir , se creará uno por defecto.

Un ejemplo de este archivo puede ser:

```ini
[CONFIG]
SoloDir=0

[MEMO_CONSOLE]
MostrarOK=1
MostrarERR=1
MostrarMSJ=1
ConfirmDEL=0
ClrMemo=0

[OPCIONES]
MinimizeToTray=0
TrayScriptFDE=0
TrayGenWar=0
TrayRunAPP=1
Beep=1
OrderByUso=1
RecOpcSalir=0
```

------

links de referencia:

- https://typora.io

- https://www.lazarus-ide.org

    