Descarga: <https://github.com/moralek/WebUtils/releases>





## WebUtils (for GX wars)

*Utilidades para generación de war Gx*

## <u>Archivos .fde:</u>

Los archivos .fde son archivos xml con estructura y deben crearse con el editor incluido dentro del mismo programa

| Comando    | Descripción                                                  | Ejemplo                           |
| ---------- | ------------------------------------------------------------ | --------------------------------- |
| **MSGRUN** | (Message In Run) Muestra un mensaje durante la ejecución.    | MSGRUN=>>Hola Mundo!!             |
| **DELFIL** | (Delete File) Elimina archivos (permite comodines (* ?).     | DELFIL=*.war                      |
| **CHKFIL** | (Check File) Informa si el archivo Existe o no. (permite comodines (* ?) | CHKFIL=WEB-INF\PDFReport.ini      |
| **DELDIR** | (Delete Dir) Borra Una Carpeta(y todo su contenido).         | DELDIR=NOVALIDO                   |
| **CHKDIR** | (Check Dir) Informa si la Carpeta Existe o no.               | CHKDIR=WEB-INF                    |
| **CREDIR** | (Create Dir) Crea Una Carpeta.                               | CREDIR=WEB-INF\PrivateTempStorage |
| **CLRDIR** | (Clean Dir) Elimina el contenido de una carpeta(sin eliminar la carpeta). | CLRDIR=WEB-INF\PrivateTempStorage |



## <u>Reglas para validación del archivo web.xml:</u>

Las reglas se aplican al archivo [./WEB-INF/web.xml] de cada subdirectorio seleccionado.

Los campos del "StringGrid" son :

| *Campo*              | *Descripción*                                                | *Ejemplo*                |
| -------------------- | ------------------------------------------------------------ | ------------------------ |
| **Etiqueta**         | Establece la etiqueta a validar dentro del archivo web.xml.  | servlet-name             |
| **Valor**            | Establece el valor que debe tener la etiqueta anterior (solo aplica para considerar ***Etiqueta y Valor)***. | QRCode                   |
| **Considerar**       | Indica si se considerará la Etiqueta y el valor o solo la etiqueta al realizar la revisión | Etiqueta y Valor         |
| **Se encuentra ...** | Indica que validación se realizará:***[X] Veces :*** si "considerar" se enuentra exactamente X veces se mostrará el mensaje. **MENOS O MAS DE [X]VECES:** cuando no se encuentra la cantidad exacta de veces dado por X se mostrará el mensaje**MAS de [X] Veces**: si se encuentra mas de x veces se mostrará el mensaje**MENOS DE [X] Veces**: si se encuentra menos de x veces se mostrará el mensaje. | MENOS o MAS de [X] Veces |
| **[X]**              | indica el valor de X para la condición anterior              | 1                        |
| **Mensaje**          | El mensaje que se mostrará al cumplir la condición           | No se encuentra QRCODE   |
| **Color Mensaje**    | Indica CÓMO se mostrará el mensaje (Gris, Rojo o Azul) en caso de elegir Error (Rojo) se considerará como Error y aumentará el contador final de errores. | Error (Rojo)             |



## <u>Comodines:</u>

Se requirió en algunos casos utilizar comodines con el fin de poder resolver valores que son dinámicos:

| *Etiqueta* | *Descripción*                                                | *Válido en*         |
| ---------- | ------------------------------------------------------------ | ------------------- |
| **{MOD}**  | Muestra el nombre del modulo extraído del nombre de carpeta por ejemplo si el nombre de carpeta es **Adquisiciones-tst**: el nombre del modulo será: **Adquisiciones** | **Valor** webapps   |
| **{M}**    | Muestra Mensaje por defecto                                  | **Mensaje** web.xml |
| **{Q}**    | Cantidad de Veces                                            | **Mensaje** web.xml |



## <u>fde.Ini:</u>

El archivo fde.ini se encuentra junto con el ejecutable posee la configuración de opciones de delfind.exe. En caso de no existir , se creará uno por defecto.

ejemplo fde.ini:

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

## links:

- https://typora.io

- https://www.lazarus-ide.org
