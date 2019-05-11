unit UMyUtils;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
    RichMemo, LazFileUtils, FileUtil, Grids,
    LCLIntf, ExtCtrls, CheckLst, StdCtrls, UGlobales,
    LCLType, Buttons, VarRegEnv,registry,Process,
    Clipbrd, ComCtrls, UMyXml, UMyClpBrd, UMyWin, UMyRCS, IniFiles,
    fileinfo, winpeimagereader {need this for reading exe info}
  , elfreader {needed for reading ELF executables}
  , machoreader {needed for reading MACH-O executables}
    ,ShellApi
    ;
type
  TMyUtils=class
Public
  Const SG_checked=0;
  Sg_Carpeta=1;
  Sg_RutaAbsoluta=2;
  Sg_NombreWar=3;

  Procedure addToRichMemo(Texto:String;var Memo:TRichMemo;var StatusBar1:TStatusBar;color:Tcolor = clDefault);
  Function  getAppPath():String;
  function  clearDirPath(path:String):String;
  function  clearFilePath(path:String):String;
  Function  RemoveFolder(Folder: String):Boolean;
  Procedure test();
  Function  CheckDir(DirPath:String):Boolean;
  Function  CheckNoMaskName(FileName:String):Boolean;
  function  LastDirName(path:String):String;
  Procedure MostrarCarpeta(Dir:String);
  Procedure FiltrarDirs(FilePath,Filtertxt:String; var CheckListBox1: TCheckListBox);
  procedure FilDirGrid(FilePath,Filtertxt:String; var StringGrid1: TStringGrid);
  procedure FilDirGrid4(Filtertxt:String;var StringGrid5: TStringGrid);
  Procedure InvertChecklist(var CheckListBox1: TCheckListBox);
  Procedure InvertStringGrid(var StringGrid1: TStringGrid);
  Procedure SelAllStringGrid(var StringGrid1: TStringGrid);
  Procedure SelNoneStringGrid(var StringGrid1: TStringGrid);
  Procedure DelAllRowsGrid(var StringGrid1: TStringGrid);
  Function  getDatoFDE(FilaRead:String):String;
  Function  getTipoFDE(FilaRead:String):String;
  Procedure GenWar(StringGrid1:TStringGrid;javahome:String;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StatusBar1:TStatusBar);
  Function retJavaHome():String;
  Function JavaHomeOk(ruta:String):Boolean;
  Procedure runProgram(APP,runIn:String;parms:TStrings);
  Procedure ClipboardCopy(Text:String);
  Procedure FileToClipboard(Text:String);
  Procedure goNotebookPage(Page1:TPage;var Notebook1:TNotebook);
  Function isElevated():Boolean;
  Procedure loadOldVar(when:String;var consider:String;var found:String;var X:String);
  Function getModuleName(String1:String):String;
  Procedure ProcesaPDFReport(StringGrid1:TStringGrid;CopyFonts:Boolean;PathFonts:String;PDfReportTXT:String);
  Function getFechaHoraForm(FechaHora:TDateTime;formato:String = 'yyyy-mm-dd';separador:Char='-'):String;
  Function versionStr(ModuloPar, VersionPar, FechaVersionPar:String):String;
  Procedure addItemListBox(var ListBox1:TListBox;NuevoItem:String);
  Procedure delItemListBox(var ListBox1:TListBox;delItem:String);
  Procedure applyDataSource(var EditJdbcDataSource,EditResRefName:TEdit;ItemIndex:Integer;DefaultJdbcDataSource,DefaultResRefName:String);
  Procedure getDataSource(pathwebxml,pathclientcfg,GxVersion,Modulo:String;var EDITJDBC, EDITresref:TEdit);
  Procedure updDataSource(StringGrid1:TStringGrid);
  Function RunAsAdmin(const Path, Params: string): Boolean;
  Procedure GetClientCfgPathModuleGXVersion(BasePath:String;var ClientCfgPath,Module,GxVersion:String);
Private
  Procedure GenWarDir(RutaBase,javahome:String;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StausBar1:TStatusBar;var QErrores:Integer;nomwar:String='');
end;

implementation
Procedure TMyUtils.addToRichMemo(Texto:String;var Memo:TRichMemo;var StatusBar1:TStatusBar; color:Tcolor = clDefault);
var largoText,LargoMemo:Integer;
Begin
    largoText:=Texto.Length+1;
    Memo.Lines.Add(Texto);
    LargoMemo:=Memo.Lines.Text.Length;
    Memo.SetRangeColor((LargoMemo-largoText),largoText,color);
    StatusBar1.SimpleText:=Texto;
    Application.ProcessMessages;
end;

Function TMyUtils.getAppPath():String;
begin
     Result:=ExtractFilePath(Application.ExeName)
end;

function TMyUtils.clearDirPath(path:String):String;
begin
     path:=stringReplace(path , '..',  '..\' ,[rfReplaceAll, rfIgnoreCase]);
     ForcePathDelims(path); //cambia '/' por '\'
     path:=stringReplace(path , '\\',  '\' ,[rfReplaceAll, rfIgnoreCase]);
     LazFileUtils.CleanAndExpandDirectory(path); //limpia directorio agrega /al final
     path:=LazFileUtils.AppendPathDelim(path);
     Result:=path;
end;
function TMyUtils.LastDirName(path:String):String;
begin
     Path:=clearDirPath(Path);
     if Path[Path.Length]=DirectorySeparator then
          Path:=Path.Substring(0,Path.Length-1);
     Result:=Path.Substring(Path.LastIndexOf(DirectorySeparator)+1);
end;
function TMyUtils.clearFilePath(path:String):String;
begin
     Result:='';
     IF Trim(Path).IsEmpty then
          exit;
     ForcePathDelims(path); //cambia '/' por '\'
     LazFileUtils.CleanAndExpandFilename(path);
     path:=stringReplace(path , '\\',  '\' ,[rfReplaceAll, rfIgnoreCase]);
     If path[path.Length]='\' then
     path:=trim(path).substring(0,path.Length-1);
     Result:=path;
end;

Function TMyUtils.RemoveFolder(Folder: String):Boolean;
begin
   Result:=DeleteDirectory(Folder,false);
   Result:= not CheckDir(Folder);
end;

Procedure TMyUtils.test();
var texto:String;
  var myw:TMyWin;
     FileVerInfo: TFileVersionInfo;
begin
  myw:=TMyWin.Create;
  FileVerInfo:=TFileVersionInfo.Create(nil);
  FileVerInfo.ReadFileInfo;
  texto:=  'IsAdministrator: '        + BoolToStr(myw.IsAdministrator, True) + sLineBreak +
           'IsAdministratorAccount: ' + BoolToStr(myw.IsAdministratorAccount, True) + sLineBreak +
           'IsUACEnabled: '           + BoolToStr(myw.IsUACEnabled, True) + sLineBreak +
           'IsElevated: '             + BoolToStr(myw.IsElevated, True)+ sLineBreak +
           'Company: '                + FileVerInfo.VersionStrings.Values['CompanyName']+ sLineBreak +
           'File description: '       + FileVerInfo.VersionStrings.Values['FileDescription'] + sLineBreak +
           'File version: '           + FileVerInfo.VersionStrings.Values['FileVersion'] + sLineBreak +
           'Internal name: '          + FileVerInfo.VersionStrings.Values['InternalName']+ sLineBreak +
           'Legal copyright: '        + FileVerInfo.VersionStrings.Values['LegalCopyright']+ sLineBreak +
           'Original filename: '      + FileVerInfo.VersionStrings.Values['OriginalFilename']+ sLineBreak +
           'Product name: '           + FileVerInfo.VersionStrings.Values['ProductName']+ sLineBreak +
           'Product version: '        + FileVerInfo.VersionStrings.Values['ProductVersion'];
  ShowMessage(texto);
  myw.Free;
  FileVerInfo.Free;
end;

Function TMyUtils.CheckDir(DirPath:String):Boolean;
var
 Directorios: TStringList;
begin
 Directorios := TStringList.Create;
 if DirPath.Substring((DirPath.Length-2)) = '\*' then
  begin
    DirPath:=DirPath.Substring(0,(DirPath.Length-1));
    FindAllDirectories(Directorios, DirPath, False);
    Result:=Directorios.Count>0;
  end
 else
  begin
    DirPath:=clearDirPath(DirPath);
    Result:=DirectoryExists(DirPath);
  end;
 Directorios.Free;
end;
Function TMyUtils.CheckNoMaskName(FileName:String):Boolean;
 //:*?"<>|
begin
 Result:=True;
 If (FileName.IndexOf(':')>1)  Or (FileName.IndexOf('*')>-1) Or
    (FileName.IndexOf('*')>-1) Or (FileName.IndexOf('?')>-1) Or
    (FileName.IndexOf('"')>-1) Or (FileName.IndexOf('<')>-1) Or
    (FileName.IndexOf('>')>-1) Or (FileName.IndexOf('|')>-1) Then
      Result:=False;
end;

procedure TMyUtils.MostrarCarpeta(Dir:String);
begin
  If (DirectoryExists(ClearDirPath(Dir))) then
        OpenDocument(Dir);
end;
procedure TMyUtils.FiltrarDirs(FilePath,Filtertxt:String; var CheckListBox1: TCheckListBox);
 var
  Directorios: TStringList;
  i:Integer;
  dirtmp:String;
begin
   Directorios:=TStringList.Create;
   CheckListBox1.Clear;
   FindAllDirectories(Directorios,FilePath,false);
   for i := 0 to Directorios.Count - 1 do
     begin
       dirtmp:=LowerCase(LastDirName(Directorios[i]));
       If (Trim(Filtertxt).IsEmpty) Or (AnsiPos(Filtertxt,dirtmp)>0) then
          CheckListBox1.Items.Add(Directorios[i]);
     end;
   CheckListBox1.CheckAll(cbChecked,True,True);
   Directorios.Free;
  end;
Procedure TMyUtils.DelAllRowsGrid(var StringGrid1: TStringGrid);
   var i,x:Integer;
begin
  x:=StringGrid1.RowCount-1;
   for i:=1 to x do
   begin
     StringGrid1.DeleteRow(1);
   end;
end;

procedure TMyUtils.FilDirGrid4(Filtertxt:String;var StringGrid5: TStringGrid);
begin
    DelAllRowsGrid(StringGrid5);
end;

Function TMyUtils.getModuleName(String1:String):String;
  var i:Integer;
Begin
  for i:= Length(String1) downto 1 do If (String1[i]='-') then break;
  If i>1 then exit(String1.Substring(0,i-1)) else exit(String1);
end;

procedure TMyUtils.FilDirGrid(FilePath,Filtertxt:String; var StringGrid1: TStringGrid);
var
 Directorios: TStringList;
 i,x:Integer;
 dirfull,dirtmp, modulo, displayname,ClientCfg, webXml:String;
 GxVersion:String;
 varglo:TGlobales;
 myxml:TMyXml;
 ex:Boolean;
begin
 varglo:=TGlobales.Create;
 x:=0;
 Directorios:=TStringList.Create;
 DelAllRowsGrid(StringGrid1);
 FindAllDirectories(Directorios,FilePath,false);
 myxml:=TMyXml.create('');
 for i := 0 to Directorios.Count - 1 do
   begin
     dirfull:=clearDirPath(Directorios[i]);
     dirtmp:=LastDirName(dirfull);
     If ((Trim(Filtertxt).IsEmpty) Or (AnsiPos(Filtertxt,LowerCase(dirtmp))>0)) then
      Begin
        If ((varglo.OcultarDirROOT=TRUE)
        and (LowerCase(dirtmp)<> 'root')
        and (LowerCase(dirtmp)<> 'docs')
        and (LowerCase(dirtmp)<> 'manager')
        and (LowerCase(dirtmp)<> 'host-manager')) Or ((varglo.OcultarDirROOT=FALSE)) then
        begin
          x:=x+1;
          GetClientCfgPathModuleGXVersion(dirfull,ClientCfg,modulo,GxVersion);
          webXml:=clearFilePath(dirfull+'WEB-INF\web.xml');
          If Not FileExists(webXml) then webXml:='';
          MyXml.pathxml:=clearFilePath(dirfull+'WEB-INF\web.xml');
          Displayname:=myxml.getValueTagTXT('<display-name>','</display-name>',ex);
          StringGrid1.InsertRowWithValues((x),['1',dirtmp, dirfull, dirtmp, modulo, displayname,ClientCfg,webXml,GxVersion]);
        end;
      end;
   end;
 Directorios.Free;
 myxml.Free;
end;


Procedure TMyUtils.InvertChecklist(var CheckListBox1: TCheckListBox);
 var
   I:Integer;
 begin
    for I := 0 to CheckListBox1.Items.Count - 1 do
      begin
       CheckListBox1.Checked[I]:=Not CheckListBox1.Checked[I];
      end;
 end;
 Procedure TMyUtils.SelAllStringGrid(var StringGrid1: TStringGrid);
  var
    I:Integer;
  begin
     for I := 1 to StringGrid1.RowCount - 1 do
      StringGrid1.Cells[0,i]:='1'
  end;

Procedure TMyUtils.SelNoneStringGrid(var StringGrid1: TStringGrid);
 var
   I:Integer;
 begin
    for I := 1 to StringGrid1.RowCount - 1 do
     StringGrid1.Cells[0,i]:='0'
 end;

Procedure TMyUtils.InvertStringGrid(var StringGrid1: TStringGrid);
 var
   I:Integer;
 begin
    for I := 1 to StringGrid1.RowCount - 1 do
      begin
       If StringGrid1.Cells[0,I]='1' Then
       StringGrid1.Cells[0,i]:='0'
       else
       StringGrid1.Cells[0,i]:='1';
      end;
 end;
Function TMyUtils.getTipoFDE(FilaRead:String):String;
begin
   Filaread:=Trim(FilaRead);
   Result:=FilaRead.Substring(0,6).ToUpper;
end;
Function TMyUtils.getDatoFDE(FilaRead:String):String;
begin
   Filaread:=Trim(FilaRead);
   Result:=Trim(FilaRead.Substring(7));
end;
Procedure TMyUtils.GenWar(StringGrid1:TStringGrid;javahome:String;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StatusBar1:TStatusBar);
 var
  QErrores,DirCount,I:Integer;
  VarGlo:TGlobales;
  nomwar:String;
 begin
    VarGlo:=TGlobales.Create;
    QErrores:=0;
    DirCount:=0;
    addToRichMemo('Inicio ('+TimeToStr(Time)+')',Memo,StatusBar1);
    addToRichMemo('JAVAHOME='+javahome,Memo,StatusBar1);
    TrayIcon1.Hint:=('Inicio ('+TimeToStr(Time)+')');
    for I:= 1 to StringGrid1.RowCount - 1 do
      Begin
       If StringGrid1.Cells[0,i]='1' then
        Begin
          DirCount+=1;
          nomwar:= StringGrid1.Cells[3,i];
          GenWarDir(clearDirPath(StringGrid1.Cells[2,i]),javahome,Memo,TrayIcon1,StatusBar1,QErrores,nomwar);
        end;
     end;

    If DirCount=0 then
     begin
       QErrores:=QErrores+1;
       addToRichMemo('Ningun Directorio Seleccionado.',Memo,StatusBar1,clRed);
       TrayIcon1.Hint:='Ningun Directorio Seleccionado.';
     end;
    addToRichMemo('Fin ('+TimeToStr(Time)+'), '+QErrores.ToString()+' error(es).',Memo,StatusBar1);
    TrayIcon1.Hint:=('Fin ('+TimeToStr(Time)+'), '+QErrores.ToString()+' error(es).');
    If (VarGlo.Beep) Then Beep;
    VarGlo.Free;
end;
Function TMyUtils.retJavaHome():String;
var SL: TStringList;
  x:integer;
  FolderKey,ruta, variable:String;
  Env:TVarRegEnv;
begin
  Result:=GetEnvironmentVariable('JAVA_HOME');
  If JavaHomeOk(Result) Then Exit(Result);

  //JAVA 32
  Result:='';
  variable:='JavaHome';
  Ruta:='\SOFTWARE\JavaSoft\Java Development Kit';
  FolderKey:=ruta;
  env:=TVarRegEnv.Create;
  SL:= env.retfolders(HKEY_LOCAL_MACHINE,FolderKey);
  for x:=0 to pred(SL.Count) do
   begin
     FolderKey:=Ruta+'\'+SL.Strings[x];
     Result:=env.retkeyval(HKEY_LOCAL_MACHINE,FolderKey,variable);
     If JavaHomeOk(Result) Then Exit(Result);
   end;

  //JAVA 64
  Result:='';
  variable:='JavaHome';
  Ruta:='\SOFTWARE\WOW6432Node\JavaSoft\Java Development Kit';
  FolderKey:=ruta;
  env:=TVarRegEnv.Create;
  SL:= env.retfolders(HKEY_LOCAL_MACHINE,FolderKey);
  for x:=0 to pred(SL.Count) do
   begin
     FolderKey:=Ruta+'\'+SL.Strings[x];
     Result:=env.retkeyval(HKEY_LOCAL_MACHINE,FolderKey,variable);
     If JavaHomeOk(Result) Then Exit(Result);
   end;

   Result:='';
   env.Free;
end;

Function TMyUtils.JavaHomeOk(ruta:String):Boolean;
var folder:string;
begin
     Result:=False;
     If DirectoryExists(ruta) Then
     begin
         folder:=clearDirPath(ruta)+'bin\jar.exe';
         If FileExists(folder) then Result:=True;
     end;
end;

Procedure TMyUtils.GenWarDir(RutaBase,javahome:String;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StausBar1:TStatusBar;var QErrores:Integer;nomwar:String='');
 var
   parms:TStrings;
   MsgError,nommod,rutajar,FilePath,rutawebxml:String;
   ErrorExist,ex:Boolean;
   myxml:TMyXml;
   Archivos : TStringList;
   i:Integer;
   VarGlo:TGlobales;
   umw:TMyWin;
 begin
   ErrorExist:=False;
   VarGlo:=TGlobales.Create;
   rutawebxml:=clearDirPath(RutaBase)+'WEB-INF'+PathDelim+'web.xml';
   nommod:='';
   If (FileExists(rutaWebXml)) then
   begin
      myxml:=TMyXml.create(rutaWebXml);
      nommod:=myxml.getValueTagTXT('<display-name>','</display-Name>',ex);
      if (ex) then nommod:='('+trim(nommod)+') ';
      myxml.Free;
   end;

   parms:=TStringList.Create;
   If Trim(nomwar).IsEmpty then nomwar:=LastDirName(RutaBase)+'.war' else nomwar:=nomwar+'.war';
   addToRichMemo('Generando '+nommod+nomwar+'...',Memo,StausBar1);
   TrayIcon1.Hint:='Generando '+nommod+nomwar+'...';
   FilePath:=clearDirPath(RutaBase)+nomwar;
   rutajar:=clearDirPath(javahome)+'bin\jar.exe';

   parms.Add('cfM');
   parms.Add(nomwar);
   parms.Add('.');

     If FileExists(rutajar) Then
     begin
       If FileExists(FilePath) then DeleteFile(FilePath);
       ErrorExist:= FileExists(FilePath);

        //================== Borra .war
        If (VarGlo.DelWars) then
        begin
           Archivos := TStringList.Create;
           FindAllFiles(Archivos, ExtractFilePath(RutaBase), '*.war', false);
           for i := 0 to Archivos.Count - 1 do DeleteFile(Archivos[i]);
           ArChivos.Free;
       end;
      //===================

      runProgram(clearFilePath(clearDirPath(javahome)+'bin\jar.exe'),RutaBase,parms);
      If (ErrorExist Or Not(FileExists(FilePath))) then
      Begin
          umw:=TMyWin.Create;
          QErrores:=QErrores+1;
          If umw.IsElevated()=False then MsgError:='Error: Ejecute como Administrador.'
          else MsgError:= 'Error generando archivo '+nomwar;
          addToRichMemo(MsgError,Memo,StausBar1,clRed);
          TrayIcon1.Hint:=MsgError;
          umw.Free;
      end;
   end;
    parms.Free;
    VarGlo.Free;
 end;

Procedure TMyUtils.runProgram(APP,runIn:String;parms:TStrings);
var
  AProcess: TProcess;
begin
  // Now we will create the TProcess object, and
  // assign it to the var AProcess.
  AProcess := TProcess.Create(nil);

  // Tell the new AProcess what the command to execute is.
  // Let's use the Free Pascal compiler (i386 version that is)
  //AProcess.Environment.Text:='PATH='+RutaAPP;
  AProcess.Executable:= APP;
  AProcess.CurrentDirectory:=runIn;
  AProcess.Parameters:=parms;
  // We will define an option for when the program
  // is run. This option will make sure that our program
  // does not continue until the program we will launch
  // has stopped running.                vvvvvvvvvvvvvv
  AProcess.Options := AProcess.Options + [poWaitOnExit, poNoConsole];
  //AProcess.ShowWindow:=swoHIDE;

  // Now let AProcess run the program
     //showmessage('[PATH='+RutaAPP+']['+runIn+']['+APP+']['+parms.DelimitedText+']') ;
  AProcess.Execute;
  // This is not reached until ppc386 stops running.
  AProcess.Free;
end;

Procedure TMyUtils.ClipboardCopy(Text:String);
Begin
  Clipboard.Clear;
  Clipboard.AsText:=Text;
end;

Procedure TMyUtils.FileToClipboard(Text:String);
 var clip:TMyClpBrd;
Begin
  clip:= TMyClpBrd.Create;
  clip.CopyFileToClipboard(Text);// List Seperated by #0
  clip.Free;
end;

Procedure TMyUtils.goNotebookPage(Page1:TPage;var Notebook1:TNotebook);
begin
 Notebook1.PageIndex:=Notebook1.Pages.IndexOfObject(Page1);
end;

Function TMyUtils.isElevated():Boolean;
var mywin:TMyWin;
  begin
   mywin:=TMyWin.Create;
   Result:=mywin.IsElevated();
   mywin.Free;
  end;
Procedure TMyUtils.loadOldVar(when:String;var consider:String;var found:String;var X:String);
var when2:String;
begin
  when2:=Trim(UpperCase(when));
  If when2='ETIQUETA/VALOR NO EXISTEN' then
  Begin
     consider:='Etiqueta y Valor';
     found:='[X] veces';
     X:='0';
  end;

  If when2='ETIQUETA NO EXISTE' then
  Begin
     consider:='Etiqueta';
     found:='[X] veces';
     X:='0';
  end;

  If when2='ETIQUETA EXISTE' then
  Begin
     consider:='Etiqueta';
     found:='MAS de [X] veces';
     X:='0';
  end;

  If when2='ETIQUETA/VALOR EXISTEN' then
  Begin
     consider:='Etiqueta y Valor';
     found:='MAS de [X] veces';
     X:='0'
  end;
end;

Procedure TMyUtils.ProcesaPDFReport(StringGrid1:TStringGrid; CopyFonts:Boolean;PathFonts:String;PDfReportTXT:String);
var
 RCS:TMyRCS;
 I,DirCount:Integer;
 fichero: text;
 rutabase:String;
 fullpathfonts:string;
 file1, file2, file3, file4, file5, file6:String;
begin
   DirCount:=0;
   RCS:=TMyRCS.Create;
   file1:= RCS.getRCS(RCS.ARIALN_TTF);
   file2:= RCS.getRCS(RCS.COURI_TTF);
   file3:= RCS.getRCS(RCS.COUR_TTF);
   file4:= RCS.getRCS(RCS.MICROSS_TTF);
   file5:= RCS.getRCS(RCS.TIMES_TTF);
   file6:= RCS.getRCS(RCS.VERDANA_TTF);
   //PROCESA GRID FDE (StringGrid1)
   for I:= 1 to StringGrid1.RowCount - 1 do
   Begin
     If StringGrid1.Cells[0,i]='1' then
      Begin
        DirCount+=1;
        assign(fichero, StringGrid1.Cells[2,i]+'WEB-INF\PDFReport.ini');
        rewrite(fichero);
        writeLn(fichero, PDfReportTXT );
        close(fichero);
        If CopyFonts Then
        Begin
          RutaBase:=StringGrid1.Cells[2,i]+'WEB-INF\classes\';
          If (PathFonts[1]='.') or (PathFonts[1]='/') Or (PathFonts[1]='\')
          Then fullpathfonts:=clearDirPath(RutaBase+clearDirPath(PathFonts))
          else fullpathfonts:=clearDirPath(PathFonts);
            CreateDir(fullpathfonts);
            CopyFile(file1,clearFilePath(fullpathfonts+RCS.ARIALN_TTF));
            CopyFile(file2,clearFilePath(fullpathfonts+RCS.COURI_TTF));
            CopyFile(file3,clearFilePath(fullpathfonts+RCS.COUR_TTF));
            CopyFile(file4,clearFilePath(fullpathfonts+RCS.MICROSS_TTF));
            CopyFile(file5,clearFilePath(fullpathfonts+RCS.TIMES_TTF));
            CopyFile(file6,clearFilePath(fullpathfonts+RCS.VERDANA_TTF));
        end;
      end;
   end;
   If FileExists(File1) then DeleteFile(file1);
   If FileExists(File2) then DeleteFile(file2);
   If FileExists(File3) then DeleteFile(file3);
   If FileExists(File4) then DeleteFile(file4);
   If FileExists(File5) then DeleteFile(file5);
   If FileExists(File6) then DeleteFile(file6);
   RCS.Free;
   StringGrid1.Repaint;
   If DirCount=0 then
    begin
        ShowMessage('Debe Seleccionar al menos un directorio');
        Exit;
    end;
   ShowMessage('Proceso Terminado');
end;

Function TMyUtils.getFechaHoraForm(FechaHora:TDateTime;formato:String = 'yyyy-mm-dd';separador:Char='-'):String;
var FS: TFormatSettings;
begin
  FS := DefaultFormatSettings;
  FS.DateSeparator := separador;
  FS.ShortDateFormat := formato;
  Result:=datetostr(FechaHora,FS);
end;

Function TMyUtils.versionStr(ModuloPar, VersionPar, FechaVersionPar:String):String;
var VersionTotal:String;
Begin
  VersionTotal:=Trim(ModuloPar);
  If (Trim(VersionTotal).isEmpty) then VersionTotal:=Trim(VersionPar) else VersionTotal:=Trim(VersionTotal)+' '+Trim(VersionPar);
  If (Trim(VersionTotal).IsEmpty) then VersionTotal:=Trim(FechaVersionPar) else VersionTotal:=Trim(VersionTotal)+' '+Trim(FechaVersionPar);
  Result:=VersionTotal;
end;

Procedure TMyUtils.addItemListBox(var ListBox1:TListBox;NuevoItem:String);
var i :Integer;
begin
  If (Trim(NuevoItem).IsEmpty) Then Exit;
  for i := 0 to ListBox1.Items.Count-1 do
  Begin
    If (UpperCase(Trim(ListBox1.Items[i]))=UpperCase(Trim(NuevoItem)))
    Then Begin ListBox1.Items.Delete(i); break; end;
  end;
  ListBox1.Items.Add(Trim(NuevoItem));
  for i := 0 to ListBox1.Items.Count-1 do
  Begin
    If ListBox1.Items[i]=Trim(NuevoItem) then Begin ListBox1.Selected[i]:=True; exit; end;
  end;

end;

Procedure TMyUtils.delItemListBox(var ListBox1:TListBox;delItem:String);
var i:Integer;
begin
  for i := 0 to ListBox1.Items.Count-1 do
     Begin
        If Trim(delItem)= Trim(ListBox1.Items[i]) Then Begin ListBox1.Items.Delete(i); Exit; end;
     end;
end;

Procedure TMyUtils.applyDataSource(var EditJdbcDataSource,EditResRefName:TEdit;ItemIndex:Integer;DefaultJdbcDataSource,DefaultResRefName:String);
   var VarGlo:TGlobales;
begin
  Varglo:=TGlobales.Create;
   case ItemIndex of
   0: Begin
       EditJdbcDataSource.Text:=VarGlo.DSJdbcDataSource;
       EditResRefName.Text:=Varglo.DSResRefName;
      End; //Ultimo aplicado

   {1: Begin
      EditJdbcDataSource;
      End;//Actual }

   2: Begin
       EditJdbcDataSource.Text:='java:/comp/env/jdbc/sigasoracle';
       EditResRefName.Text:='jdbc/sigasoracle';
      End;//Oracle

   3: Begin EditJdbcDataSource.Text:='java:/comp/env/jdbc/sigassql';
       EditResRefName.Text:='jdbc/sigassql';
      End;//SQL

   4: Begin EditJdbcDataSource.Text:='jdbc/CGU';
       EditResRefName.Text:='jdbc/CGU';
      End;//PJUD
   else
       Begin
          EditJdbcDataSource.Text:=DefaultJdbcDataSource;
          EditResRefName.Text:=DefaultResRefName;
       end;
   end;
   Varglo.Free;
end;

Procedure TMyUtils.getDataSource(pathwebxml,pathclientcfg,GxVersion,Modulo:String;var EDITJDBC, EDITresref:TEdit);
var myxml:TMyxml;
 txttmp,SectionINI:String;
 ex:Boolean;
 iniFile:TIniFile;
Begin
  EDITresref.Text:='';
  //RES-REF-NAME
  If FileExists(pathwebxml) Then
  Begin
    myXml:=TMyXml.create(pathwebxml);
    txttmp:=MyXml.getValueTagTXT('<resource-ref>','</resource-ref>',ex);
    If ex Then
    Begin
      EDITresref.Text:=MyXml.getValueTagTXT('<res-ref-name>','</res-ref-name>',txttmp,ex);
    end;
    myXml.Free;
  end;
  //JDBC_DATASOURCE
  EDITJDBC.Text:='';
  If FileExists(pathclientcfg) Then
  Begin
    If GxVersion='16' Then SectionINI:=Trim(LowerCase('com.'+Trim(Modulo))+'|DEFAULT') else SectionINI:='default|DEFAULT';
    IniFile:=TIniFile.Create(pathclientcfg);
    EDITJDBC.Text:= IniFile.ReadString(SectionINI,'JDBC_DATASOURCE','');
    IniFile.Free;
  end;

end;

Procedure TMyUtils.updDataSource(StringGrid1:TStringGrid);
var webxmlcontent, pathxml, pathclientcfg:String;
 CS_DBNAME,USER_ID,USER_PASSWORD,JDBC_DRIVER,DB_URL,USE_JDBC_DATASOURCE,JDBC_DATASOURCE:String;
 varGlo:TGlobales;
 WebXml:TMyXml;
 ClientCfg:TIniFile;
 I, DirCount:Integer;
 ok:Boolean;
 SS:TStringList;
 SectionINI:String;
 GxVersion,Modulo:String;
Begin
  DirCount:=0;
  for I:= 1 to StringGrid1.RowCount - 1 do
  Begin
    If StringGrid1.Cells[0,i]='1' then
     Begin
       DirCount+=1;
     end;
  end;
  If DirCount<1 Then
  begin
    MessageDlg ('', 'Selecciona al menos un directorio', mtError, [mbOK],0);
    exit;
  end;
  webxmlcontent:='';
  varGlo:=TGlobales.Create;
  webxmlcontent:=#13#10#9#9'<description>'+varGlo.DSDescription+'</description>'#13#10;
  webxmlcontent:=webxmlcontent+#9#9'<res-ref-name>'+varGlo.DSResRefName+'</res-ref-name>'#13#10;
  webxmlcontent:=webxmlcontent+#9#9'<res-type>'+varGlo.DSResType+'</res-type>'#13#10;
  webxmlcontent:=webxmlcontent+#9#9'<res-auth>'+varGlo.DSResAuth+'</res-auth>'#13#10;
  CS_DBNAME:='';
  USER_ID:='';
  USER_PASSWORD:='';
  JDBC_DRIVER:='';
  DB_URL:='';
  USE_JDBC_DATASOURCE:=IntToStr(varGlo.DSUseJdbcDatasource);
  JDBC_DATASOURCE:=Varglo.DSJdbcDataSource;
  varGlo.Free;
  //==========================================
  dirCount:=0;
  for I:= 1 to StringGrid1.RowCount - 1 do
   Begin
     If StringGrid1.Cells[0,i]='1' then
      Begin
        DirCount+=1;
        //Web.xml
        pathxml:=StringGrid1.Rows[I][7];
        WebXml:=TMyXml.create(pathxml);
        ok:=WebXml.ReplaceValueTXT('<resource-ref>','</resource-ref>',webxmlcontent);
        If Not ok then ok:=WebXml.InsertWhitPostRefTXT('</web-app>','<resource-ref>'+webxmlcontent+'</resource-ref>');
        WebXml.Free;
        //Client.Cfg
        pathclientcfg:=StringGrid1.Rows[I][6];
        If FileExists(pathclientcfg) then
        Begin
             GxVersion:=StringGrid1.Rows[I][8];
             Modulo:=StringGrid1.Rows[I][4];
             If GxVersion='16' Then SectionINI:=Trim(LowerCase('com.'+Trim(Modulo))+'|DEFAULT') else SectionINI:='default|DEFAULT';
             ClientCFG:=TIniFile.Create(pathclientcfg);
             ClientCFG.WriteString(SectionINI,'CS_DBNAME',CS_DBNAME);
             ClientCFG.WriteString(SectionINI,'USER_ID',USER_ID);
             ClientCFG.WriteString(SectionINI,'USER_PASSWORD',USER_PASSWORD);
             ClientCFG.WriteString(SectionINI,'JDBC_DRIVER',JDBC_DRIVER);
             ClientCFG.WriteString(SectionINI,'DB_URL',DB_URL);
             ClientCFG.WriteString(SectionINI,'USE_JDBC_DATASOURCE',USE_JDBC_DATASOURCE);
             ClientCFG.WriteString(SectionINI,'JDBC_DATASOURCE',JDBC_DATASOURCE);
             ClientCfg.Free;
             SS := TStringList.Create;
             SS.LoadFromFile(pathclientcfg);
             SS.Text:=StringReplace(SS.Text, #13#10#13#10, #13#10,[rfReplaceAll]);
             SS.SaveToFile(pathclientcfg);
             SS.Free;
        end;
      end;
   end;
   MessageDlg ('', 'Actualización Completa', mtInformation, [mbOK],0);
end;

function TMyUtils.RunAsAdmin(const Path, Params: string): Boolean;
var
  sei: TShellExecuteInfoA;
begin
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := SizeOf(sei);
  //sei.Wnd := Handle;
  sei.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
  sei.lpVerb := 'runas';
  sei.lpFile := PAnsiChar(Path);
  sei.lpParameters := PAnsiChar(Params);
  sei.nShow := SW_SHOWNORMAL;
  Result := ShellExecuteExA(@sei);
end;
Procedure TMyUtils.GetClientCfgPathModuleGXVersion(BasePath:String;var ClientCfgPath,Module,GxVersion:String);
var ClientCfg1:String;
  Directorios: TStringList;
Begin
  //VERSION 10
  Module:=getModuleName(LastDirName(BasePath));
  GxVersion:='10';
  If FileExistsUTF8(clearFilePath(BasePath+'WEB-INF\classes\client.cfg')) Then
  ClientCfgPath:=clearFilePath(BasePath+'WEB-INF\classes\client.cfg') Else
  ClientCfgPath:='';

  //VERSION 16
  IF Not FileExistsUTF8(ClientCfgPath) Then
  Begin
    Directorios:=TStringList.Create;
    FindAllDirectories(Directorios, clearDirPath(BasePath+'WEB-INF\classes\com'), False);
    If Directorios.Count=1 then
    Begin
      Module:= LastDirName(Directorios[0]);
      GxVersion:='16';
      ClientCfg1:= clearFilePath(clearDirPath(Directorios[0])+'client.cfg');
      If FileExistsUTF8(ClientCfg1) then ClientCfgPath:=ClientCfg1;
    end;
    Directorios.Free;
  end;
end;

end.

//====================================== ZIPPER
  // AZipper := TZipper.Create;
  // AZipper.Filename := FilePath;
  // DeleteFile(FilePath);
  // DeleteFile(FilePath.Substring(0,(FilePath.Length-4))+'.tmp');
  // DirList:=TstringList.Create;
  // try
  //   //Agrega Directorios =====
  //   DirList:=FindAllDirectories(RutaBase);
  //   for i:=0 to pred(DirList.Count) do
  //       Begin
  //         AZipper.Entries.AddFileEntry(DirList[i],DirList[i].Substring(RutaBase.Length));
  //         Application.ProcessMessages;
  //       end;
  //   //Agrega Archivos =====
  //   FileList:=FindAllFiles(RutaBase);
  //   for i:=0 to pred(FileList.Count) do
  //       Begin
  //         AZipper.Entries.AddFileEntry(FileList[i],FileList[i].Substring(RutaBase.Length));
  //       end;
  //   AZipper.ZipAllFiles;
  // finally
  //   FileList.Free;
  //   AZipper.Free;
  // end;
  // end;
  //======================================

