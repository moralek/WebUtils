unit VarRegEnv;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, registry,Dialogs;
type
  TVarRegEnv=class
private
  Function retjavaok(ruta:String):Boolean;
public
  Function retvar(variable:String):String;
  Function retvarHLM(ruta:String; variable:String):String;
  Function retkeyval(RootKey:HKEY;FolderKey:String;Key:String):String;
  Function retfolders(RootKey:HKEY;FolderKey:String):TStringList;
  //Function retJavaHome():String;
end;

implementation
Function TVarRegEnv.retvar(variable:String):String;
begin
  Result:= GetEnvironmentVariable(variable);
end;

Function TVarRegEnv.retjavaok(ruta:String):Boolean;
var Folder:String;
begin
     Result:=False;
     If DirectoryExists(ruta) Then
     begin
         Folder:=Folder+'bin\jar.exe';
         If FileExists(Folder) then Result:=True;
     end;
end;

Function TVarRegEnv.retvarHLM(ruta:String;variable:String):String;
var SL: TStringList;
  x:integer;
  FolderKey:String;
begin
  Result:='';
  FolderKey:=ruta;
  SL:= retfolders(HKEY_LOCAL_MACHINE,FolderKey);
   for x:=0 to pred(SL.Count) do
   begin
     FolderKey:=Ruta+'\'+SL.Strings[x];
     Result:=retkeyval(HKEY_LOCAL_MACHINE,FolderKey,variable);
     ShowMessage(FolderKey);
     ShowMessage(variable+':'+Result);
   end;
end;

Function TVarRegEnv.retfolders(RootKey:HKEY;FolderKey:String):TStringList;
var Registry: TRegistry;
begin
  Result:=TStringList.Create;
  Registry := TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);
  Registry.RootKey:=RootKey;
  if Registry.OpenKey(FolderKey,False) then
  begin
    Registry.GetKeyNames(Result);
    Result.Sort;
  end;
  Registry.Free;
end;

Function TVarRegEnv.retkeyval(RootKey:HKEY;FolderKey:String;Key:String):String;
var Registry: TRegistry;
begin
   Result:='';
   Registry := TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);
   Registry.RootKey := RootKey;
   if Registry.OpenKey(FolderKey,False) then
   begin
       Result:=Registry.ReadString(key);
   end;
   Registry.Free;
end;


end.

