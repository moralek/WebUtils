unit UMyWin;

{$mode objfpc}{$H+}

interface

uses
    Classes, Windows,SysUtils, Registry, ShellAPI, ComObj;
type
  TMyWin=class
Public
function IsAdministrator(): Boolean;
function  IsAdministratorAccount(): Boolean;
function  IsUACEnabled(): Boolean;
Function IsElevated(): Boolean;


Private
 // Procedure GenWarDir(RutaBase,javahome:String;var Memo:TRichMemo;var TrayIcon1:TTrayIcon;var StausBar1:TStatusBar;var QErrores:Integer;nomwar:String='');

end;

implementation

function CheckTokenMembership(TokenHandle: THANDLE; SidToCheck: Pointer; var IsMember: BOOL): BOOL; stdcall; external advapi32 name 'CheckTokenMembership';
function TMyWin.IsAdministrator(): Boolean;
var
  psidAdmin: Pointer;
  B: BOOL;
const
  SECURITY_NT_AUTHORITY: TSidIdentifierAuthority = (Value: (0, 0, 0, 0, 0, 5));
  SECURITY_BUILTIN_DOMAIN_RID  = $00000020;
  DOMAIN_ALIAS_RID_ADMINS      = $00000220;
  SE_GROUP_USE_FOR_DENY_ONLY  = $00000010;
begin
  psidAdmin := nil;
  try
    // Создаём SID группы админов для проверки
    Win32Check(AllocateAndInitializeSid(SECURITY_NT_AUTHORITY, 2,
      SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS, 0, 0, 0, 0, 0, 0,
      psidAdmin));

    // Проверяем, входим ли мы в группу админов (с учётов всех проверок на disabled SID)
    if CheckTokenMembership(0, psidAdmin, B) then
      Result := B
    else
      Result := False;
  finally
    if psidAdmin <> nil then
      FreeSid(psidAdmin);
  end;
end;

{$R-}

function IsAdministratorAccount: Boolean;
var
  psidAdmin: Pointer;
  Token: THandle;
  Count: DWORD;
  TokenInfo: PTokenGroups;
  HaveToken: Boolean;
  I: Integer;
const
  SECURITY_NT_AUTHORITY: TSidIdentifierAuthority = (Value: (0, 0, 0, 0, 0, 5));
  SECURITY_BUILTIN_DOMAIN_RID  = $00000020;
  DOMAIN_ALIAS_RID_ADMINS      = $00000220;
  SE_GROUP_USE_FOR_DENY_ONLY  = $00000010;
begin
  Result := Win32Platform <> VER_PLATFORM_WIN32_NT;
  if Result then
    Exit;

  psidAdmin := nil;
  TokenInfo := nil;
  HaveToken := False;
  try
    Token := 0;
    HaveToken := OpenThreadToken(GetCurrentThread, TOKEN_QUERY, True, Token);
    if (not HaveToken) and (GetLastError = ERROR_NO_TOKEN) then
      HaveToken := OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, Token);
    if HaveToken then
    begin
      Win32Check(AllocateAndInitializeSid(SECURITY_NT_AUTHORITY, 2,
        SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS, 0, 0, 0, 0, 0, 0,
        psidAdmin));
      if GetTokenInformation(Token, TokenGroups, nil, 0, Count) or
         (GetLastError <> ERROR_INSUFFICIENT_BUFFER) then
        RaiseLastOSError;
      TokenInfo := PTokenGroups(AllocMem(Count));
      Win32Check(GetTokenInformation(Token, TokenGroups, TokenInfo, Count, Count));
      for I := 0 to TokenInfo^.GroupCount - 1 do
      begin
        Result := EqualSid(psidAdmin, TokenInfo^.Groups[I].Sid);
        if Result then
          Break;
      end;
    end;
  finally
    if TokenInfo <> nil then
      FreeMem(TokenInfo);
    if HaveToken then
      CloseHandle(Token);
    if psidAdmin <> nil then
      FreeSid(psidAdmin);
  end;
end;

{$R+}

function IsUACEnabled: Boolean;
var
  Reg: TRegistry;
begin
  Result := CheckWin32Version(6, 0);
  if Result then
  begin
    Reg := TRegistry.Create(KEY_READ);
    try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\System', False) then
        if Reg.ValueExists('EnableLUA') then
          Result := (Reg.ReadInteger('EnableLUA') <> 0)
        else
          Result := False
      else
        Result := False;
    finally
      FreeAndNil(Reg);
    end;
  end;
end;

function TMyWin.IsElevated(): Boolean;
const
  TokenElevation = TTokenInformationClass(20);
type
  TOKEN_ELEVATION = record
    TokenIsElevated: DWORD;
  end;
var
  TokenHandle: THandle;
  ResultLength: Cardinal;
  ATokenElevation: TOKEN_ELEVATION;
  HaveToken: Boolean;
begin
  if CheckWin32Version(6, 0) then
  begin
    TokenHandle := 0;
    HaveToken := OpenThreadToken(GetCurrentThread, TOKEN_QUERY, True, TokenHandle);
    if (not HaveToken) and (GetLastError = ERROR_NO_TOKEN) then
      HaveToken := OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, TokenHandle);
    if HaveToken then
    begin
      try
        ResultLength := 0;
        if GetTokenInformation(TokenHandle, TokenElevation, @ATokenElevation, SizeOf(ATokenElevation), ResultLength) then
          Result := ATokenElevation.TokenIsElevated <> 0
        else
          Result := False;
      finally
        CloseHandle(TokenHandle);
      end;
    end
    else
      Result := False;
  end
  else
    Result := IsAdministrator;
end;

end.

