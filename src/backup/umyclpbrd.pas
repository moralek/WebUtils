unit UMyClpBrd;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
    Windows,shlobj,Clipbrd,LCLType;
type
  TMyClpBrd=class
Public
  procedure CopyFileToClipboard(FileList: string);
  procedure CopyFilesToClipboard2(FileList: string);

Private

end;

implementation
procedure TMyClpBrd.CopyFileToClipboard(FileList: string); // List Seperated by #0
var
  DropFiles: PDropFiles;
  hGlobal: THandle;
  iLen: integer;
  hwsd:HWND;
begin
  iLen := Length(FileList) + 2;
  FileList := FileList + #0#0;
  hGlobal := GlobalAlloc(GMEM_SHARE or GMEM_MOVEABLE or GMEM_ZEROINIT,
    SizeOf(TDropFiles) + iLen);
  if (hGlobal = 0) then
//    raise Exception.Create('Could not allocate memory.');
      raise Exception.Create('No se pudo asignar memoria(prueba ejecutar como admin).');
  begin
    ClipBoard.Open;
    DropFiles := GlobalLock(hGlobal);
    DropFiles^.pFiles := SizeOf(TDropFiles);
    Move(FileList[1], (PChar(DropFiles) + SizeOf(TDropFiles))^, iLen);
    GlobalUnlock(hGlobal);

    OpenClipboard(GetClipboardOwner);
    EmptyClipboard;
    SetClipboardData(CF_HDROP,hGlobal);
    CloseClipboard;
   end;
end;


procedure TMyClpBrd.CopyFilesToClipboard2(FileList: string); // List Seperated by #0
      // Example... CopyFilesToClipboard('C:\Bootlog.Txt'#0'C:\AutoExec.Bat');
var
  DropFiles: PDropFiles;
  hGlobal: THandle;
  iLen: Integer;
begin
  iLen:=Length(FileList)+2;
  FileList:=FileList+#0#0;  // <-- Important to make it work
  hGlobal:=GlobalAlloc(GMEM_SHARE or GMEM_MOVEABLE or GMEM_ZEROINIT,
    SizeOf(TDropFiles)+iLen);
  if (hGlobal = 0) then raise Exception.Create('Could not allocate memory.');
  begin
    DropFiles:=GlobalLock(hGlobal);
    DropFiles^.pFiles:=SizeOf(TDropFiles);
    Move(FileList[1],(PChar(DropFiles)+SizeOf(TDropFiles))^,iLen);
    GlobalUnlock(hGlobal);
    Clipboard.SetAsHandle(CF_HDROP,hGlobal);
  end;
end;
end.

