//Variables globales y lectura de archivos INI
unit UGlobales;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  IniFiles,VarRegEnv, fileinfo;
type
  TGlobales=class

private
    Procedure setInteger(variable:String;Valor:Integer);
    Function getInteger(variable:String;Valordefault:Integer):Integer;
    Procedure setVarstr(variable,Valor:String);
    Function  getVarStr(variable,Valordefault:String):String;
    Procedure setBoolean(variable:String;Valor:Boolean);
    Function  getBoolean(variable:String;Valordefault:Boolean):Boolean;

    //=================================================
    Procedure setFdeFilePath(Valor:String);
    Function getFdeFilepath():String;

    Procedure setWebappsDir(Valor:String);
    Function getWebappsDir():String;

    Procedure setJavaHome(Valor:String);
    Function getJavaHome():String;

    Procedure setOcultarDirROOT(Valor:Boolean);
    Function getOcultarDirROOT():Boolean;

    Procedure setMostrarOK(Valor:Boolean);
    Function getMostrarOK():Boolean;

    Procedure setDelWars(Valor:Boolean);
    Function getDelWars():Boolean;

    Procedure setConfirmDel(Valor:Boolean);
    Function getConfirmDel():Boolean;

    Procedure setClrMemo(Valor:Boolean);
    Function getClrMemo():Boolean;

    Procedure setMostrarERR(Valor:Boolean);
    Function getMostrarERR():Boolean;

    Procedure setListBoxModuloValues(Valor:String);
    Function getListBoxModuloValues():String;

    Procedure setListBoxVersionValues(Valor:String);
    Function getListBoxVersionValues():String;

    Procedure setMostrarMSJ(Valor:Boolean);
    Function getMostrarMSJ():Boolean;

    Procedure setSoloDir(Valor:Boolean);
    Function getSoloDir():Boolean;

    Procedure setTrayMinimize(Valor:Boolean);
    Function getTrayMinimize():Boolean;

    Procedure setTrayScriptFDE(Valor:Boolean);
    Function getTrayScriptFDE():Boolean;

    Procedure setTrayGenWar(Valor:Boolean);
    Function getTrayGenWar():Boolean;

    Procedure setTrayRunAPP(Valor:Boolean);
    Function getTrayRunAPP():Boolean;

    Procedure setBeep(Valor:Boolean);
    Function getBeep():Boolean;

    Procedure setOpcSalir(Valor:Boolean);
    Function getOpcSalir():Boolean;

    Procedure setOrderByUso(Valor:Boolean);
    Function getOrderByUso():Boolean;

    Procedure setCompWebXml(Valor:Boolean);
    Function getCompWebXml():Boolean;

    Procedure setPageIndex(Valor:Integer);
    Function getPageIndex():Integer;

    Procedure setPDFReportselection(Valor:Integer);
    Function getPDFReportselection():Integer;

    Procedure setDSDescription(Valor:String);
    Function getDSDescription():String;

    Procedure setDSResType(Valor:String);
    Function getDSResType():String;

    Procedure setDSResAuth(Valor:String);
    Function getDSResAuth():String;

    Procedure setDSUseJdbcDatasource(Valor:Integer);
    Function getDSUseJdbcDatasource():Integer;

    Procedure setDSJdbcDataSource(Valor:String);
    Function getDSJdbcDataSource():String;

    Procedure setDSResRefName(Valor:String);
    Function getDSResRefName():String;

    Function getFdeIni():String;
    Function getFdeDir():String;
    Function getAppPath():String;
    Function getProductVersion():String;
    Function getIniUpdate():String;

public
    COLOROK:TColor;
    FicheroIni:TIniFile;
    pathini:string;
    Seccion:string;
    Constructor Create;
    //APP
    Procedure setApp(App:String='APP1';Valor:String='');
    Procedure setImgApp(App:String='APP1';Valor:String='');
    Procedure setAPPNombre(APP:String;Valor:String);
    Procedure setAPPuso(APP:String;Valor:Integer);
    Procedure setAPPPar(APP:String;Valor:String);
    Function getApp(App:String='APP1'):String;
    Function getImgApp(App:String='APP1'):String;
    Function getAPPNombre(APP:String):String;
    Function getAppUso(App:String='APP1'):Integer;
    Function getAPPPar(APP:String):String;
    Procedure delAPP(App:String);
    //PDFREPORT
    Procedure setPDFReportRutaFonts(PDFREP:String;Valor:String);
    Procedure setPDFReportTxt(PDFREP:String;Valor:String);
    Procedure setPDFReportCopyFonts(PDFREP:String;Valor:Boolean);
    Procedure delPDFReport(PDFREP:String);
    Function getPDFReportRutafonts(PDFREP:String):String;
    Function getPDFReportTxt(PDFREP:String):String;
    Function getPDFReporCopyFonts(PDFREP:String):Boolean;

    //____________________
    //======================
    //    PROPERTIES
    //======================

    Property ListBoxModuloValues: string read getListBoxModuloValues write setListBoxModuloValues;
    Property ListBoxVersionValues: string read getListBoxVersionValues write setListBoxVersionValues;

    Property FdeFilePath: string read getFdeFilepath write setFdeFilePath;
    Property WebAppsDir:  String read getWebappsDir write setWebappsDir;
    Property JavaHome:   String read getJavaHome write setJavaHome;
    Property OcultarDirROOT: Boolean read getOcultarDirROOT write setOcultarDirROOT;
    Property MostrarOK: Boolean read getMostrarOK write setMostrarOK;
    Property DelWars: Boolean read getDelWars write setDelWars;
    Property ConfirmDel: Boolean read getConfirmDel write setConfirmDel;
    Property ClearMemo: Boolean read getClrMemo write setClrMemo;
    Property MostrarERR: Boolean read GetMostrarERR write setMostrarERR;
    Property MostrarMSJ: Boolean read getMostrarMSJ write setMostrarMSJ;
    Property SoloDir: Boolean read getSoloDir write setSoloDir;
    Property TrayMinimize: Boolean read getTrayMinimize write setTrayMinimize;
    Property TrayScriptFDE: Boolean read getTrayScriptFDE write setTrayScriptFDE;
    Property TrayGenWar: Boolean read getTrayGenWar write setTrayGenWar;
    Property TrayRunAPP: Boolean read getTrayRunAPP write setTrayRunAPP;
    Property Beep: Boolean read getBeep write setBeep;
    Property OpcSalir: Boolean read getOpcSalir write setOpcSalir;
    Property OrderByUso: Boolean read getOrderByUso write setOrderByUso;
    Property CompWebXml: Boolean read getCompWebXml write setCompWebXml;
    Property PageIndex: Integer read getPageIndex write setPageIndex;
    Property PDFReportselection: Integer read getPDFReportselection write setPDFReportselection;
    Property FdeIni: String read getFdeIni;
    Property FdeDir: String read getFdeDir;
    Property AppPath: String read getAppPath;
    Property ProductVersion: String read getProductVersion;
    Property IniUpdate: String read getIniUpdate;
    Property DSDescription:String read getDSDescription write setDSDescription;
    Property DSResType:String read getDSResType write setDSResType;
    Property DSResAuth:String read getDSResAuth write setDSResAuth;
    Property DSUseJdbcDatasource:Integer read getDSUseJdbcDatasource write setDSUseJdbcDatasource;
    Property DSJdbcDataSource:String read getDSJdbcDataSource write setDSJdbcDataSource;
    Property DSResRefName:String read getDSResRefName write setDSResRefName;
end;

implementation
Constructor TGlobales.Create;
Begin
 inherited;
 //CREAR INI
  If trim(pathini).IsEmpty then
       pathini := ExtractFilePath(Application.ExeName)+'fde.ini';
  If trim(Seccion).IsEmpty then
       Seccion := 'CONFIG';
  FicheroIni:=TIniFile.Create(pathini);
end;

Procedure TGlobales.setInteger(variable:String;Valor:Integer);
Begin
  FicheroIni.WriteInteger(Seccion,variable,Valor);
end;

Function TGlobales.getInteger(variable:String;Valordefault:Integer):Integer;
Begin
   FicheroIni.Free;
   FicheroIni:=TIniFile.Create(pathini);
   Result:=FicheroIni.ReadInteger(Seccion,variable,Valordefault);
end;

Function TGlobales.getVarStr(variable,Valordefault:String):String;
begin
   FicheroIni.Free;
   FicheroIni:=TIniFile.Create(pathini);
   Result:=FicheroIni.ReadString(Seccion,variable,Valordefault);
end;

Procedure TGlobales.setVarstr(variable,Valor:String);
begin
  If not trim(Valor).IsEmpty then
  FicheroIni.WriteString(Seccion,variable,Valor);
end;
Procedure TGlobales.setBoolean(variable:String;Valor:Boolean);
begin
  If not Valor then Valor:=False;
  FicheroIni.WriteBool(Seccion,Variable,Valor);
end;
Function TGlobales.getBoolean(variable:String;Valordefault:Boolean):Boolean;
begin
   FicheroIni.Free;
   FicheroIni:=TIniFile.Create(pathini);
   Result:=FicheroIni.ReadBool(Seccion,variable,Valordefault);
end;
procedure TGlobales.delAPP(App:String);
begin
   FicheroIni.Free;
   FicheroIni:=TIniFile.Create(pathini);
   Seccion:='APPS';
   FicheroIni.DeleteKey(Seccion,App);
end;

procedure TGlobales.delPDFReport(PDFREP:String);
begin
   FicheroIni.Free;
   FicheroIni:=TIniFile.Create(pathini);
   Seccion:='PDFREPORT';
   FicheroIni.DeleteKey(Seccion,PDFREP);
end;

 {SETTER - GETTER}
Procedure TGlobales.setMostrarOK(Valor:Boolean);
begin
   Seccion:='MEMO_CONSOLE';
   setBoolean('MostrarOK',Valor);
end;
Procedure TGlobales.setDelWars(Valor:Boolean);
begin
   Seccion:='OPCIONES';
   setBoolean('PrevGenDelWar',Valor);
end;
Procedure TGlobales.setConfirmDel(Valor:Boolean);
begin
   Seccion:='MEMO_CONSOLE';
   setBoolean('ConfirmDEL',Valor);
end;
Procedure TGlobales.setClrMemo(Valor:Boolean);
begin
   Seccion:='MEMO_CONSOLE';
   setBoolean('ClrMemo',Valor);
end;


Procedure TGlobales.setMostrarERR(Valor:Boolean);
begin
   Seccion:='MEMO_CONSOLE';
   setBoolean('MostrarERR',Valor);
end;

Procedure TGlobales.setMostrarMSJ(Valor:Boolean);
begin
    Seccion:='MEMO_CONSOLE';
   setBoolean('MostrarMSJ',Valor);
end;

Procedure TGlobales.setFdeFilePath(Valor:String);
begin
  Seccion:='CONFIG';
   setVarstr('FdeFile',Valor);
end;

Procedure TGlobales.setWebappsDir(Valor:String);
begin
   Seccion:='CONFIG';
   setVarstr('WebappsDir',Valor);
end;

Procedure TGlobales.setOcultarDirROOT(Valor:Boolean);
begin
   Seccion:='CONFIG';
   setBoolean('OcultarDirROOT',Valor);
end;

Procedure TGlobales.setJavaHome(Valor:String);
begin
   Seccion:='OPCIONES';
   If Trim(Valor).IsEmpty Then
   begin
      FicheroIni.Free;
      FicheroIni:=TIniFile.Create(pathini);
      FicheroIni.DeleteKey(Seccion,'JAVA_HOME');
   end
   else setVarstr('JAVA_HOME',Valor);

end;

Procedure TGlobales.setApp(App:String='APP1';Valor:String='');
begin
   Seccion:='APPS';
   If Trim(Valor).IsEmpty Then delAPP(APP) else setVarstr(App,Valor);
end;
Procedure TGlobales.setImgApp(App:String='APP1';Valor:String='');
begin
  Seccion:='APPS';
  If Trim(Valor).IsEmpty Then delAPP(APP+'IMG') else setVarstr((App+'IMG'),Valor);
end;

Function TGlobales.getWebappsDir():String;
begin
   Seccion:='CONFIG';
   Result:=getVarStr('WebappsDir',ExtractFilePath(Application.ExeName));
end;
Function TGlobales.getJavaHome():String;
begin
   Seccion:='OPCIONES';
   Result:=getVarStr('JAVA_HOME','');
end;

Function TGlobales.getFdeFilepath():String;
begin
   Seccion:='CONFIG';
   Result:=getVarStr('FdeFile',' ');
end;

Function TGlobales.getFdeDir():String;
begin
   Seccion:='CONFIG';
   Result:=ExtractFilePath(Application.ExeName)+'FDE Files\';
   If not DirectoryExists(Result) then
      CreateDir(Result);
end;

Function TGlobales.getFdeIni():String;
begin
   Seccion:='CONFIG';
   Result:=pathini;
end;

Function TGlobales.getAppPath():String;
begin
   Seccion:='CONFIG';
   Result:=ExtractFilePath(Application.ExeName)
end;

Function TGlobales.getApp(App:String='APP1'):String;
begin
   Seccion:='APPS';
   Result:=getVarStr(App,'');
end;
Function TGlobales.getImgApp(App:String='APP1'):String;
begin
   Seccion:='APPS';
   Result:=getVarStr((App+'IMG'),'');
end;
Function TGlobales.getAppUso(App:String='APP1'):Integer;
begin
   Seccion:='APPS';
   Result:=getInteger((App+'USO'),0);
end;

Function TGlobales.getMostrarOK():Boolean;
begin
   Seccion:='MEMO_CONSOLE';
   Result:=getBoolean('MostrarOK',TRUE);
end;

Function TGlobales.getDelWars():Boolean;
begin
   Seccion:='OPCIONES';
   Result:=getBoolean('PrevGenDelWar',TRUE);
end;
Function TGlobales.getConfirmDel():Boolean;
begin
   Seccion:='MEMO_CONSOLE';
   Result:=getBoolean('ConfirmDEL',TRUE);
end;
Function TGlobales.getClrMemo():Boolean;
begin
   Seccion:='MEMO_CONSOLE';
   Result:=getBoolean('ClrMemo',FALSE);
end;
Function TGlobales.getMostrarERR():Boolean;
begin
   Seccion:='MEMO_CONSOLE';
   Result:=getBoolean('MostrarERR',TRUE);
end;
Function TGlobales.getMostrarMSJ():Boolean;
begin
   Seccion:='MEMO_CONSOLE';
   Result:=getBoolean('MostrarMSJ',TRUE);
end;
Function TGlobales.getSoloDir():Boolean;
begin
   Seccion:='CONFIG';
   Result:=getBoolean('SoloDir',TRUE);
end;

Procedure TGlobales.setSoloDir(Valor:Boolean);
begin
    Seccion:='CONFIG';
    setBoolean('SoloDir',Valor);
end;
Function TGlobales.getOcultarDirROOT():Boolean;
begin
   Seccion:='CONFIG';
   Result:=getBoolean('OcultarDirROOT',FALSE);
end;

Function TGlobales.getTrayMinimize():Boolean;
begin
   Seccion:='OPCIONES';
   Result:=getBoolean('MinimizeToTray',FALSE);
end;
Function TGlobales.getTrayScriptFDE():Boolean;
begin
   Seccion:='OPCIONES';
   Result:=getBoolean('TrayScriptFDE',FALSE);
end;
Function TGlobales.getTrayGenWar():Boolean;
begin
   Seccion:='OPCIONES';
   Result:=getBoolean('TrayGenWar',FALSE);
end;

Function TGlobales.getTrayRunAPP():Boolean;
begin
    Seccion:='OPCIONES';
    Result:=getBoolean('TrayRunAPP',FALSE);
end;

Function TGlobales.getBeep():Boolean;
begin
   Seccion:='OPCIONES';
   Result:=getBoolean('Beep',FALSE);
end;
Function TGlobales.getOpcSalir():Boolean;
begin
   Seccion:='OPCIONES';
   Result:=getBoolean('RecOpcSalir',FALSE);
end;

Function TGlobales.getOrderByUso():Boolean;
begin
   Seccion:='OPCIONES';
   Result:=getBoolean('OrderByUso',FALSE);
end;

Function TGlobales.getcompWebXml():Boolean;
Begin
    Seccion:='CONFIG';
    Result:=getBoolean('chkWebXml',FALSE);
end;

Procedure TGlobales.setTrayMinimize(Valor:Boolean);
begin
    Seccion:='OPCIONES';
    setBoolean('MinimizeToTray',Valor);
end;
Procedure TGlobales.setTrayRunAPP(Valor:Boolean);
 begin
    Seccion:='OPCIONES';
    setBoolean('TrayRunAPP',Valor);
end;

Procedure TGlobales.setTrayScriptFDE(Valor:Boolean);
begin
    Seccion:='OPCIONES';
    setBoolean('TrayScriptFDE',Valor);
end;

Procedure TGlobales.setTrayGenWar(Valor:Boolean);
begin
    Seccion:='OPCIONES';
    setBoolean('TrayGenWar',Valor);
end;

Procedure TGlobales.setBeep(Valor:Boolean);
begin
    Seccion:='OPCIONES';
    setBoolean('Beep',Valor);
end;

Procedure TGlobales.setOpcSalir(Valor:Boolean);
begin
    Seccion:='OPCIONES';
    setBoolean('RecOpcSalir',Valor);
end;

Procedure TGlobales.setOrderByUso(Valor:Boolean);
Begin
    Seccion:='OPCIONES';
    setBoolean('OrderByUso',Valor);
end;

Procedure TGlobales.setcompWebXml(Valor:Boolean);
Begin
    Seccion:='CONFIG';
    setBoolean('chkWebXml',Valor);
end;

Procedure TGlobales.setPageIndex(Valor:Integer);
Begin
   Seccion:='CONFIG';
   setInteger('PageIndex',Valor);
end;

Procedure TGlobales.setAPPuso(APP:String;Valor:Integer);
Begin
   Seccion:='APPS';
   If Valor = 0 Then delAPP(APP+'USO') else setInteger(APP+'USO',Valor);
end;

Procedure TGlobales.setPDFReportselection(Valor:Integer);
 Begin
   Seccion:='PDFREPORT';
   setInteger('pdfreport',Valor);
end;

Procedure TGlobales.setAPPNombre(APP:String;Valor:String);
Begin
   Seccion:='APPS';
   If Trim(Valor).IsEmpty Then delAPP(APP+'NOM') else setVarstr(APP+'NOM',Valor);
end;

Procedure TGlobales.setPDFReportRutaFonts(PDFREP:String;Valor:String);
Begin
   Seccion:='PDFREPORT';
   If Trim(Valor).IsEmpty Then delPDFReport(PDFREP+'Path') else setVarstr(PDFREP+'Path',Valor);
end;

Procedure TGlobales.setPDFReportTxt(PDFREP:String;Valor:String);
Begin
   Seccion:='PDFREPORT';
   If Trim(Valor).IsEmpty Then delPDFReport(PDFREP+'txt') else setVarstr(PDFREP+'txt',Valor);
end;
Procedure TGlobales.setPDFReportCopyFonts(PDFREP:String;Valor:Boolean);
Begin
    Seccion:='PDFREPORT';
    setBoolean(PDFREP+'cpy',Valor);
end;

Procedure TGlobales.setAPPPar(APP:String;Valor:String);
Begin
   Seccion:='APPS';
   If Trim(Valor).IsEmpty Then delAPP(APP+'PAR') else setVarstr(APP+'PAR',Valor);
end;

Function TGlobales.getPageIndex():Integer;
begin
   Seccion:='CONFIG';
   Result:=getInteger('PageIndex',4);
end;

Function TGlobales.getAPPNombre(APP:String):String;
begin
   Seccion:='APPS';
   Result:=getVarStr(APP+'NOM','');
end;

Function TGlobales.getPDFReportRutaFonts(PDFREP:String):String;
var Defalultvalue:String;
begin
   Seccion:='PDFREPORT';
   Defalultvalue:=' ';
   If (PDFREP='pdfreplin') Or (PDFREP='pdfrepper') Then Defalultvalue:='../fonts/';
   Result:=getVarStr(PDFREP+'Path',Defalultvalue);
end;

Function TGlobales.getPDFReportTxt(PDFREP:String):String;
var Defaultvalue:String;
begin
   Defaultvalue:='SearchNewFontsOnce= true{CRLF}Leading= 2{CRLF}TopMargin= 0.75{CRLF}DashedStyle= 4;2{CRLF}AdjustToPaper= true{CRLF}LeftMargin= 0.75{CRLF}DEBUG= false{CRLF}ServerPrinting= false{CRLF}Embeed Fonts= false{CRLF}Version= 1.0.0.0{CRLF}FontsLocation= ../fonts;{CRLF}BottomMargin= 6{CRLF}LongDashedStyle= 6;2{CRLF}Barcode128AsImage= true{CRLF}OutputFileDirectory= .{CRLF}LineCapProjectingSquare= true{CRLF}SearchNewFonts= false{CRLF}DottedStyle= 1;2{CRLF}LongDotDashedStyle= 6;2;1;2{CRLF}{CRLF}[Fonts Location (Sun)]{CRLF}Microsoft Sans Serif= ../fonts/micross.ttf{CRLF}Verdana= ../fonts/verdana.ttf{CRLF}Arial Narrow= ../fonts/ARIALN.TTF{CRLF}Time New Roman= ../fonts/times.ttf{CRLF}Courier New= ../fonts/cour.ttf{CRLF}Courier New= ../fonts/couri.ttf{CRLF}';
   case PDFREP of
   'pdfrepwin': Defaultvalue:='SearchNewFontsOnce= true{CRLF}Leading= 2{CRLF}TopMargin= 0.75{CRLF}DashedStyle= 4;2{CRLF}AdjustToPaper= true{CRLF}LeftMargin= 0.75{CRLF}DEBUG= false{CRLF}ServerPrinting= false{CRLF}Embeed Fonts= false{CRLF}Version= 1.0.0.0{CRLF}FontsLocation= c:\windows\fonts;{CRLF}BottomMargin= 6{CRLF}LongDashedStyle= 6;2{CRLF}Barcode128AsImage= true{CRLF}OutputFileDirectory= .{CRLF}LineCapProjectingSquare= true{CRLF}SearchNewFonts= false{CRLF}DottedStyle= 1;2{CRLF}LongDotDashedStyle= 6;2;1;2{CRLF}{CRLF}[Fonts Location (Sun)]{CRLF}Microsoft Sans Serif= c:\windows\fonts\micross.ttf{CRLF}Verdana= c:\windows\fonts\verdana.ttf{CRLF}Arial Narrow= c:\windows\fonts\ARIALN.TTF{CRLF}Time New Roman= c:\windows\fonts\times.ttf{CRLF}Courier New= c:\windows\fonts\cour.ttf{CRLF}Courier New= c:\windows\fonts\couri.ttf{CRLF}';
   'pdfreplin': Defaultvalue:='SearchNewFontsOnce= true{CRLF}Leading= 2{CRLF}TopMargin= 0.75{CRLF}DashedStyle= 4;2{CRLF}AdjustToPaper= true{CRLF}LeftMargin= 0.75{CRLF}DEBUG= false{CRLF}ServerPrinting= false{CRLF}Embeed Fonts= false{CRLF}Version= 1.0.0.0{CRLF}FontsLocation= ../fonts;{CRLF}BottomMargin= 6{CRLF}LongDashedStyle= 6;2{CRLF}Barcode128AsImage= true{CRLF}OutputFileDirectory= .{CRLF}LineCapProjectingSquare= true{CRLF}SearchNewFonts= false{CRLF}DottedStyle= 1;2{CRLF}LongDotDashedStyle= 6;2;1;2{CRLF}{CRLF}[Fonts Location (Sun)]{CRLF}Microsoft Sans Serif= ../fonts/micross.ttf{CRLF}Verdana= ../fonts/verdana.ttf{CRLF}Arial Narrow= ../fonts/ARIALN.TTF{CRLF}Time New Roman= ../fonts/times.ttf{CRLF}Courier New= ../fonts/cour.ttf{CRLF}Courier New= ../fonts/couri.ttf{CRLF}';
   'pdfrepwas': Defaultvalue:='SearchNewFontsOnce= true{CRLF}Leading= 2{CRLF}TopMargin= 0.75{CRLF}DashedStyle= 4;2{CRLF}AdjustToPaper= true{CRLF}LeftMargin= 0.75{CRLF}DEBUG= false{CRLF}ServerPrinting= false{CRLF}Embeed Fonts= false{CRLF}Version= 1.0.0.0{CRLF}FontsLocation= /archivos/cguweb;{CRLF}BottomMargin= 6{CRLF}LongDashedStyle= 6;2{CRLF}Barcode128AsImage= true{CRLF}OutputFileDirectory= .{CRLF}LineCapProjectingSquare= true{CRLF}SearchNewFonts= false{CRLF}DottedStyle= 1;2{CRLF}LongDotDashedStyle= 6;2;1;2{CRLF}{CRLF}[Fonts Location (Sun)]{CRLF}Microsoft Sans Serif= /archivos/cguweb/micross.ttf{CRLF}Verdana= /archivos/cguweb/verdana.ttf{CRLF}Arial Narrow= /archivos/cguweb/ARIALN.TTF{CRLF}Time New Roman= /archivos/cguweb/times.ttf{CRLF}Courier New= /archivos/cguweb/cour.ttf{CRLF}Courier New= /archivos/cguweb/couri.ttf{CRLF}';
   end;

   Seccion:='PDFREPORT';
   Result:=getVarStr(PDFREP+'txt',Defaultvalue);
end;

Function TGlobales.getPDFReporCopyFonts(PDFREP:String):Boolean;
var defaultValue:Boolean;
Begin
   defaultValue:=((PDFREP='pdfreplin') Or (PDFREP='pdfrepper'));
   Result:=getBoolean(PDFREP+'cpy',defaultValue);
end;

Function TGlobales.getAPPPar(APP:String):String;
begin
   Seccion:='APPS';
   Result:=getVarStr(APP+'PAR','');
end;

Function TGlobales.getProductVersion():String;
var FileVerInfo: TFileVersionInfo;
begin
   FileVerInfo := TFileVersionInfo.Create(nil);
   Try
      FileVerInfo.ReadFileInfo;
      Result := FileVerInfo.VersionStrings.Values['ProductVersion'];
   finally
     FileVerInfo.Free;
   end;
end;

Function TGlobales.getIniUpdate():String;
begin
   Seccion:='UPDATE';
   Result:=getVarStr('LINK','https://filedn.com/l4o5bp4oGNf0AfR1x0lJ3xB/DelFind/update.ini');
end;

Function TGlobales.getPDFReportselection():Integer;
 Begin
   Seccion:='PDFREPORT';
   Result:=getInteger('pdfreport',0);
end;

Function TGlobales.getListBoxModuloValues():String;
begin
   Seccion:='DISPLAYNAME';
   Result:=getVarStr('Modules','Adquisiciones,"Activo Fijo","Contratos de Arriendo","Cargas Automaticas",Contratos,"Documentos Adjuntos","Evaluación de Proveedores","Impresión Etiquetas",Existencias,"Flota de Vehiculos","Gestión de Autorizaciones",Licitaciones,Mantenimiento,Menu,"CGU Nucleo Auditoria",Pasajes,"Plan de Compras",Plantillas,"Portal Proveedores",Telefonia,"Vidal Vademecum","Versiones Modulos","Servicios Web"');
end;

Procedure TGlobales.setListBoxModuloValues(Valor:String);
begin
   Seccion:='DISPLAYNAME';
   FicheroIni.WriteString(Seccion,'Modules',Valor);
end;

Function TGlobales.getListBoxVersionValues():String;
begin
   Seccion:='DISPLAYNAME';
   Result:=getVarStr('Versions','');
end;

Procedure TGlobales.setListBoxVersionValues(Valor:String);
begin
   Seccion:='DISPLAYNAME';
   FicheroIni.WriteString(Seccion,'Versions',Valor);
end;

Procedure TGlobales.setDSDescription(Valor:String);
begin
   Seccion:='DATASOURCE';
   FicheroIni.WriteString(Seccion,'DESCRIPTION',Valor);
end;

Function TGlobales.getDSDescription():String;
begin
   Seccion:='DATASOURCE';
   Result:=getVarStr('DESCRIPTION','DB Connection');
end;

Procedure TGlobales.setDSResType(Valor:String);
begin
   Seccion:='DATASOURCE';
   FicheroIni.WriteString(Seccion,'RES-TYPE',Valor);
end;

Function TGlobales.getDSResType():String;
begin
   Seccion:='DATASOURCE';
   Result:=getVarStr('RES-TYPE','javax.sql.DataSource');
end;

Procedure TGlobales.setDSResAuth(Valor:String);
begin
  Seccion:='DATASOURCE';
  FicheroIni.WriteString(Seccion,'RES-AUTH',Valor);
end;

Function TGlobales.getDSResAuth():String;
begin
   Seccion:='DATASOURCE';
   Result:=getVarStr('RES-AUTH','Container');
end;

Procedure TGlobales.setDSUseJdbcDatasource(Valor:Integer);
begin
   Seccion:='DATASOURCE';
   setInteger('USE_JDBC_DATASOURCE',Valor);
end;

Function TGlobales.getDSUseJdbcDatasource():Integer;
begin
   Seccion:='DATASOURCE';
   Result:=getInteger('USE_JDBC_DATASOURCE',1);
end;

Procedure TGlobales.setDSJdbcDataSource(Valor:String);
begin
  Seccion:='DATASOURCE';
  FicheroIni.WriteString(Seccion,'JDBC_DATASOURCE',Valor);
end;

Function TGlobales.getDSJdbcDataSource():String;
begin
   Seccion:='DATASOURCE';
   Result:=getVarStr('JDBC_DATASOURCE','');
end;
Procedure TGlobales.setDSResRefName(Valor:String);
begin
  Seccion:='DATASOURCE';
  FicheroIni.WriteString(Seccion,'RES-REF-NAME',Valor);
end;

Function TGlobales.getDSResRefName():String;
begin
   Seccion:='DATASOURCE';
   Result:=getVarStr('RES-REF-NAME','');
end;

end.
