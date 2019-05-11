unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ShellApi, fileinfo;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var version,ParamPath,params : String;
  FileVerInfo:TFileVersionInfo;

begin
  FileVerInfo:=TFileVersionInfo.Create(nil);
  FileVerInfo.ReadFileInfo;
  version:=FileVerInfo.VersionStrings.Values['ProductVersion'];
  FileVerInfo.Free;
  //Memo1.Text:=version;
  ParamPath := ExtractFilePath(ParamStr(0));
   version:=Memo1.Text ;
  params:= '"'+ParamStr(0)+'" ' + version + ' https://filedn.com/l4o5bp4oGNf0AfR1x0lJ3xB/DelFind/update.ini';
  Application.Terminate;
  if ShellExecute(0,nil, PChar(ParamPath+'DelFind_UPD.exe'),PChar(params),PChar(ParamPath),1) =0 then;

end;

procedure TForm1.FormActivate(Sender: TObject);
var FileVerInfo:TFileVersionInfo;
begin
  FileVerInfo:=TFileVersionInfo.Create(nil);
  FileVerInfo.ReadFileInfo;
  Memo1.Text:=FileVerInfo.VersionStrings.Values['ProductVersion'];
  FileVerInfo.Free;
end;

end.

