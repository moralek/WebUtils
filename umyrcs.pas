unit UMyRCS;
{$mode objfpc}{$H+}
interface
uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Windows;
type
  TMyRCS=class
Public
  //Public Declarations

const
  ARIALN_TTF          = 'ARIALN.TTF';
  COUR_TTF            = 'cour.ttf';
  COURI_TTF           = 'couri.ttf';
  MICROSS_TTF         = 'micross.ttf';
  TIMES_TTF           = 'times.ttf';
  VERDANA_TTF         = 'verdana.ttf';
  DelFind_UPD_exe     = 'DelFind_UPD.exe';
  SSLEAY32_DLL        = 'ssleay32.dll';
  LIBEAY32_DLL        = 'libeay32.dll';

Function getRCS(resource:String):String;
Private
  //Private Declarations
end;
implementation
{$R .\updater\upd.rc}
{$R .\resources\resources.rc}

Function TMyRCS.getRCS(resource:String):String;
var
  S: TResourceStream;
  F: TFileStream;
begin
  Result:='';
  S := TResourceStream.Create(HInstance, resource, RT_RCDATA);
  try
    F := TFileStream.Create(ExtractFilePath(ParamStr(0))+resource, fmCreate);
    try
      F.CopyFrom(S, S.Size);
    finally
      F.Free;
    end;
  finally
    S.Free;
  end;
  If FileExists(ExtractFilePath(ParamStr(0))+resource) then Result:=ExtractFilePath(ParamStr(0))+resource;
end;
end.

