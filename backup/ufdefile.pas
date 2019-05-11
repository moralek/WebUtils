unit UFdeFile;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IniFiles, Dialogs, RichMemo, UMyUtils, Graphics,
  LazFileUtils,fileutil,UGlobales,Grids,ValEdit,ExtCtrls,LCLType,Forms,
  ComCtrls,DOM, XMLRead;
type
  TFdeFile=class
private
  QErrores:Integer;
  VarGlo:TGlobales;
  Utils:TMyUtils;
  Fila:Integer;
  FindNVeces:Integer;
  CountVeces:Integer;
  Function  getTipo(FilaRead:String):String;
  Function  getDato(FilaRead:String):String;
  Function  MsgInf(Mensaje:String;var Color:Tcolor):String;
  Function  MsgUsr(Mensaje:String; var Color:Tcolor):String;
  Function  MsgOK(DatoOK:String;var Color:Tcolor;DatoAdicional:String=''):String;
  Function  MsgErr(DatoError,Mensaje:String;var Color:Tcolor):String;
  Function  CheckFile(FilePath:String):Boolean;
  Function  CheckDir(DirPath:String):Boolean;
  Procedure ProcesoSubDir(RutaBase,appdir:String;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StatusBar1:TStatusBar);
  Procedure CHKFIL(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
  Procedure CHKDIR(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
  Procedure CLRDIR(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
  Procedure CREDIR(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
  Procedure DELFIL(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
  Procedure DELDIR(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
  Procedure SENDMSG(Texto:String;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StatusBar1:TStatusBar;color:Tcolor = clDefault);
  Procedure getNodes(var Doc:TXMLDocument;var webappsNode:TDOMNode;var webxmlNode:TDOMNode);
  Function chkEtiqueta(rutawebxml:String;etiqueta:DOMString):Boolean;
  Function chkEtiquetaValor(rutawebxml:String;etiqueta,valor:DOMString):Boolean;
  Function findEtiChild(Doc:TDOMNodeList;etiqueta:DOMString):Boolean;
  Function findEtiValorChild(Doc:TDOMNodeList;etiqueta,Valor:DOMString):Boolean;

  Function chkEtiquetaTwice(RutaWebXml,etiqueta,when:String;veces:Integer):Boolean;
  Function chkEtiquetaValorTwice(rutaWebXml,etiqueta,Valor,when:String;veces:Integer):Boolean;
  Procedure findEtiChildTwice(Doc:TDOMNodeList;etiqueta:DOMString);
  Procedure findEtiValorChildTwice(Doc:TDOMNodeList;etiqueta,Valor:DOMString);

public
  fdefile:TIniFile;
  fdefilepath:string;
  Constructor create(path:String);
  Procedure Procesar(StringGrid1:TStringGrid;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StatusBar1:TStatusBar);
  Procedure toValuelist(var ValueListEditor1:TValueListEditor);
  Procedure SaveFromValueList(ValueListEditor1:TValueListEditor);
  Procedure SaveFromStringGrid(StringGrid:TStringGrid);
  procedure Free;
  Function getRowCount():Integer;
  Function getRow(index:Integer):String;
  Function getTipoValWEBXML(STRA,STRB:String):String;
  Function getColorWEBXML(TipoMensaje:String):TColor;
end;

implementation
Constructor TFdeFile.create(path:String);
begin
//   inherited;
   QErrores:=0;
   fdefilepath:=path;
   fdefile:=TIniFile.Create(fdefilepath);
   Utils:=TMyUtils.Create;
   VarGlo:=TGlobales.Create;
end;

{ MENSAJES }
//OK: 	  cltGray
//ERROR:  clRed
//INF:	  clNone
//MSGUSR: clBlack
Function TFdeFile.MsgOK(DatoOK:String;var Color:Tcolor;DatoAdicional:String=''):String;
begin
   Color:=clLtGray;
   Result:=Format('%.2d',[Fila])+': ['+DatoOK+'], ok';
   If Not DatoAdicional.IsEmpty then
    Result:=Result+ ', '+DatoAdicional;
end;
Function TFdeFile.MsgErr(DatoError,Mensaje:String;var Color:Tcolor):String;
begin
   QErrores:=QErrores+1;
   Color:=clRed;
   Result:=Format('%.2d',[Fila])+': ['+DatoError+'], '+Mensaje;
end;
Function TFdeFile.MsgUsr(Mensaje:String;var Color:Tcolor):String;
begin
   Color:=clBlack;
   Result:=Format('%.2d',[Fila])+': '+Mensaje;
end;
Function TFdeFile.MsgInf(Mensaje:String;var Color:Tcolor):String;
begin
   Color:=clNone;
   Result:=Format('%.2d',[Fila])+': '+Mensaje;
end;
//---------------------------------------------------------------------------
Function TFdeFile.getTipo(FilaRead:String):String;
begin
   Filaread:=Trim(FilaRead);
   Result:=FilaRead.Substring(0,6).ToUpper;
end;
Function TFdeFile.getDato(FilaRead:String):String;
begin
   Filaread:=Trim(FilaRead);
   Result:=Trim(FilaRead.Substring(7));
end;

Function TFdeFile.getTipoValWEBXML(STRA,STRB:String):String;
var STRA2,STRB2:String;
begin
//===============
   STRA2:=UpperCase(Trim(STRA));
   Result:='ETIQ';
   If STRA2 = 'ETIQUETA Y VALOR' Then Result:='ETVA';
//===============
   STRB2:=UpperCase(Trim(STRB));
   case STRB2 of
   'MENOS O MAS DE [X] VECES': Result:=Result+'<>';
   'MAS DE [X] VECES': Result:=Result+'>>';
   'MENOS DE [X] VECES': Result:=Result+'<<';
   else Result:=Result+'==';
   end;
end;

Function TFdeFile.getColorWEBXML(TipoMensaje:String):TColor;
var STR2:String;
begin
   STR2:=UpperCase(Trim(TipoMensaje));
   Result:=clLtGray;
   case STR2 of
   'ERROR (ROJO)'       : Result:=clRed;
   'ADVERTENCIA (AZUL)' : Result:=clBlue;
 end;
end;

Procedure TFdeFile.Procesar(StringGrid1:TStringGrid;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StatusBar1:TStatusBar);
var
 I,DirCount:Integer;
begin
   QErrores:=0;
   DirCount:=0;
   SENDMSG('Inicio ('+TimeToStr(Time)+')',Memo,TrayIcon1,StatusBar1);

   //PROCESA GRID FDE (StringGrid1)
   for I:= 1 to StringGrid1.RowCount - 1 do
   Begin
     If StringGrid1.Cells[0,i]='1' then
      Begin
        DirCount+=1;
        ProcesoSubDir(Utils.clearDirPath(StringGrid1.Cells[2,i]),StringGrid1.Cells[4,i],Memo,TrayIcon1,StatusBar1);
      end;
   end;

   If DirCount=0 then
    begin
    QErrores:=QErrores+1;
    SENDMSG('Ningun Directorio Seleccionado.',Memo,TrayIcon1,StatusBar1,clRed);
    end;
   SENDMSG('___________________________________',Memo,TrayIcon1,StatusBar1,clBlue);
   SENDMSG('Fin ('+TimeToStr(Time)+'), '+QErrores.ToString()+' error(es).',Memo,TrayIcon1,StatusBar1);
   If VarGlo.Beep Then Beep;
end;

Procedure TFdeFile.ProcesoSubDir(RutaBase,appdir:String;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StatusBar1:TStatusBar);
var
 count,i,x,valueX:LongInt;
 FilaRead, DatoRead, TipoRead, mensaje:String;
 Color: TColor;
 webappsNode,webxmlNode:TDOMNode;
 RutaXMl, rutawebxml, found2:String;
 tag,value,consider,found,msgtxt,msgcolor,valx,when:AnsiString;
 Doc:TXMLDocument;
 ShowMsg:Boolean;
begin
   RutaXMl:= VarGlo.FdeFilePath;
   Fila:=0;
   Color:=clDefault;
   SENDMSG('___________________________________',Memo,TrayIcon1,StatusBar1,clBlue);
   SENDMSG('Procesando .\'+Utils.LastDirName(RutaBase),Memo,TrayIcon1,StatusBar1,clBlue);
   Doc := TXMLDocument.Create;
   ReadXMLFile(Doc, RutaXMl);
   getNodes(Doc,webappsNode,webxmlNode);
   //==============================================
   //              WEBAPPS Node
   //==============================================
   If webappsNode<>nil Then
   Begin
     DatoRead:='';
     TipoRead:='';
     FilaRead:='';
     for x := 0 to WebappsNode.ChildNodes.Count-1 do
     Begin
      Fila:=Fila+1;
      DatoRead:='';
      TipoRead:=WebappsNode.ChildNodes.Item[x].NodeName;
      If WebappsNode.ChildNodes.Item[x].ChildNodes.Count>0 then DatoRead:=WebappsNode.ChildNodes.Item[x].FirstChild.NodeValue;
      TipoRead:=UpperCase(Trim(TipoRead));
      //TAGS REPLACEMENT
      DatoRead:=DatoRead.Replace('{MOD}',appdir);
      FilaRead:=TipoRead+'='+DatoRead;
      //Comandos
      Color:=clDefault;
      if (TipoRead='MSGRUN') then Mensaje:=MsgUsr(DatoRead,Color);
      If (Color=clDefault) and (TipoRead.substring(3)='FIL')
          and ((DatoRead[DatoRead.Length]='\') OR (DatoRead[DatoRead.Length]='/')) then
          Mensaje:=MsgErr(FilaRead,'Sintaxis incorrecta archivo .fde',Color);

      If Color=clDefault then
         begin
           DatoRead:=Utils.clearDirPath(DatoRead);
           case TipoRead of
             'CHKFIL': CHKFIL(RutaBase,FilaRead,mensaje,Color);
             'CHKDIR': CHKDIR(RutaBase,FilaRead,mensaje,Color);
             'CLRDIR': CLRDIR(RutaBase,FilaRead,mensaje,Color);
             'CREDIR': CREDIR(RutaBase,FilaRead,mensaje,Color);
             'DELFIL': DELFIL(RutaBase,FilaRead,mensaje,Color);
             'DELDIR': DELDIR(RutaBase,FilaRead,mensaje,Color);
             else Mensaje:=MsgErr(FilaRead,'Sintaxis incorrecta, archivo .fde',Color);
           end;
         end;
      SENDMSG(Mensaje,Memo,TrayIcon1,StatusBar1,Color);
     end;
   end;
   //==============================================
   //              WEBXML Node
   //==============================================

   rutawebxml:=Utils.clearDirPath(RutaBase)+'WEB-INF'+PathDelim+'web.xml';
   Count:=0;
   If FileExists(rutawebxml)=FALSE Then
   begin
     QErrores:=QErrores+1;
     SENDMSG('WEBXML['+count.ToString()+']: No se encuentra archivo web.xml',Memo,TrayIcon1,StatusBar1,clRed);
     exit;
   end;
   If webxmlNode<>Nil Then
       Begin
           for x := 0 to webxmlNode.ChildNodes.Count-1 do //rule
            Begin
              tag:='';value:='';consider:='';found:='';msgtxt:='';msgcolor:='';when:='';
              valueX:=0;
              For i:=0 To webxmlNode.ChildNodes.Item[x].ChildNodes.Count-1 do //tag rules
              begin
                 If webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].ChildNodes.Count>0 Then
                   If webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeName='#text' then
                      case LowerCase(Trim(webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].NodeName)) of
                         'tag':     tag:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                         'value':   value:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                         'consider':consider:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                         'found':   found:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                         'x':       valX:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                         'msgtxt':  msgtxt:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                         'msgcolor':msgcolor:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                         //Old Versions :
                         'when':    Utils.loadOldVar(webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue,consider,found,valX);
                         'msg':     msgtxt:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                         'type':    msgcolor:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                      end;
              end;
              try Valuex:=StrToInt(valX);except on E: Exception do valuex:=0 end;
              when:=getTipoValWEBXML(consider,found);
              Count:=count+1;
              showMSG:=False;
              case (when.Substring(0,4)) of
                 'ETIQ': showMSG:=chkEtiquetaTwice(rutawebxml,tag,when,valueX);
                 'ETVA': showMSG:=chkEtiquetaValorTwice(rutawebxml,tag,value,when,valueX);
              end;
              Color:=clLtGray;
              mensaje:='ok.';
              If showMSG then
               begin
                 color:=getColorWEBXML(msgcolor);
                 If Color=clRed then QErrores:=QErrores+1;

                 //Mensaje por defecto
                 found2:=stringReplace(found , '[X]',  valX ,[rfReplaceAll, rfIgnoreCase]);
                 If (when.Substring(0,4)) = 'ETIQ' then found2:=consider+'<'+tag+'> se encuentra '+found2 else found2:=consider+'(<'+tag+'>'+value+') se encuentra '+found2;

                 //si mensaje viene vacio , usa el mensaje por defecto
                 mensaje:=msgtxt;
                 If (Trim(mensaje)).IsEmpty then mensaje:=found2;

                 //reemplaza palabras clave
                 mensaje:=StringReplace(mensaje,'{M}',found2,[rfReplaceAll]);
                 mensaje:=StringReplace(mensaje,'{Q}',CountVeces.ToString,[rfReplaceAll]);
               end;
             if (showMSG=True and VarGlo.MostrarERR) Or
                (showMSG=False and Varglo.MostrarOK) then
                 SENDMSG('WEBXML['+count.ToString()+']:'+mensaje,Memo,TrayIcon1,StatusBar1,color);
            end;
       end;
   Doc.Free;
end;

Function TFdeFile.CheckFile(FilePath:String):Boolean;
var
 Archivos: TStringList;
begin
 Archivos := TStringList.Create;
 FindAllFiles(Archivos, ExtractFilePath(FilePath), ExtractFileName(FilePath), false);
 Result:=(Archivos.Count>0);
 Archivos.Free;
end;

Function TFdeFile.CheckDir(DirPath:String):Boolean;
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
    DirPath:=Utils.clearDirPath(DirPath);
    Result:=DirectoryExists(DirPath);
  end;
  Directorios.Free;
end;

Procedure TFdeFile.CHKFIL(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
var
 FilePath:String;
begin
 FilePath:=Utils.clearFilePath(RutaBase+getDato(FilaRead));
 If CheckFile(FilePath) then
    Mensaje:=MsgOK(FilaRead,Color)
 else
    Mensaje:=MsgErr(FilaRead,'No Encontrado.',Color);
end;
Procedure TFdeFile.CHKDIR(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
var
 FilePath:String;
begin
 FilePath:=Utils.clearFilePath(RutaBase+getDato(FilaRead));
 If CheckDir(FilePath)=True then
    Mensaje:=MsgOK(FilaRead,Color)
 else
    Mensaje:=MsgErr(FilaRead,'No Encontrado.',Color);
end;

Procedure TFdeFile.CLRDIR(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
var
 FilePath,fileshort:String;
 cta1,cta2,Resp:Integer;
 Archivos:TStringList;
begin
 FilePath:=Utils.clearDirPath(RutaBase+getDato(FilaRead));

 If (Not(DirectoryExists(FilePath))) then
 begin
   Mensaje:=MsgErr(FilaRead,'Directorio no Existe',Color);
   exit;
 end;

 Archivos := TStringList.Create;
 FindAllFiles(Archivos, FilePath, '*.*', true);
 Cta1:=Archivos.Count;
 Archivos.Free;

 FileShort:=FilePath.Substring(RutaBase.Length);
 If VarGlo.ClearMemo Then
     Resp := Application.MessageBox(Pchar('Desea LIMPIAR la Carpeta:'+sLineBreak+fileshort), '', (MB_ICONQUESTION + MB_OKCANCEL))
 else
     Resp:=IDOK;
 If (Resp=IDOK) Then DeleteDirectory(FilePath,true);

 Archivos := TStringList.Create;
 FindAllFiles(Archivos, FilePath, '*.*', true);
 Cta2:=Archivos.Count;
 Archivos.Free;

 If cta2<>0
     then Mensaje:=MsgErr(FilaRead,'No se pudo limpiar directorio, intente manualmente.',Color)
     else Mensaje:=MsgOK(FilaRead,Color,Cta1.ToString+' Eliminados');
end;
Procedure TFdeFile.CREDIR(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
var
 FilePath:String;
 Cta:integer;
begin
  Cta:=0;
  FilePath:=Utils.clearDirPath(RutaBase+getDato(FilaRead));
  IF Not Utils.CheckNoMaskName(FilePath) then
   Begin
     Mensaje:=MsgErr(FilaRead,'Nombre No Valido',color);
     Exit;
   end;
   If Not DirectoryExists(FilePath) Then
    Begin
       CreateDir(FilePath);
       Cta:=1;
    end;

   If DirectoryExists(FilePath) Then
      Mensaje:=MsgOK(FilaRead,Color,Cta.ToString+' Creado(s)')
   else
      Mensaje:=MsgErr(FilaRead,'No se Pudo Crear Directorio',Color);
end;

Procedure TFdeFile.DELFIL(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
var
 FilePath,FileShort:String;
 Archivos: TStringList;
 Resp,i,cta:Integer;
 IsOk:Boolean;
begin
 Cta:=0;
 IsOk:=True;
 FilePath:=Utils.clearFilePath(RutaBase+getDato(FilaRead));

 //Busqueda Por Patron
 If (FilePath.IndexOf('*')>-1) Or (FilePath.IndexOf('?')>-1) then
  begin
     Archivos := TStringList.Create;
     FindAllFiles(Archivos, ExtractFilePath(FilePath), ExtractFileName(FilePath), false);
     Cta:=Archivos.Count;
     for i := 0 to Archivos.Count - 1 do
     begin
       FileShort:=Archivos[i].Substring(RutaBase.Length);
       If VarGlo.ConfirmDel Then
         Resp := Application.MessageBox(PCHar('Desea Eliminar el archivo:'+sLineBreak+FileShort), '', (MB_ICONQUESTION + MB_OKCANCEL))
       else
         Resp:=IDOK;
       If (Resp=IDOK) Then DeleteFile(Archivos[i]);
     end;
     Archivos.Clear;
     FindAllFiles(Archivos, ExtractFilePath(FilePath), ExtractFileName(FilePath), false);
     IsOk:=(Archivos.Count=0);
     ArChivos.Free;
  end
 else
 Begin
 //Busqueda Directa
 If FileExists(FilePath) Then
  Begin
   Cta:=1;
   FileShort:=FilePath.Substring(RutaBase.Length);
   If VarGlo.ConfirmDel Then
     Resp := Application.MessageBox(PCHar('Desea Eliminar el archivo:'+sLineBreak+FileShort), '', (MB_ICONQUESTION + MB_OKCANCEL))
   else
     Resp:=IDOK;
   If (Resp=IDOK) Then DeleteFile(FilePath);
   IsOk:=Not(FileExists(FilePath));
  end;
 end;
 //Comprobación
   If IsOk Then
    Mensaje:=MSGOK(FilaRead,Color,cta.ToString+' Eliminado(s).')
   else
    Mensaje:=MsgErr(FilaRead,'No fue posible eliminar el(los) archivo(s).',Color);
 end;

Procedure TFdeFile.DELDIR(RutaBase,FilaRead:String; var Mensaje:String; var Color:TColor);
var
 FilePath:String;
 Resp,Cta:Integer;
begin
 Cta:=0;
 FilePath:=Utils.clearDirPath(RutaBase+getDato(FilaRead));
 If DirectoryExists(FilePath) then
  begin
    Cta:=1;
    If VarGlo.ConfirmDel Then
       Resp := Application.MessageBox(PChar('Desea Eliminar el Directorio:'+sLineBreak+FilePath), '', (MB_ICONQUESTION + MB_OKCANCEL))
    else
       Resp:=IDOK;
    If (Resp=IDOK) Then DeleteDirectory(FilePath,False);
  end;

 If DirectoryExists(FilePath) Then
    Mensaje:=MsgErr(FilaRead,'No se pudo eliminar el directorio',Color)
 else
    Mensaje:=MsgOK(FilaRead,Color,Cta.ToString+' Eliminado(s).');
end;
Procedure TFdeFile.SENDMSG(Texto:String;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StatusBar1:TStatusBar;color:Tcolor = clDefault);
var Mostrar : Boolean;
Begin
  Mostrar:=True;
  If (color=clLtGray ) and ((Varglo.MostrarOK) = False) then Mostrar:=False;
  If (color=clRed )    and ((Varglo.MostrarERR)= False) then Mostrar:=False;
  IF (color=clBlack )  and ((Varglo.MostrarMSJ)= False) then Mostrar:=False;
  If  Mostrar Then Utils.addToRichMemo(Texto,Memo,StatusBar1,color);

  TrayIcon1.Hint:=Texto;
  TrayIcon1.BalloonHint:=Texto;
  StatusBar1.SimpleText:=Texto;
  //TrayIcon1.ShowBalloonHint;
end;

{MANEJADOR DE ARCHIVO FDE}

Function TFdeFile.getRowCount():Integer;
var
 Archivo: TextFile;
 FilaRead:String;
begin
   Result:=0;
   try
    AssignFile(Archivo, fdefilepath);
    ReSet(Archivo);
    while not eof(Archivo) do
    begin
      Result:=Result+1;
      ReadLn(Archivo, FilaRead);
    end;
    CloseFile(Archivo);
   except
      on E: EInOutError do
      ShowMessage('Ha ocurrido un error en el manejo del fichero. Detalles: '+ E.Message);
   end;
end;
Procedure TfdeFile.toValuelist(var ValueListEditor1:TValueListEditor);
var
 Archivo: TextFile;
 FilaRead:String;
begin
   FilaRead:='';
   ValueListEditor1.Clear;
   try
    AssignFile(Archivo, fdefilepath);
    ReSet(Archivo);
    while not eof(Archivo) do
    begin
      ReadLn(Archivo, FilaRead);
      ValueListEditor1.Strings.Add(FilaRead);
    end;
    CloseFile(Archivo);
   except
      on E: EInOutError do
      ShowMessage('Ha ocurrido un error en el manejo del fichero. Detalles: '+ E.Message);
   end;
end;

Function TFdeFile.getRow(index:Integer):String;
var
 Archivo: TextFile;
 i:integer;
 FilaRead:String;
begin
   I:=0;
   Result:='';
   try
    AssignFile(Archivo, fdefilepath);
    ReSet(Archivo);
    while not eof(Archivo) do
    begin
      I:=I+1;
      ReadLn(Archivo, FilaRead);
      if I=Index Then
       Begin
         Result:=FilaRead;
         break;
       end;
    end;
    CloseFile(Archivo);
   except
      on E: EInOutError do
      ShowMessage('Ha ocurrido un error en el manejo del fichero. Detalles: '+ E.Message);
   end;
end;
Procedure TFdeFile.SaveFromValueList(ValueListEditor1:TValueListEditor);
var
 Archivo: TextFile;
 i,x:Integer;
 Tienedatos:Boolean;
begin
   fdefile:=TIniFile.Create(fdefilepath);
   fdefile.Free;
   try
    AssignFile(Archivo,Utils.clearFilePath(FdeFilePath));
    Rewrite(Archivo);
    x:=(ValueListEditor1.RowCount-2);
    TieneDatos:=Not Trim(ValueListEditor1.Strings.Text).IsEmpty;
    If (TieneDatos) Then
    For i:=0 to x do
     begin
       WriteLn(Archivo,ValueListEditor1.Strings[(i)]);
     end;
    CloseFile(Archivo);
    fdefile:=TIniFile.Create(fdefilepath);
   except
      on E: EInOutError do
      ShowMessage('Ha ocurrido un error en el manejo del fichero. Detalles: '+ E.Message);
     on E: Exception do
      ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
   end;
end;

Procedure TFdeFile.SaveFromStringGrid(StringGrid:TStringGrid);
var
 Archivo: TextFile;
 i,x:Integer;
 Tienedatos:Boolean;
begin
   fdefile.Free;
   try
    AssignFile(Archivo,Utils.clearFilePath(FdeFilePath));
    Rewrite(Archivo);
    x:=(StringGrid.RowCount-1);
    TieneDatos:=Not (StringGrid.RowCount<=1);
    If (TieneDatos) Then
    For i:=1 to x do
     begin
       WriteLn(Archivo,trim(StringGrid.Cells[1,i])+'='+Trim(StringGrid.Cells[2,i]));
     end;
    CloseFile(Archivo);
    fdefile:=TIniFile.Create(fdefilepath);
   except
      on E: EInOutError do
      ShowMessage('Ha ocurrido un error en el manejo del fichero. Detalles: '+ E.Message);
     on E: Exception do
      ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
   end;
end;

Procedure TFdeFile.Free();
begin
   fdefile.Free;
   Utils.Free;
   VarGlo.Free;
end;

Procedure TFdeFile.getNodes(var Doc:TXMLDocument;var webappsNode:TDOMNode;var webxmlNode:TDOMNode);
var x:Integer;
begin
  try
      If (UpperCase(Trim(Doc.DocumentElement.NodeName))<>'RULES') then Exit;
      If (Doc.DocumentElement.ChildNodes.Count=0) Then Exit;
      for x := 0 to Doc.DocumentElement.ChildNodes.Count-1 do
      begin
        If UpperCase(Trim(Doc.DocumentElement.ChildNodes.Item[x].NodeName))='WEBAPPSRULES'   then
          webappsNode:=Doc.DocumentElement.ChildNodes.Item[x];
        If UpperCase(Trim(Doc.DocumentElement.ChildNodes.Item[x].NodeName))='WEBXMLRULES' then
          webxmlNode:=Doc.DocumentElement.ChildNodes.Item[x];
      end;
  Except
    on E:Exception do Exit;
  end;
end;

Function TFdeFile.chkEtiquetaValor(rutaWebXml:String;etiqueta,Valor:DOMString):Boolean;
var
  tagxml,valclean:DOMString;
  Doc :  TXMLDocument;
begin
  valclean:=UpperCase(Trim(Valor));
  Result:=False;
  Doc := TXMLDocument.Create;
  ReadXMLFile(Doc, rutaWebXml);
  tagxml:=Doc.DocumentElement.NodeName;
  If Doc.DocumentElement.ChildNodes.Count>0 then
     If Doc.DocumentElement.FirstChild.NodeName='#text' then
           Result:= (tagxml=etiqueta) and (Doc.DocumentElement.FirstChild.NodeValue=valclean);
        If Result then exit;
        Result:=findEtiValorChild(Doc.DocumentElement.ChildNodes,etiqueta,valclean);
        If Result then exit;
  Doc.Free;
end;

Function TFdeFile.findEtiValorChild(Doc:TDOMNodeList;etiqueta,Valor:DOMString):Boolean;
var i:Integer;
begin
  Result:=False;
  for i := 0 to (Doc.Count - 1) do
  begin
    Result:=False;
    if doc.Item[i].NodeName<>'#text' then
       if doc.Item[i].ChildNodes.Count>0 then
          If Doc.Item[i].FirstChild.NodeName='#text' then
             Result:=(doc.Item[i].NodeName=etiqueta) and (uppercase(doc.Item[i].FirstChild.NodeValue)=valor);
          If Result Then exit;
          Result:=findEtiValorChild(doc.Item[i].ChildNodes,etiqueta,Valor);
          If Result Then exit;
  end;
end;

Function TFdeFile.chkEtiqueta(RutaWebXml:String;etiqueta:DOMString):Boolean;
var Doc :  TXMLDocument;
begin
  result:=False;
  Doc := TXMLDocument.Create;
  ReadXMLFile(Doc, RutaWebXml);
  Result:=Assigned(Doc.DocumentElement.FindNode(etiqueta));
  if Result then exit;
  Result:=findetichild(doc.DocumentElement.ChildNodes,etiqueta);
  Doc.Free;
end;

Function TFdeFile.findEtiChild(Doc:TDOMNodeList;etiqueta:DOMString):Boolean;
var i:Integer;
begin
  Result:=False;
  for i := 0 to (Doc.Count - 1) do
  begin
    if doc.Item[i].NodeName<>'#text' then
       Result:=doc.Item[i].NodeName=etiqueta;
       If Result then exit;
       If doc.Item[i].ChildNodes.Count>0 then Result:=findEtiChild(doc.Item[i].ChildNodes,etiqueta);
       If Result then exit;
  end;
end;

Function TFdeFile.chkEtiquetaTwice(RutaWebXml,etiqueta,when:String;veces:Integer):Boolean;
var
  Doc :  TXMLDocument;
begin
  Result:=False;
  FindNVeces:=veces;
  CountVeces:=0;
  Doc := TXMLDocument.Create;
  ReadXMLFile(Doc, rutaWebXml);
  If (Doc.DocumentElement.NodeName=etiqueta) then CountVeces:=CountVeces+1;
  If Doc.DocumentElement.ChildNodes.Count>0 then findEtiChildTwice(Doc.DocumentElement.ChildNodes,etiqueta);
   //CREA RESULT
   case when.Substring(4,4) of
     '<>': Result:= (CountVeces<>FindNVeces);
     '>>': Result:= (CountVeces>FindNVeces);
     '<<': Result:= (CountVeces<FindNVeces);
     else  Result:= (CountVeces=FindNVeces);
   end;
  Doc.Free;
end;

Procedure TFdeFile.findEtiChildTwice(Doc:TDOMNodeList;etiqueta:DOMString);
var i:Integer;
begin
  for i := 0 to (Doc.Count - 1) do
  begin
    If doc.Item[i].NodeName=etiqueta then CountVeces:=CountVeces+1;
    If doc.Item[i].ChildNodes.Count>0 then findEtiChildTwice(doc.Item[i].ChildNodes,etiqueta);
  end;
end;

//CHK Etiqueta y valor por N veces
Function TFdeFile.chkEtiquetaValorTwice(rutaWebXml,etiqueta,Valor,when:String;veces:Integer):Boolean;
var
  tagxml,valclean:DOMString;
  Doc :  TXMLDocument;
  Continuar: Boolean;
begin
  Result:=False;
  FindNVeces:=veces;
  CountVeces:=0;
  valclean:=UpperCase(Trim(Valor));
  Doc := TXMLDocument.Create;
  ReadXMLFile(Doc, rutaWebXml);
  tagxml:=Doc.DocumentElement.NodeName;
  Continuar:=False;

  try
    If Doc.DocumentElement.ChildNodes.Count>0 then
    Begin
      Continuar:=True;
      If Doc.DocumentElement.FirstChild.NodeName='#text' then
      Begin
         if (tagxml=etiqueta) and (Doc.DocumentElement.FirstChild.NodeValue=valclean) then CountVeces:=CountVeces+1;
         Continuar:=Doc.DocumentElement.ChildNodes.Count>1;
      end;
    end;
    If Continuar then findEtiValorChildTwice(Doc.DocumentElement.ChildNodes,etiqueta,valclean);
    Doc.Free;
       //CREA RESULT
       case when.Substring(4,4) of
         '<>': Result:= (CountVeces<>FindNVeces);
         '>>': Result:= (CountVeces>FindNVeces);
         '<<': Result:= (CountVeces<FindNVeces);
         else  Result:= (CountVeces=FindNVeces);
       end;
  except on E: Exception do
    ShowMessage( 'XML mal formado '+ E.ClassName + #13#10 + E.Message );
end;
end;


Procedure TFdeFile.findEtiValorChildTwice(Doc:TDOMNodeList;etiqueta,Valor:DOMString);
var i:Integer;
Continuar: Boolean;
begin
  for i := 0 to (Doc.Count - 1) do
  begin
    Continuar:=False;
    if doc.Item[i].NodeName<>'#text' then        //node valor
       if doc.Item[i].ChildNodes.Count>0 then
        begin
            Continuar:=True;
            If Doc.Item[i].FirstChild.NodeName='#text' then
            Begin
               If ((doc.Item[i].NodeName=etiqueta) and (uppercase(doc.Item[i].FirstChild.NodeValue)=valor)) then CountVeces:=CountVeces+1;
               Continuar:=doc.Item[i].ChildNodes.Count>1;
            end;
        end;
      If Continuar then findEtiValorChildTwice(doc.Item[i].ChildNodes,etiqueta,Valor);
  end;
end;

end.

