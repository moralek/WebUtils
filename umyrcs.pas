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

Function getRCS(resource:String):String;
Private
  Function getResourceName(resource:String):String;
  Function getResourceFileName(resource:String):String;
  Function getResourceStream(resource:String):TResourceStream;
  //Private Declarations
end;
implementation
{$R resources\resources.res}

Function TMyRCS.getResourceName(resource:String):String;
begin
  case UpperCase(resource) of
    'ARIAL.TTF',
    'ARIAL_TTF',
    'ARIALN_TTF',
    'ARIALN.TTF': Result:='ARIALN_TTF';
    'COUR.TTF': Result:='COUR_TTF';
    'COURI.TTF': Result:='COURI_TTF';
    'MICROSS.TTF': Result:='MICROSS_TTF';
    'TIMES.TTF': Result:='TIMES_TTF';
    'VERDANA.TTF': Result:='VERDANA_TTF';
  else
    Result:=UpperCase(ChangeFileExt(ExtractFileName(resource), '')).Replace('.', '_');
  end;
end;

Function TMyRCS.getResourceFileName(resource:String):String;
begin
  case UpperCase(resource) of
    'ARIAL.TTF',
    'ARIAL_TTF',
    'ARIALN_TTF',
    'ARIALN.TTF': Result:='ARIALN.TTF';
    'COUR_TTF',
    'COUR.TTF': Result:='cour.ttf';
    'COURI_TTF',
    'COURI.TTF': Result:='couri.ttf';
    'MICROSS_TTF',
    'MICROSS.TTF': Result:='micross.ttf';
    'TIMES_TTF',
    'TIMES.TTF': Result:='times.ttf';
    'VERDANA_TTF',
    'VERDANA.TTF': Result:='verdana.ttf';
  else
    Result:=ExtractFileName(resource);
  end;
end;

Function TMyRCS.getResourceStream(resource:String):TResourceStream;
var
  ResourceName: String;
  ModuleHandle: HMODULE;
begin
  ResourceName:=getResourceName(resource);
  ModuleHandle:=GetModuleHandle(nil);
  if FindResource(ModuleHandle, PChar(ResourceName), RT_RCDATA)<>0 then
    Exit(TResourceStream.Create(ModuleHandle, PChar(ResourceName), RT_RCDATA));

  if (ModuleHandle<>HInstance) and (FindResource(HInstance, PChar(ResourceName), RT_RCDATA)<>0) then
    Exit(TResourceStream.Create(HInstance, PChar(ResourceName), RT_RCDATA));

  if UpperCase(resource)='ARIALN.TTF' then
  begin
    if FindResource(ModuleHandle, 'ARIAL_TTF', RT_RCDATA)<>0 then
      Exit(TResourceStream.Create(ModuleHandle, 'ARIAL_TTF', RT_RCDATA));
    if (ModuleHandle<>HInstance) and (FindResource(HInstance, 'ARIAL_TTF', RT_RCDATA)<>0) then
      Exit(TResourceStream.Create(HInstance, 'ARIAL_TTF', RT_RCDATA));
  end;

  raise EResNotFound.CreateFmt('Resource "%s" not found', [ResourceName]);
end;

Function TMyRCS.getRCS(resource:String):String;
var
  S: TResourceStream;
  F: TFileStream;
  ResourceFileName: String;
  RuntimePath: String;
  ResourceTempDir: String;
  CandidatePaths: array[0..3] of String;
  I: Integer;
begin
  Result:='';
  ResourceFileName:=getResourceFileName(resource);
  ResourceTempDir:=ExtractFilePath(ParamStr(0))+'tmp\resources\';
  CandidatePaths[0]:=ExtractFilePath(ParamStr(0))+'resources\'+ResourceFileName;
  CandidatePaths[1]:=ExtractFilePath(ParamStr(0))+'WebUtils2\resources\'+ResourceFileName;
  CandidatePaths[2]:=GetCurrentDir+'\resources\'+ResourceFileName;
  CandidatePaths[3]:=ResourceTempDir+ResourceFileName;

  for I:=Low(CandidatePaths) to High(CandidatePaths) do
  begin
    RuntimePath:=ExpandFileName(CandidatePaths[I]);
    if FileExists(RuntimePath) then Exit(RuntimePath);
  end;

  if not DirectoryExists(ResourceTempDir) then
    ForceDirectories(ResourceTempDir);
  RuntimePath:=ExpandFileName(ResourceTempDir+ResourceFileName);
  S := getResourceStream(resource);
  try
    F := TFileStream.Create(RuntimePath, fmCreate);
    try
      F.CopyFrom(S, S.Size);
    finally
      F.Free;
    end;
  finally
    S.Free;
  end;
  If FileExists(RuntimePath) then Result:=RuntimePath;

end;
end.

