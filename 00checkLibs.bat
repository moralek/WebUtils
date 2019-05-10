@ECHO OFF
REM ==================================================
REM  SCRIPT Trabajo con archivos y librerias 
REM  Limpia Basura del War CGU - SIGAS 
REM  @Autor: Andres Jana A 20170614
REM ==================================================
ECHO %time:~0,8%-Iniciando.
SET folder=%CD:~-12%
IF "%folder%"=="\WEB-INF\lib" goto procesa
ECHO.
ECHO Ejecute este Script en la Carpeta \lib !!.
pause>nul
goto fin

:procesa
CD "%~d0%~p0"

ECHO %time:~0,8%-Limpia Carpetas ^(PublicTempStorage - PrivateTempStorage - fonts^).
IF NOT EXIST ..\..\PublicTempStorage MD ..\..\PublicTempStorage
IF NOT EXIST ..\..\PrivateTempStorage MD ..\..\PrivateTempStorage
DEL ..\..\PublicTempStorage\* /Q
DEL ..\..\PrivateTempStorage\* /Q
IF EXIST ..\fonts\ ( RD ..\fonts\ /S /Q
	ECHO [ok]Se Elimina ..\fonts)

ECHO %time:~0,8%-Elimina Librerias Conectores.	
IF EXIST jtds-1.2.jar (del /F jtds-1.2.jar 
	     ECHO [ok]Se Elimina jtds-1.2.jar)
IF EXIST mysql-connector-java-5.1.11-bin.jar (del /F mysql-connector-java-5.1.11-bin.jar 
	     ECHO [ok]Se Elimina mysql-connector-java-5.1.11-bin.jar)
IF EXIST ojdbc6.jar (del /F ojdbc6.jar 
	     ECHO [ok]Se Elimina ojdbc6.jar)
IF EXIST postgresql-9.1-902.jdbc3.jar (del /F postgresql-9.1-902.jdbc3.jar 
	     ECHO [ok]Se Elimina postgresql-9.1-902.jdbc3.jar)
IF EXIST sqlitejdbc-v056.jar (del /F sqlitejdbc-v056.jar 
	     ECHO [ok]Se Elimina sqlitejdbc-v056.jar)	
IF EXIST sqljdbc4.jar (del /F sqljdbc4.jar 
	     ECHO [ok]Se Elimina sqljdbc4.jar)
	
ECHO %time:~0,8%-Elimina Archivos Uploadify Antiguos.
IF EXIST upload.jar (del /F upload.jar 
	     ECHO [ok]Se Elimina upload.jar)
IF EXIST commons-fileupload-1.2.1.jar (del /F commons-fileupload-1.2.1.jar 
	     ECHO [ok]Se Elimina commons-fileupload-1.2.1.jar)
IF EXIST JsonJava.jar (del /F JsonJava.jar 
	     ECHO [ok]Se Elimina JsonJava.jar)

ECHO %time:~0,8%-Chequeo Archivos jar Genexus.
IF NOT EXIST servlet-api.jar              ( ECHO [warn]^(GX^)No se Encuentra servlet-api-2.5.jar )
IF NOT EXIST gxclassR.jar                 ( ECHO [warn]^(GX^)No se Encuentra gxclassR.jar )
IF NOT EXIST jersey-server-1.4.jar        ( ECHO [warn]^(GX^)No se Encuentra jersey-server-1.4.jar )
IF NOT EXIST jersey-core-1.4.jar          ( ECHO [warn]^(GX^)No se Encuentra jersey-core-1.4.jar )
IF NOT EXIST asm-3.1.jar                  ( ECHO [warn]^(GX^)No se Encuentra asm-3.1.jar )
IF NOT EXIST jersey-json-1.4.jar          ( ECHO [warn]^(GX^)No se Encuentra jersey-json-1.4.jar )
IF NOT EXIST jackson-core-asl-1.5.5.jar   ( ECHO [warn]^(GX^)No se Encuentra jackson-core-asl-1.5.5.jar )
IF NOT EXIST jackson-mapper-asl-1.5.5.jar ( ECHO [warn]^(GX^)No se Encuentra jackson-mapper-asl-1.5.5.jar )
IF NOT EXIST jackson-jaxrs-1.5.5.jar      ( ECHO [warn]^(GX^)No se Encuentra jackson-jaxrs-1.5.5.jar )

ECHO %time:~0,8%-Chequea Archivos UPLOADIFY(REST) para was (AFX, ADX, CA, PAS, TF).
IF NOT EXIST activation-1.1.jar           ( ECHO [warn]^(Uploadify_REST^) No se Encuentra activation-1.1.jar)
IF NOT EXIST jackson-xc-1.5.5.jar         ( ECHO [warn]^(Uploadify_REST^) No se Encuentra jackson-xc-1.5.5.jar)
IF NOT EXIST javax.json-1.0.4.jar         ( ECHO [warn]^(Uploadify_REST^) No se Encuentra javax.json-1.0.4.jar)
IF NOT EXIST jaxb-api-2.1.jar             ( ECHO [warn]^(Uploadify_REST^) No se Encuentra jaxb-api-2.1.jar)
IF NOT EXIST jaxb-impl-2.1.12.jar         ( ECHO [warn]^(Uploadify_REST^) No se Encuentra jaxb-impl-2.1.12.jar)
IF NOT EXIST jersey-multipart-1.4.jar     ( ECHO [warn]^(Uploadify_REST^) No se Encuentra jersey-multipart-1.4.jar)
IF NOT EXIST jersey-servlet-1.17.1.jar    ( ECHO [warn]^(Uploadify_REST^) No se Encuentra jersey-servlet-1.17.1.jar)
IF NOT EXIST jettison-1.1.jar             ( ECHO [warn]^(Uploadify_REST^) No se Encuentra jettison-1.1.jar)
IF NOT EXIST mimepull-1.4.jar             ( ECHO [warn]^(Uploadify_REST^) No se Encuentra mimepull-1.4.jar)
IF NOT EXIST stax-api-1.0.1.jar           ( ECHO [warn]^(Uploadify_REST^) No se Encuentra stax-api-1.0.1.jar)
IF NOT EXIST stax-api-1.0-2.jar           ( ECHO [warn]^(Uploadify_REST^) No se Encuentra stax-api-1.0-2.jar)

REM CLASE UPLOADIFY
IF NOT EXIST ..\classes\cgu\services\FileUploadService.class ECHO [warn]^(Uploadify_REST^) No se encuentra FileUploadService.class en ..\classes\cgu\services

REM TEST NOMBRE WAR
SET folder=%CD:~-17%
IF NOT "%folder%"=="-pjud\WEB-INF\lib" ECHO [warn]Nombre de la Carpeta no tiene [-pjud]

REM FIN
ECHO %time:~0,8%-FIN DEL PROCESO.
ECHO ===================
ECHO Presione una tecla para Eliminar este Script.
pause>nul

REM AUTODESTROY: 
del /F %0
CD "%~d0%~p0"

:fin
cls