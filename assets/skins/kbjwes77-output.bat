@echo off

REM ---ASEPRITE EXECUTABLE PATH---
set aseprite="E:\Programs\Aseprite\Aseprite.exe"

REM ---SCRATCH ASE PROJECT PATH---
set ase101="E:\Git\sickparty\assets\skins\scratch.aseprite"

REM ---EXPORT CHARACTERS---
%aseprite% %ase101% -b --sheet scratch_sheet.png --sheet-type rows --sheet-width 1000 --data scratch_info.json --list-tags