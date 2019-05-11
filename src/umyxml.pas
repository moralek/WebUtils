unit UMyXml;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, DOM, XMLRead, XMLWrite, Grids, LCLIntf, strutils;

type
  TMyXml=class

private
  Function getXmlContent():String;
  Procedure ClearSGrid(var StringGrid1:TStringGrid);
  Procedure addNodeWithtxt(var Doc:TXMLDocument;var ParentNode: TDOMNode; childnodename:String; valor:String='');
  Procedure loadWebappsGrid(var WebappsNode:TDOMNode; var StringGrid1:TStringGrid;filterWebapps:String);
  Function getValchild(Doc:TDOMNodeList;etiqueta:DOMString;var existe:boolean):String;
  Procedure loadOldVar(when:String;var consider:String;var found:String;var X:String);
  Function SaveFullTxtToXml(TXTXml:String):Boolean;

Public
  pathxml:String;
  Property ContentXml:String read getXmlContent;

  Constructor create(path:String);

  Procedure loadWebxmlGrid(var WebxmlNode:TDOMNode;var StringGrid1:TStringGrid);
  Function Validaxml():Boolean;
  Procedure ClearAll(var Memo1:TMemo;var webappsGrid,webxmlGrid:TStringGrid);
  Procedure Save2Grids(var Memo1:TMemo;var webappsGrid,webxmlGrid:TStringGrid);
  Procedure load2Grids(var Memo1:TMemo;var webappsGrid,webxmlGrid:TStringGrid;FilterWebapps:String);
  Function chkEtiVal(rutaWebXml:String;etiqueta,Valor:DOMString):Boolean;
  Function findEtiValorChild(Doc:TDOMNodeList;etiqueta,Valor:DOMString):Boolean;

  //Busqueda, Inserción TXT
  Function getValueTagTXT(nodeopen,nodeclose:String;var ex:boolean):String; //select
  Function getValueTagTXT(nodeopen,nodeclose,TXTxml:String;var ex:boolean):String;
  Function ReplaceValueAndTagTXT(nodeopen,nodeclose,value:String):Boolean; //update
  Function ReplaceValueTXT(nodeopen,nodeclose,value:String):Boolean;
  Function InsertWhitPrevRefTXT(refPrev,value:String):Boolean;
  Function InsertWhitPostRefTXT(refPost,value:String):Boolean;
  //insertPost

end;


implementation
Constructor TMyXml.create(path:String);
begin
  pathxml:=path;
end;

Function TMyXml.getXmlContent():String;
var SS:TStringList;
begin
  Result:='';
  If Not FileExists(pathxml) Then exit;
  SS := TStringList.Create;
  SS.LoadFromFile(pathxml);
  Result:= SS.Text;
  SS.Free;
end;

Function TMyXml.SaveFullTxtToXml(TXTXml:String):Boolean;
var SS:TStringList;
Begin
  If Not(FileExists(pathxml)) then Exit(False);
  Result:=True;
  SS := TStringList.Create;
  SS.LoadFromFile(pathxml);
  SS.Text:=TXTXml;
  SS.SaveToFile(pathxml);
  SS.Free;
end;

Function TMyXml.Validaxml():Boolean;
var Doc : TXMLDocument;
    FileNode,WebxmlNode: TDOMNode;
    x,MaxNodos:LongInt;
begin
  If (Not(FileExists(pathxml))) Then Exit(False);
  MaxNodos:=2;
  Doc := TXMLDocument.Create;
  try
      ReadXMLFile(Doc, pathxml);
      //----------------------------------------------------::::::::VALIDACIONES
      If (UpperCase(Trim(Doc.DocumentElement.NodeName))<>'RULES') then Exit(False);
      If (Doc.DocumentElement.ChildNodes.Count=0) Then Exit(True);
      If (Doc.DocumentElement.ChildNodes.Count>MaxNodos) Then Exit(False);
      for x := 0 to Doc.DocumentElement.ChildNodes.Count-1 do
      begin
        If UpperCase(Trim(Doc.DocumentElement.ChildNodes.Item[x].NodeName))='WEBAPPSRULES'   then
          FileNode:=Doc.DocumentElement.ChildNodes.Item[x];
        If UpperCase(Trim(Doc.DocumentElement.ChildNodes.Item[x].NodeName))='WEBXMLRULES' then
          begin
               WebxmlNode:=Doc.DocumentElement.ChildNodes.Item[x];
          end;
      end;
      If (FileNode = nil) and (WebxmlNode=Nil) then Exit(False);
      If ((FileNode = nil) Or (WebxmlNode=Nil)) and (Doc.DocumentElement.ChildNodes.Count=2) then Exit(False);
      //------------------------------------------------------------------------
  Except
    on E:Exception do Exit(False);
  end;
    Doc.Free;
    Result:=True;
end;

Procedure TMyXml.ClearAll(var Memo1:TMemo;var webappsGrid,webxmlGrid:TStringGrid);
begin
 Memo1.Clear;
 ClearSGrid(webappsGrid);
 ClearSGrid(webxmlGrid);
end;

Procedure TMyXml.save2Grids(var Memo1:TMemo;var webappsGrid,webxmlGrid:TStringGrid);
var rulenode,WebappsNode,WebxmlNode: TDOMNode;
    Doc :  TXMLDocument;
    x:Integer;
    RootNode :TDOMNode;
Begin
 Doc := TXMLDocument.Create;
 // Nodo Base
 RootNode := Doc.CreateElement('rules');
 TDOMElement(RootNode).SetAttribute('title', Memo1.Text);
 TDOMElement(RootNode).SetAttribute('date', formatdatetime('yyyy-mm-dd',Now));
 Doc.Appendchild(RootNode);

 //Crea webappsRules
 RootNode:= Doc.DocumentElement;
 WebappsNode := Doc.CreateElement('webappsRules');
 RootNode.Appendchild(WebappsNode);
 for x:=1 to webappsGrid.RowCount-1 do
 begin
   addNodeWithtxt(Doc,WebappsNode,webappsGrid.Cells[1,x],webappsGrid.Cells[2,x]);
 end;

 //Crea WebXmlRules
 RootNode:= Doc.DocumentElement;
 WebxmlNode := Doc.CreateElement('webxmlrules');
 RootNode.Appendchild(WebxmlNode);

 For x:=1 to webxmlGrid.RowCount-1 do
 begin
   rulenode:=Doc.CreateElement('rule');
   addNodeWithtxt(Doc,rulenode,'tag',webxmlGrid.Cells[1,x]);
   addNodeWithtxt(Doc,rulenode,'value',webxmlGrid.Cells[2,x]);
   addNodeWithtxt(Doc,rulenode,'consider',webxmlGrid.Cells[3,x]);
   addNodeWithtxt(Doc,rulenode,'found',webxmlGrid.Cells[4,x]);
   addNodeWithtxt(Doc,rulenode,'X',webxmlGrid.Cells[5,x]);
   addNodeWithtxt(Doc,rulenode,'msgtxt',webxmlGrid.Cells[6,x]);
   addNodeWithtxt(Doc,rulenode,'msgcolor',webxmlGrid.Cells[7,x]);
   WebxmlNode.AppendChild(rulenode);
 end;
 writeXMLFile(Doc, pathxml);
end;
Procedure TMyXml.load2Grids(var Memo1:TMemo;var webappsGrid,webxmlGrid:TStringGrid;FilterWebapps:String);
  var Doc : TXMLDocument;
      webappsNode,WebxmlNode: TDOMNode;
      index,j,x:Integer;
Begin
  index:=0;
  If Not ((Trim(WebappsGrid.Rows[WebappsGrid.Row][0])).IsEmpty) Then index:=StrToInt(WebappsGrid.Rows[WebappsGrid.Row][0]);
   Doc := TXMLDocument.Create;
   try
      ReadXMLFile(Doc, pathxml);
      Memo1.Text:=Doc.DocumentElement.GetAttribute('title');
      for x := 0 to Doc.DocumentElement.ChildNodes.Count-1 do
      begin
        If UpperCase(Trim(Doc.DocumentElement.ChildNodes.Item[x].NodeName))='WEBAPPSRULES'   then
          WebappsNode:=  Doc.DocumentElement.ChildNodes.Item[x];
        If UpperCase(Trim(Doc.DocumentElement.ChildNodes.Item[x].NodeName))='WEBXMLRULES' then
          WebxmlNode:=Doc.DocumentElement.ChildNodes.Item[x];
      end;
      If (WebappsNode<>Nil) Then loadWebappsGrid(WebappsNode,webappsGrid,FilterWebapps);
      If (WebxmlNode<>NIL) Then loadWebxmlGrid(WebxmlNode,webxmlGrid);
       if (webappsGrid.RowCount>0) Then
        for j := 1 to (webappsGrid.RowCount - 1) do
          begin
            If index = StrToInt(webappsGrid.Rows[j][0]) then
              Begin
                 webappsGrid.Row:=j;
                 webappsGrid.Col:=2;;
                 break;
              end;
          end;
   Except
      on E:Exception do
      ShowMessage('Error en Archivo XML(1)'+ #13#10+'Detalle del Error: '+ E.ClassName + #13#10 + E.Message);
   end;
end;
{=================================================>P R I V A T E <===========================}
Procedure TMyXml.ClearSGrid(var StringGrid1:TStringGrid);
var i:Integer;
Begin
   for i:=1 to StringGrid1.RowCount-1 do
   begin
     StringGrid1.DeleteRow(1);
   end;
end;

Procedure TMyXml.addNodeWithtxt(var Doc :  TXMLDocument; var ParentNode: TDOMNode; childnodename:String; valor:String='');
  var childNode,texto: TDOMNode;
  begin
   childNode:=Doc.CreateElement(childnodename);
   ParentNode.AppendChild(childnode);
   If not trim(valor).IsEmpty then
     begin
      texto:=Doc.CreateTextNode(valor);
      childnode.AppendChild(texto);
     end;
  end;

Procedure TMyXml.loadWebappsGrid(var WebappsNode:TDOMNode;var StringGrid1:TStringGrid;filterWebapps:String);
 var x,index:Integer;
     filter,valorC2:String;
Begin
  filter:=UpperCase(filterWebapps);
  ClearSGrid(StringGrid1);
  index:=0;
  for x := 0 to WebappsNode.ChildNodes.Count-1 do
  Begin
    valorC2:='';
    If WebappsNode.ChildNodes.Item[x].ChildNodes.Count>0 then valorC2:=WebappsNode.ChildNodes.Item[x].FirstChild.NodeValue;
    If (Ansipos(filter,UpperCase(valorC2))<>0) Or (filter='') then
      Begin
        index:=index+1;
        StringGrid1.InsertRowWithValues(index,[(x+1).ToString,WebappsNode.ChildNodes.Item[x].NodeName,valorC2]);
      end;
  end;
end;

Procedure TMyXml.loadWebxmlGrid(var webxmlNode:TDOMNode;var StringGrid1:TStringGrid);
 var x,i, valueX:LongInt;
     tag,value,consider,found,msgtxt,msgcolor,valx:String;
Begin
  ClearSGrid(StringGrid1);
  for x := 0 to webxmlNode.ChildNodes.Count-1 do //rule
  Begin
    tag:='';value:='';consider:='';found:='';msgtxt:='';msgcolor:='';
    valueX:=0;
    For i:=0 To webxmlNode.ChildNodes.Item[x].ChildNodes.Count-1 do //tag rules
    begin
       If webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].ChildNodes.Count>0 Then
         If webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeName='#text' then
           begin
            case LowerCase(Trim(webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].NodeName)) of
                 'tag':     tag:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                 'value':   value:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                 'consider':consider:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                 'found':   found:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                 'x':       valX:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                 'msgtxt':  msgtxt:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                 'msgcolor':msgcolor:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                 //Old Versions
                 'when':    loadOldVar(webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue,consider,found,valx);
                 'msg':     msgtxt:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
                 'type':    msgcolor:=webxmlNode.ChildNodes.Item[x].ChildNodes.Item[i].FirstChild.NodeValue;
            end;
           end;
    end;
    try
      Valuex:=StrToInt(valX);
    except
      // will only be executed in case of an exception
      on E: Exception do
        valuex:=0
    end;
    StringGrid1.InsertRowWithValues((x+1),[(x+1).ToString,tag,value,consider,found,valueX.ToString,msgtxt,msgcolor]);
  end;
end;
Procedure TMyXml.loadOldVar(when:String;var consider:String;var found:String;var X:String);
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
Function TMyXml.chkEtiVal(rutaWebXml:String;etiqueta,Valor:DOMString):Boolean;
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

Function TMyXml.findEtiValorChild(Doc:TDOMNodeList;etiqueta,Valor:DOMString):Boolean;
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

Function TMyXml.getValchild(Doc:TDOMNodeList;etiqueta:DOMString;var existe:boolean):String;
var i,desde:Integer;
  nombre,valor:String;
begin
  Result:='';
  desde:=0;
  If (doc.Item[0].NodeName='#text') then desde:=1;
  for i := desde to (Doc.Count - 1) do
  begin
     nombre:=Doc.Item[i].NodeName;
     valor:='';
     If (doc.Item[i].ChildNodes.Count=0) then if nombre=etiqueta then begin existe:=true; exit(valor) end;//ShowMessage(',['+nombre+']  ['+valor+']');

     If (doc.Item[i].ChildNodes.Count>0) then
       begin
         if (doc.Item[i].FirstChild.NodeName='#text') then valor:=doc.Item[i].FirstChild.NodeValue;
         if (nombre = etiqueta) then begin existe:=true; exit(valor) end;
         Result:=getValchild(Doc.Item[i].ChildNodes,etiqueta,existe);
         if existe then exit(Result);
       end;
   end;
end;

Function TMyXml.getValueTagTXT(nodeopen,nodeclose:String;var ex:boolean):String;
var ifrom, ito:Integer;
    TXTXml:String;
Begin
  ex:=False;
  Result:='';
  TXTXml:=ContentXml;
  If (Trim(TXTXml).IsEmpty) Then exit;
  ifrom:=Pos(lowercase(nodeopen),lowercase(TXTXml));
  If Ifrom<1 Then Exit;
  ifrom:=ifrom+Length(nodeopen);
  ito:=Pos(lowercase(nodeclose),lowercase(TXTXml));
  If (ifrom>ito) Or (Ito<1) then exit;
  Result:=Trim(Copy(TXTXml,ifrom,(ito-ifrom)));
  ex:=True;
end;

Function TMyXml.getValueTagTXT(nodeopen,nodeclose,TXTXml:String;var ex:boolean):String;
var ifrom, ito:Integer;
Begin
  ex:=False;
  Result:='';
  If (Trim(TXTXml).IsEmpty) Then exit;
  ifrom:=Pos(lowercase(nodeopen),lowercase(TXTXml));
  If Ifrom<1 Then Exit;
  ifrom:=ifrom+Length(nodeopen);
  ito:=Pos(lowercase(nodeclose),lowercase(TXTXml));
  If (ifrom>ito) Or (Ito<1) then exit;
  Result:=Trim(Copy(TXTXml,ifrom,(ito-ifrom)));
  ex:=True;
end;

Function TMyXml.ReplaceValueAndTagTXT(nodeopen,nodeclose,value:String):Boolean;
var ifrom, ito:Integer;
    Content:String;
begin
    If (Not(FileExists(pathxml))) Then Exit(False);
    Result:=True;
    Content:=ContentXml;
    IFrom:=Pos(nodeopen,lowercase(Content));
    If IFrom<1 then Exit(False);
    iTo:=Pos(nodeclose,lowercase(Content));
    If (ifrom>ito) Or (Ito<1) then exit(False);
    iTo:=(ito+Length(nodeclose))-IFrom;
    Content:=  StuffString(Content, Ifrom, Ito,value);
    Content:=StringReplace(Content, ' '+#13#10, #13#10,[rfReplaceAll]);
    Content:=StringReplace(Content, #09#13#10, #13#10,[rfReplaceAll]);
    Content:=StringReplace(Content, #13#10#13#10#13#10, #13#10,[rfReplaceAll]);
    Content:=StringReplace(Content, #0, '',[rfReplaceAll]);
    SaveFullTxtToXml(Content);
end;

Function TMyXml.ReplaceValueTXT(nodeopen,nodeclose,value:String):Boolean;
var ifrom, ito:Integer;
    Content:String;
begin
    If (Not(FileExists(pathxml))) Then Exit(False);
    Result:=True;
    Content:=ContentXml;
    IFrom:=Pos(nodeopen,lowercase(Content));
    If IFrom<1 then Exit(False);
    IFrom:=IFrom+Length(nodeopen);
    iTo:=Pos(nodeclose,lowercase(Content));
    If (ifrom>ito) Or (Ito<1) then exit(False);
    ITo:=ITo-IFrom;
//    iTo:=ito+Length(nodeclose);
    Content:=  StuffString(Content, Ifrom, ITo,value);
    Content:=StringReplace(Content, ' '+#13#10, #13#10,[rfReplaceAll]);
    Content:=StringReplace(Content, #09#13#10, #13#10,[rfReplaceAll]);
    Content:=StringReplace(Content, #13#10#13#10#13#10, #13#10,[rfReplaceAll]);
    Content:=StringReplace(Content, #0, '',[rfReplaceAll]);
    SaveFullTxtToXml(Content);
end;

Function TMyXml.InsertWhitPrevRefTXT(refPrev,value:String):Boolean;
var ifrom, ito:Integer;
    Content:String;
Begin
    If (Not(FileExists(pathxml))) Then Exit(False);
    Content:=ContentXml;
    IFrom:=Pos(lowercase(refPrev),lowercase(Content));
    If IFrom<1 then Exit(False);
    IFrom:=Ifrom+Length(RefPrev);
    ito:=0;
    Content:= StuffString(Content, Ifrom, ito, #13#10+'  '+value);
    Result:=SaveFullTxtToXml(Content);
end;

Function TMyXml.InsertWhitPostRefTXT(refPost,value:String):Boolean;
var ifrom, ito:Integer;
  Content:String;
  Begin
      If (Not(FileExists(pathxml))) Then Exit(False);
      Content:=ContentXml;
      IFrom:=Pos(lowercase(refPost),lowercase(content));
      If IFrom<1 then Exit(False);
      ito:=0;
      content:= StuffString(content, Ifrom, ito, '  '+value+#13#10);
      Result:=SaveFullTxttoXml(Content);
  end;
end.

