; ============================================================
; Koda Alpha v0.34 -- Windows Installer
; GryphonHeart LLC
;
; Build sequence (run from this project's root, where pubspec.yaml lives):
;   1. flutter create --platforms=windows --org com.gryphonheart --project-name koda .
;   2. (overwrite pubspec.yaml and lib/ with the files from this package)
;   3. flutter pub get
;   4. flutter build windows --release --build-name=0.34.0 --build-number=1
;   5. makensis KodaSetup.nsi
; ============================================================

Unicode True

!include "MUI2.nsh"

Name "Koda"
OutFile "KodaSetup-Windows.exe"
InstallDir "$PROGRAMFILES64\Koda"
InstallDirRegKey HKCU "Software\GryphonHeart\Koda" "InstallDir"
RequestExecutionLevel admin

VIProductVersion "0.34.0.0"
VIAddVersionKey "ProductName"     "Koda"
VIAddVersionKey "CompanyName"     "GryphonHeart LLC"
VIAddVersionKey "LegalCopyright"  "(C) 2024 GryphonHeart LLC"
VIAddVersionKey "FileDescription" "Koda Installer"
VIAddVersionKey "FileVersion"     "0.34.0.0"
VIAddVersionKey "ProductVersion"  "0.34.0 Alpha"

!define MUI_ABORTWARNING
!define MUI_WELCOMEPAGE_TITLE "Welcome to Koda Alpha v0.34"
!define MUI_WELCOMEPAGE_TEXT "Koda is a privacy-first community platform for gamers and creators.$\r$\n$\r$\nThis wizard will install Koda Alpha v0.34 on your computer."
!define MUI_DIRECTORYPAGE_TEXT_TOP "Choose where to install Koda. You can install to any drive or folder -- type a full path including drive letter (e.g. D:\Koda) or click Browse."
!define MUI_FINISHPAGE_RUN "$INSTDIR\koda.exe"
!define MUI_FINISHPAGE_RUN_TEXT "Launch Koda"
!define MUI_FINISHPAGE_LINK "koda.fyi"
!define MUI_FINISHPAGE_LINK_LOCATION "https://koda.fyi"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "English"

Section "Koda" SecMain
  SectionIn RO
  SetOutPath "$INSTDIR"
  File /r "build\windows\x64\runner\Release\*.*"

  WriteUninstaller "$INSTDIR\Uninstall.exe"
  WriteRegStr HKCU "Software\GryphonHeart\Koda" "InstallDir" "$INSTDIR"

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Koda" "DisplayName" "Koda"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Koda" "DisplayVersion" "0.34.0 Alpha"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Koda" "Publisher" "GryphonHeart LLC"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Koda" "UninstallString" "$\"$INSTDIR\Uninstall.exe$\""
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Koda" "DisplayIcon" "$INSTDIR\koda.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Koda" "URLInfoAbout" "https://koda.fyi"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Koda" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Koda" "NoRepair" 1

  CreateShortcut "$DESKTOP\Koda.lnk" "$INSTDIR\koda.exe" "" "$INSTDIR\koda.exe" 0
  CreateDirectory "$SMPROGRAMS\Koda"
  CreateShortcut "$SMPROGRAMS\Koda\Koda.lnk" "$INSTDIR\koda.exe" "" "$INSTDIR\koda.exe" 0
  CreateShortcut "$SMPROGRAMS\Koda\Uninstall Koda.lnk" "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete "$DESKTOP\Koda.lnk"
  Delete "$SMPROGRAMS\Koda\Koda.lnk"
  Delete "$SMPROGRAMS\Koda\Uninstall Koda.lnk"
  RMDir "$SMPROGRAMS\Koda"
  RMDir /r "$INSTDIR"
  DeleteRegKey HKCU "Software\GryphonHeart\Koda"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Koda"
SectionEnd
