Descarga: <https://github.com/moralek/WebUtils/releases>





## WebUtils (for GX wars)

*Utilidades para generación de archivos WAR de GeneXus*

## <u>Archivos .fde:</u>

Los archivos `.fde` son archivos XML estructurados. Deben crearse con el editor incluido en el programa.

| Comando    | Descripción                                                  | Ejemplo                           |
| ---------- | ------------------------------------------------------------ | --------------------------------- |
| **MSGRUN** | (Message In Run) Muestra un mensaje durante la ejecución.    | MSGRUN=>>Hola Mundo!!             |
| **DELFIL** | (Delete File) Elimina archivos. Permite comodines (`*`, `?`). | DELFIL=*.war                      |
| **CHKFIL** | (Check File) Verifica si existen archivos. Permite comodines (`*`, `?`). | CHKFIL=WEB-INF\PDFReport.ini      |
| **DELDIR** | (Delete Dir) Elimina una carpeta y su contenido.             | DELDIR=NOVALIDO                   |
| **CHKDIR** | (Check Dir) Verifica si existe una carpeta.                  | CHKDIR=WEB-INF                    |
| **CREDIR** | (Create Dir) Crea una carpeta.                               | CREDIR=WEB-INF\PrivateTempStorage |
| **CLRDIR** | (Clean Dir) Limpia el contenido de una carpeta sin eliminarla. | CLRDIR=WEB-INF\PrivateTempStorage |

### Objetivo final de los comandos

Cada comando se considera correcto cuando, al terminar su ejecución, se cumple el estado esperado. En modo `warzip`, esto permite revisar el contenido del `.war`/`.zip` antes de extraer y reempaquetar solo si hay cambios efectivos.

| Comando    | Objetivo final                                               | Cuándo es error                                             |
| ---------- | ------------------------------------------------------------ | ----------------------------------------------------------- |
| **MSGRUN** | Mostrar un mensaje informativo durante la ejecución.         | No aplica.                                                  |
| **DELFIL** | Que el archivo o los archivos indicados no existan. Permite comodines (`*`, `?`). | Si después de ejecutar el comando aún existen archivos que debían eliminarse. No es error si no existían antes. |
| **CHKFIL** | Que exista al menos un archivo que coincida con la ruta o patrón indicado. Permite comodines (`*`, `?`). | Si no existe ningún archivo que coincida.                   |
| **DELDIR** | Que el directorio indicado no exista después de ejecutar el comando. | Si el directorio sigue existiendo después de intentar eliminarlo. No es error si no existía antes. |
| **CHKDIR** | Que exista el directorio indicado.                           | Si el directorio no existe.                                 |
| **CREDIR** | Que exista el directorio indicado.                           | Si no se puede crear y el directorio no existe al terminar. No es error si ya existía antes. |
| **CLRDIR** | Que el directorio indicado exista y quede vacío, sin archivos ni subdirectorios. | Si el directorio no existe, o si no se puede limpiar completamente. |

En modo `warzip`, el reempaquetado se decide por el resultado final neto de los comandos. Por ejemplo, si se crea un directorio y luego se elimina el mismo directorio dentro de la misma ejecución, esos cambios pueden anularse y no requerir reempaquetado.



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

El archivo `fde.ini` se encuentra junto al ejecutable y contiene la configuración de opciones de `DelFind.exe`. Si no existe, se crea uno por defecto.

Ejemplo `fde.ini`:

```ini
[CONFIG]
SoloDir=0
TempDir=.\tmp\
ScanMode=carpeta
EnableWarZipMode=0
ConservarTmpAlFinalizar=0

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
JAVA_HOME=
```

`TempDir` define la carpeta temporal del programa. Por defecto es `.\tmp\` relativa a `DelFind.exe`. Si la clave no existe, la aplicación la crea automáticamente con ese valor.

En modo `warzip`, el contenido de `TempDir` se limpia al iniciar cada ejecución para evitar reutilizar archivos temporales obsoletos. Por defecto también se elimina al finalizar; si `ConservarTmpAlFinalizar=1`, la carpeta temporal se conserva para revisión.

Para el modo `warzip`, la carpeta de trabajo se organiza dentro de `TempDir\warzip\` usando la convención:

```text
<nombre>_<tipo>_<id>
```

Ejemplo:

```text
.\tmp\warzip\cgu90ca-tst_war_a13f2c\
```

El modo `warzip` revisa el índice del archivo `.war`/`.zip` antes de extraer. Si el script FDE no requiere cambios efectivos, no reempaqueta. Cuando necesita trabajar sobre el archivo, usa `jar.exe` desde `JAVA_HOME\bin` para extraer o actualizar el contenido.

------

## links:

- https://typora.io

- https://www.lazarus-ide.org
