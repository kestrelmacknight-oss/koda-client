; Koda Windows Installer Script
; Built with Inno Setup 6.x
; https://jrsoftware.org/isinfo.php
;
; To build:
; 1. Run: flutter build windows --release
; 2. Open this file in Inno Setup Compiler
; 3. Click Build -> Compile
; Output: installer\KodaSetup-0.34.0.exe

#define AppName "Koda"
#define AppVersion "0.34.0"
#define AppPublisher "Kestrel MacKnight / Koda"
#define AppURL "https://koda.fyi"
#define AppExeName "koda.exe"
#define BuildDir "build\windows\x64\runner\Release"

[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={autopf}\{#AppName}
DefaultGroupName={#AppName}
AllowNoIcons=yes
OutputDir=installer
OutputBaseFilename=KodaSetup-{#AppVersion}
SetupIconFile=windows\runner\resources\app_icon.ico
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
; Require Windows 10 or later
MinVersion=10.0
; Request admin for system-wide install
PrivilegesRequired=admin
; Allow per-user install as fallback
PrivilegesRequiredOverridesAllowed=dialog
; Show a nice welcome page
DisableWelcomePage=no
; Uninstall info
UninstallDisplayIcon={app}\{#AppExeName}
UninstallDisplayName={#AppName}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "startupicon"; Description: "Launch Koda when Windows starts"; GroupDescription: "Startup:"; Flags: unchecked

[Files]
; Main executable
Source: "{#BuildDir}\{#AppExeName}"; DestDir: "{app}"; Flags: ignoreversion

; Flutter engine and app data
Source: "{#BuildDir}\flutter_windows.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDir}\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs

; All DLLs in the release folder
Source: "{#BuildDir}\*.dll"; DestDir: "{app}"; Flags: ignoreversion skipifsourcedoesntexist

[Icons]
; Start menu
Name: "{group}\{#AppName}"; Filename: "{app}\{#AppExeName}"
Name: "{group}\Uninstall {#AppName}"; Filename: "{uninstallexe}"
; Desktop shortcut (optional)
Name: "{autodesktop}\{#AppName}"; Filename: "{app}\{#AppExeName}"; Tasks: desktopicon
; Startup (optional)
Name: "{userstartup}\{#AppName}"; Filename: "{app}\{#AppExeName}"; Tasks: startupicon

[Run]
; Launch Koda after install
Filename: "{app}\{#AppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
; Clean up any user data Koda creates in AppData on uninstall (optional -- comment out to preserve user data)
; Type: filesandordirs; Name: "{localappdata}\koda"

[Code]
function InitializeSetup(): Boolean;
begin
  Result := True;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ResultCode: Integer;
begin
  if CurStep = ssInstall then
  begin
    Exec('taskkill', '/F /IM koda.exe', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
  end;
end;