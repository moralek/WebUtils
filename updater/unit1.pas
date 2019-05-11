unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  fphttpclient, zipper, ShellApi,UMyUtils,
  LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;

    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Inicio();
  private
    function Download(AFrom, ATo: String): Boolean;
    function IsOpenSSLAvailable: Boolean;
    procedure DoOnWriteStream(Sender: TObject; APosition: Int64);
  public

  end;

var
  Form1: TForm1;
  Utils:TMyUtils;
implementation

{$R *.lfm}

type

  { TDownloadStream }

  TOnWriteStream = procedure(Sender: TObject; APos: Int64) of object;
  TDownloadStream = class(TStream)
  private
    FOnWriteStream: TOnWriteStream;
    FStream: TStream;
  public
    constructor Create(AStream: TStream);
    destructor Destroy; override;
    function Read(var Buffer; Count: LongInt): LongInt; override;
    function Write(const Buffer; Count: LongInt): LongInt; override;
    function Seek(Offset: LongInt; Origin: Word): LongInt; override;
    procedure DoProgress;
  published
    property OnWriteStream: TOnWriteStream read FOnWriteStream write FOnWriteStream;
  end;


{ TDownloadStream }

constructor TDownloadStream.Create(AStream: TStream);
begin
  inherited Create;
  FStream := AStream;
  FStream.Position := 0;
end;

destructor TDownloadStream.Destroy;
begin
  FStream.Free;
  inherited Destroy;
end;

function TDownloadStream.Read(var Buffer; Count: LongInt): LongInt;
begin
  Result := FStream.Read(Buffer, Count);
end;

function TDownloadStream.Write(const Buffer; Count: LongInt): LongInt;
begin
  Result := FStream.Write(Buffer, Count);
  DoProgress;
end;

function TDownloadStream.Seek(Offset: LongInt; Origin: Word): LongInt;
begin
  Result := FStream.Seek(Offset, Origin);
end;

procedure TDownloadStream.DoProgress;
begin
  if Assigned(FOnWriteStream) then
    FOnWriteStream(Self, Self.Position);
end;

{ TForm1 }

function TForm1.Download(AFrom, ATo: String): Boolean;
var
  DS: TDownloadStream;
  HTTPClient: TFPHTTPClient;
begin
  Result := False;
  DS := TDownloadStream.Create(TFileStream.Create(ATo, fmCreate));
  try
    DS.FOnWriteStream := @DoOnWriteStream;
    HTTPClient := TFPHTTPClient.Create(nil);
    try
      HTTPClient.AllowRedirect := True;
      try
        HTTPClient.HTTPMethod('GET', AFrom, DS, [200]);
        Result := True;
      except
        on E: Exception do
        begin
          ShowMessage(e.Message)
        end;
      end;
    finally
      HTTPClient.Free;
    end;
  finally
    DS.Free
  end;
end;

procedure TForm1.DoOnWriteStream(Sender: TObject; APosition: Int64);
begin
  Label1.Caption := 'Descargando... ' + Utils.FormatSize(APosition);
  Application.ProcessMessages;
end;

function TForm1.IsOpenSSLAvailable: Boolean;
const
  {$IFDEF WIN64}
    cOpenSSLURL = 'http://packages.lazarus-ide.org/openssl-1.0.2j-x64_86-win64.zip';
  {$ENDIF}
  {$IFDEF WIN32}
    cOpenSSLURL = 'http://packages.lazarus-ide.org/openssl-1.0.2j-i386-win32.zip';
  {$ENDIF}
var
  {$IFDEF MSWINDOWS}
  UnZipper: TUnZipper;
  ParamPath, LibeayDLL, SsleayDLL, ZipFile: String;
  HTTPClient: TFPHTTPClient;
  {$EndIf}
begin
  {$IFDEF MSWINDOWS}
  ParamPath := ExtractFilePath(ParamStr(0));
  LibeayDLL := ParamPath + 'libeay32.dll';
  SsleayDLL := ParamPath + 'ssleay32.dll';
  Result := FileExists(Libeaydll) and FileExists(Ssleaydll);
  if not Result then
  begin
    ZipFile := ParamPath + ExtractFileName(cOpenSSLURL);
    HTTPClient := TFPHTTPClient.Create(nil);
    try
      try
        HTTPClient.Get(cOpenSSLURL, ZipFile);
       except
       end;
    finally
      HTTPClient.Free;
    end;
    if FileExists(ZipFile) then
    begin
      UnZipper := TUnZipper.Create;
      try
        try
          UnZipper.FileName := ZipFile;
          UnZipper.Examine;
          UnZipper.UnZipAllFiles;
        except
        end;
      finally
        UnZipper.Free;
      end;
      DeleteFile(ZipFile);
      Result := FileExists(Libeaydll) and FileExists(Ssleaydll);
    end;
  end;
  {$ELSE}
  FOpenSSLAvailable := True;
  {$ENDIF}
end;


procedure TForm1.Inicio();
var ParamPath,UrlIni,exeactual,VersionActual,URL,executable,version:String;
  ZipFile:String;
   updatables:TStringList;
   ok:Boolean;
   UnZipper : TUnZipper;
begin
  ParamPath:= ExtractFilePath(ParamStr(0));
  updatables:=TStringList.Create;
  exeactual:=ParamStr(1); //RutaAbsoluta del caller
  versionActual:=ParamStr(2); //Version Actual
  UrlIni:=ParamStr(3);  //Url del Ini con la info a Guardar
  If (versionActual.Trim.IsEmpty) Then VersionActual:='0.0.1';
  If (UrlIni.Trim.IsEmpty) Then UrlIni:='https://filedn.com/l4o5bp4oGNf0AfR1x0lJ3xB/DelFind/update.ini';
  //Obtener parametros: URL , executable, updatables
  ok:=Utils.getIniParms(UrlIni,version,URL,executable,updatables);

  If not(OK) Then
  begin
    Application.Terminate;
    Application.MessageBox('No se pudo Actualizar'+ sLineBreak + 'Chequea tu conexión o intenta más tarde.', 'Oh oh!!!',MB_ICONERROR);
    if ShellExecute(0,nil, PChar(exeactual),'',PChar(ParamPath),1) =0 then;
    Exit;
  end;
  If (VersionActual=version) Then
  begin
    Application.Terminate;
    Application.MessageBox('Ya tienes la version más reciente.', 'Ah pero muy bien!!',MB_ICONASTERISK);
    if ShellExecute(0,nil, PChar(exeactual),'',PChar(ParamPath),1) =0 then;
    Exit;
  end;

 //UPDATE
ZipFile:=  ParamPath+'new_delfind.zip';
Application.ProcessMessages;
Label1.Caption := 'Descargando la nueva versión, paciencia...';
if Download(URL, ZipFile) then
begin
    MessageDlg('Se actualizó a la Ultima Version', mtInformation, [mbOk], 0);
    Label1.Caption:='Instalando...';
    //INICIO UNZIP FILES
    if FileExists(ZipFile) then
    begin
      UnZipper := TUnZipper.Create;
      try
        try
          UnZipper.FileName := ZipFile;
          UnZipper.OutputPath := ParamPath;
          UnZipper.Examine;
          UnZipper.UnZipFiles(ZipFile,updatables);
        except
        end;
      finally
        UnZipper.Free;
      end;
     //FIN UNZIP FILES
    If FileExists(ZipFile) then DeleteFile(ZipFile);
    If fileExists(ParamPath+executable) then
    begin
         Application.Terminate;
         if ShellExecute(0,nil, PChar(ParamPath+executable),'',PChar(ParamPath),1) =0 then;
         exit;
    end;
end;
Application.Terminate;
if ShellExecute(0,nil, PChar(exeactual),'',PChar(ParamPath),1) =0 then;
end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Utils:=TMyUtils.Create;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Inicio();
end;

end.


