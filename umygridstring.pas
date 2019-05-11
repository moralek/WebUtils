unit UMyGridString;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  FileUtil, Grids,UFdeFile, UMyUtils,
  LCLIntf, ExtCtrls,  StdCtrls,
  RichMemo, ListFilterEdit, UGlobales,  Buttons,
  Menus, ValEdit, LCLType;
type
  TMyGridString=class
public
  type TColumnStringGrid1 = (checkedRow=0, Carpeta=1,RutaAbsoluta=2,NombreWar=3,Modulo=4,XmlDisplayName=5,PathClientCfg=6,PathWebXml=7,GxVersion=8,PDFReport=9);
  Procedure addToGrid(var StringGrid:TStringGrid;comando,Valor:String);
  Procedure addNewRow2Grid(arrayValues:Array of String;var StringGrid:TStringGrid);
  Procedure delToGrid(var StringGrid:TStringGrid;index:Integer);
  Procedure cleanGrid(var StringGrid:TStringGrid);
  Procedure LoadGridFromFDEFile(var StringGrid:TStringGrid;FDEFilePath:String);
  Procedure upInGrid(var StringGrid:TStringGrid;var modificado:TCheckBox);
  Procedure downInGrid(var StringGrid:TStringGrid;var modificado:TCheckBox);
  Function getSelectedValueStringGrid1(StringGrid1:TStringGrid;col:TColumnStringGrid1):String;
Private
  Procedure reindexGrid(var StringGrid:TStringGrid);
end;

implementation
Procedure TMyGridString.addToGrid(var StringGrid:TStringGrid;comando,Valor:String);
var x:Integer;
begin
    x:= StringGrid.RowCount;
    StringGrid.InsertRowWithValues(x,[x.tostring(),comando,valor]);
    reindexGrid(StringGrid);
end;
Procedure TMyGridString.addNewRow2Grid(arrayValues:Array of String;var StringGrid:TStringGrid);
var x:Integer;
begin
    x:= StringGrid.RowCount;
    StringGrid.InsertRowWithValues(x,arrayvalues);
    reindexGrid(StringGrid);
    StringGrid.Row:=x;
end;

Procedure TMyGridString.delToGrid(var StringGrid:TStringGrid;index:Integer);
begin
    if (Index>0) and (index<=StringGrid.RowCount) then
        StringGrid.DeleteRow(index);
    reindexGrid(StringGrid);
end;


Procedure TMyGridString.upInGrid(var StringGrid:TStringGrid;var modificado:TCheckBox);
var resp:String;
  index:Integer;
begin
    If (StringGrid.Row<=1) Or (StringGrid.Row>(StringGrid.RowCount-1)) Then Exit;
    index:=StringGrid.Row;
    resp:= StringGrid.Rows[(index-1)].CommaText;
    StringGrid.Rows[(index-1)].CommaText:=StringGrid.Rows[(index)].CommaText;
    StringGrid.Rows[(index)].CommaText:=resp;


//    comando:= StringGrid.Cells[1,(index-1)];
//    valor:= StringGrid.Cells[2,(index-1)];
//    StringGrid.Cells[1,(index-1)]:= StringGrid.Cells[1,index];
//    StringGrid.Cells[2,(index-1)]:= StringGrid.Cells[2,index];
//    StringGrid.Cells[1,index]:=comando;
//    StringGrid.Cells[2,index]:=valor;
    reindexGrid(StringGrid);
    StringGrid.Row:=StringGrid.Row-1;
    modificado.Checked:=True;
end;

Procedure TMyGridString.downInGrid(var StringGrid:TStringGrid;var modificado:TCheckBox);
var resp:String;
  index:Integer;
begin
    If (StringGrid.Row<1) Or (StringGrid.Row>=(StringGrid.RowCount-1)) Then Exit;
    index:=StringGrid.Row;
    resp:= StringGrid.Rows[(index+1)].CommaText;
    StringGrid.Rows[(index+1)].CommaText:=StringGrid.Rows[(index)].CommaText;
    StringGrid.Rows[(index)].CommaText:=resp;

    reindexGrid(StringGrid);
    StringGrid.Row:=StringGrid.Row+1;
    modificado.Checked:=True;
end;

Procedure TMyGridString.CleanGrid(var StringGrid: TStringGrid);
   var i,x:Integer;
begin
   x:=StringGrid.RowCount-1;
   for i:=1 to x do
   begin
     StringGrid.DeleteRow(1);
   end;
end;

Procedure TMyGridString.reindexGrid(var StringGrid:TStringGrid);
var x:Integer;
begin
   for x:=1 to StringGrid.RowCount-1 do
   begin
     StringGrid.Cells[0,x]:=x.ToString();
   end;
end;

Procedure TMyGridString.LoadGridFromFDEFile(var StringGrid:TStringGrid;FDEFilePath:String);
var
  U:TMyUtils;
  Archivo: TextFile;
  FilaRead:String;
  Fila:Integer;
begin
    U:=TMyUtils.Create;
    Fila:=0;
    AssignFile(Archivo, FDEfilepath);
    ReSet(Archivo);
    cleanGrid(StringGrid);
    while not eof(Archivo) do
    begin
      Fila:=Fila+1;
      ReadLn(Archivo, FilaRead);
      FilaRead:=Trim(FilaRead);
      addToGrid(StringGrid,(U.getTipoFDE(FilaRead)),(U.getDatoFDE(FilaRead)));
    end;
    reindexGrid(StringGrid);
    {Free}
    U.Free;
    CloseFile(Archivo);
end;
Function TMyGridString.getSelectedValueStringGrid1(StringGrid1:TStringGrid;col:TColumnStringGrid1):String;
var value:String;
begin
   WriteStr(Value,col);
   Result:=StringGrid1.Rows[StringGrid1.Row][StrToInt(Value)];
end;

end.

