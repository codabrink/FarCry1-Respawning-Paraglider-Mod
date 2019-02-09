!include "ZipDLL.nsh" 

!define APPNAME "Far Cry 1 - Paraglider Mod"
!define APPREGNAME "FC1_ParagliderMod"

SetCompressor /FINAL lzma
Name "Paraglider Mod"
OutFile "ParagliderMod.exe"
InstallDirRegKey HKLM "Software\WOW6432Node\GOG.com\Games\1207658750" "Path"

RequestExecutionLevel admin

Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section ""
  IfFileExists $INSTDIR\FCData\Scripts.pak.backup +2 0
  CopyFiles $INSTDIR\FCData\Scripts.pak $INSTDIR\FCData\Scripts.pak.backup

  SetOutPath $TEMP
  File 7za.exe
  File scripts.cmd
  !insertmacro ZIPDLL_EXTRACT "$INSTDIR\FCData\Scripts.pak" "$TEMP\FCData" "<ALL>"
  SetOutPath "$TEMP\FCData\Scripts\Default\Entities\Vehicles"
  File Paraglider.lua
  Delete "$INSTDIR\FCData\Scripts.pak"
  ExecWait "$TEMP\scripts.cmd"
  Rename "$TEMP\Scripts.pak" "$INSTDIR\FCData\Scripts.pak"

  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}" "DisplayName" "${APPNAME}"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}" "UninstallString" '"$INSTDIR\uninstall-paraglider-mod.exe"'
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}" "DisplayIcon" '"$INSTDIR\Bin32\Editor.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}" "NoRepair" 1
  WriteUninstaller "uninstall-paraglider-mod.exe"
SectionEnd

; Uninstaller
Section "Uninstall"
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPREGNAME}"

  Delete "$INSTDIR\FCData\Scripts.pak"
  Rename "$INSTDIR\FCData\Scripts.pak.backup" "$INSTDIR\FCData\Scripts.pak"
SectionEnd