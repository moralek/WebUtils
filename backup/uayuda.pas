unit UAyuda;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,RichMemo,UMyUtils,Graphics,ComCtrls;
type
  TAyuda=class
public
   Constructor create();
   Procedure addToRichMemo(comando:String;var Memo:TRichMemo;var StatusBar1:TStatusBar);
   Function getShorthlp(comando:String):String;
   Function gethlp(comando:String):String;
private
   Utils:TMyUtils;
  end;

implementation
    Constructor TAyuda.create();
    Begin
       Utils := TMyUtils.Create;
    end;

    Procedure TAyuda.addToRichMemo(comando:String;var Memo:TRichMemo;var StatusBar1:TStatusBar);
    begin
       Memo.Clear;
       If Trim(Comando).IsEmpty Then
         begin
         Utils.addToRichMemo('',Memo,StatusBar1);
         Utils.addToRichMemo('Editor .FDE',Memo,StatusBar1,clBlue);
         Utils.addToRichMemo('-----------',Memo,StatusBar1);
         Utils.addToRichMemo(gethlp(comando),Memo,StatusBar1)
         end
       else
       begin
         Utils.addToRichMemo('',Memo,StatusBar1);
         Utils.addToRichMemo(comando,Memo,StatusBar1,clBlue);
         Utils.addToRichMemo('('+getShorthlp(comando)+')',Memo,StatusBar1);
         Utils.addToRichMemo(gethlp(comando),Memo,StatusBar1);
       end;
    end;

    Function TAyuda.getShorthlp(comando:String):String;
    begin
      Result:='';
      case comando of
       'CHKFIL' : Result := 'Check File';
       'DELFIL' : Result := 'Delete File';
       'CHKDIR' : Result := 'Check Directory';
       'DELDIR' : Result := 'Delete Directory';
       'CLRDIR' : Result := 'Clear Directory';
       'CREDIR' : Result := 'Create Directory';
       'MSGRUN' : Result := 'Message in Run';
      end;
    end;

    Function TAyuda.gethlp(comando:String):String;
    begin
      Result:='';
      case comando of
       ''       : Result := 'Permite crear, ver y editar scripts con extensión .fde.';
       'CHKFIL' : Result := 'Informa si el archivo Existe o no(permite comodines (* ?)).';
       'DELFIL' : Result := 'Elimina archivos (permite comodines (* ?)).';
       'CHKDIR' : Result := 'Informa si la Carpeta Existe o no.';
       'DELDIR' : Result := 'Borra Una Carpeta.';
       'CLRDIR' : Result := 'Elimina el Contenido de una Carpeta.';
       'CREDIR' : Result := 'Crea Una Carpeta.';
       'MSGRUN' : Result := 'Muestra un mensaje durante la ejecución.';
      end;
    end;

end.

