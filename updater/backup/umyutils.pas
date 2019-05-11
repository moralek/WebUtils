unit UMyUtils;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils,fphttpclient,INIFiles,Dialogs;
type
    TMyUtils=class
Public
  //Public Declarations
  Function FormatSize(Size: Int64): String;
  Function getIniParms(UrlIni:String;var version,URL,executable:String;var updatables:TStringList):Boolean;
Private
  //Private Declarations
  Procedure DownFile(inurl:String;outfile:String);
end;

implementation

Function TMyUtils.FormatSize(Size: Int64): String;
const
  KB = 1024;
  MB = 1024 * KB;
  GB = 1024 * MB;
begin
  if Size < KB then
    Result := FormatFloat('#,##0 Bytes', Size)
  else if Size < MB then
    Result := FormatFloat('#,##0.0 KB', Size / KB)
  else if Size < GB then
    Result := FormatFloat('#,##0.0 MB', Size / MB)
  else
    Result := FormatFloat('#,##0.0 GB', Size / GB);
end;

Function TMyUtils.getIniParms(UrlIni:String;var version,URL,executable:String;var updatables:TStringList):Boolean;
var  INI:TINIFile;
     sections:TStringList;
     Section:String;
begin
  Result:=False;
  Section:='';
  try

    DownFile(UrlIni,'update.ini');
    sections:=TStringList.Create;
    If (Not(FileExists(ExtractFilePath(ParamStr(0))+'update.Ini'))) Then Exit(False);
    INI := TINIFile.Create('update.Ini');
    INI.ReadSections(sections);
    If sections.Count>0 Then Section:=sections[0];
    executable:= INI.ReadString(Section,'executable','');
    URL:= INI.ReadString(Section,'URL','');
    version:=INI.ReadString(Section,'version','');
    updatables:=TStringList.Create;
    updatables.Delimiter:=';';
    updatables.DelimitedText:=INI.ReadString(Section,'updatables','');
    INI.Free;
    DeleteFile('update.Ini');
    Result:=not((executable.Trim.IsEmpty) Or (URL.Trim.IsEmpty) Or (version.Trim.IsEmpty) or (updatables.Count<1));
  except
    on E: Exception do
      Result:=False;
  end;
end;

Procedure TMyUtils.DownFile(inurl:String;outfile:String);
var HTTPClient:TFPHTTPClient;
begin
    HTTPClient := TFPHTTPClient.Create(nil);
    try
      try
        HTTPClient.Get(inurl, outfile);
       except
         on E: Exception do
         showmessage(E.Message);
       end;
    finally
      HTTPClient.Free;
    end;
end;
end.

