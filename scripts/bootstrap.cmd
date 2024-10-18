@echo off
setlocal

:askToActivate
echo Do you want to activate windows? (Y/N)
set /p userInput=

if /i "%userInput%"=="Y" (
    echo Continuing with the script execution...
    call :activateWindows
    goto askToInstallApps
) else if /i "%userInput%"=="N" (
    echo Ending the script.
    goto askToInstallApps
) else (
    echo Invalid input. Please enter Y or N.
    goto askToActivate
)

:askToInstallApps
echo Do you want to install applications? (Y/N)
set /p userInput=

if /i "%userInput%"=="Y" (
    echo Continuing with the script execution...
    call :installApps
    goto end
) else if /i "%userInput%"=="N" (
    echo Ending the script.
    goto end
) else (
    echo Invalid input. Please enter Y or N.
    goto askToInstallApps
)

:activateWindows
echo @REM! KEYS: 
echo @REM? W269N-WFGWX-YVC9B-4J6C9-T83GX
echo @REM? NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
echo slmgr /ipk VK7JG-NPHTM-C97JM-9MPGT-3V66T

echo @REM! BACKUP SERVER: kms.msguides.com 
echo slmgr /skms kms.digiboy.ir

echo slmgr /ato

goto :eof

:installApps
set apps=(
    "Microsoft.VisualStudioCode"
    "Google.Chrome"
    "Mozilla.Firefox"
    "7zip.7zip"
    "Notepad++.Notepad++"
)

for %%i in %apps% do (
    echo Installing %%i...
    echo winget install %%i --silent --accept-package-agreements --accept-source-agreements
)

echo Installation completed.
pause

goto :eof

:end
endlocal