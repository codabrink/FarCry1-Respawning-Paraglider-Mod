!include "ZipDLL.nsh" 

SetCompressor /FINAL lzma
Name "Paraglider Mod"
OutFile "ParagliderMod.exe"
InstallDirRegKey HKLM "Software\WOW6432Node\GOG.com\Games\1207658750" "Path"

RequestExecutionLevel user

Page directory
Page instfiles

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
SectionEnd