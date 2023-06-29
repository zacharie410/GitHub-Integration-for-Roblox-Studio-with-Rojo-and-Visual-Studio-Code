::This script installs foreman, rojo, and wally

@echo off
:: Elevate script to run as administrator
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto BatchStart)

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\GetAdmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\GetAdmin.vbs"
"%temp%\GetAdmin.vbs"
exit /B

:BatchStart

set "downloadUrl=https://github.com/Roblox/foreman/releases/latest/download/foreman-win64.zip"
set "installDir=%ProgramFiles%\foreman"

:: Check if Foreman is already installed
if exist "%installDir%\foreman.exe" (
  echo Foreman is already installed in the Program Files directory.
  echo Removing previous foreman installation...
  rmdir /s /q "%installDir%"
  if exist "%USERPROFILE%\.foreman" (
    rmdir /s /q "%USERPROFILE%\.foreman"
  )
)

echo Downloading Foreman...
powershell -Command "Invoke-WebRequest -Uri '%downloadUrl%' -OutFile 'foreman-win64.zip'"

echo Extracting Foreman...
powershell -Command "Add-Type -A 'System.IO.Compression.FileSystem'; [System.IO.Compression.ZipFile]::ExtractToDirectory('foreman-win64.zip', '%installDir%')"

echo Running Foreman installer...
start "" "%installDir%\foreman.exe"

echo Please wait while Foreman is being installed...
timeout /t 5 >nul

echo Configuring environment variables...
:: Check if Path environment variable already contains installDir
set "newPath=%Path%;%ProgramFiles%\foreman;%USERPROFILE%\.foreman\bin"
:: Check if the existingPath contains the installDir
echo %Path% | findstr /i "%USERPROFILE%\.foreman\bin" > nul
if "%errorlevel%"=="0" (
  echo Foreman environment variables already exist.
) else (
  echo Foreman environment variables do not exist. Adding them...

  powershell -Command "Start-Process cmd.exe -ArgumentList '/C setx Path ""%newPath%""' -Verb RunAs"
)

echo Foreman installation completed successfully!
echo Installing rojo and wally

set "foremanTomlPath=%USERPROFILE%\.foreman\foreman.toml"
set "tempFile=%TEMP%\foreman_temp.toml"

:: Set the GitHub repository URL
set "rojoRepoUrl=https://api.github.com/repos/rojo-rbx/rojo/releases/latest"
set "wallyRepoUrl=https://api.github.com/repos/UpliftGames/wally/releases/latest"
:: Get Rojo data
:: Fetch release information using the GitHub API
curl -s "%rojoRepoUrl%" > release.json

:: Parse the JSON response to get the latest version
for /f "usebackq tokens=1,2 delims=:," %%G in (`type release.json ^| findstr /C:"tag_name"`) do (
    set "rojoVersion=%%~H"
)

:: Clean up the temporary JSON file
del release.json
:: Now Wally
:: Fetch release information using the GitHub API
curl -s "%wallyRepoUrl%" > release.json

:: Parse the JSON response to get the latest version
for /f "usebackq tokens=1,2 delims=:," %%G in (`type release.json ^| findstr /C:"tag_name"`) do (
    set "wallyVersion=%%~H"
)

:: Clean up the temporary JSON file
del release.json

:: Output the latest version
set "rojoVersion=%rojoVersion:~3,5%"
set "wallyVersion=%wallyVersion:~3,5%"

echo The latest version of Rojo is: %rojoVersion%
echo The latest version of Wally is: %wallyVersion%


:: Check if the foreman.toml file exists
if exist "%foremanTomlPath%" (
    :: Copy the original file to a temporary file
    copy "%foremanTomlPath%" "%tempFile%" /Y > nul
    
    :: Replace or add the desired configuration in the temporary file
    findstr /v /c:"rojo = { source = \"rojo-rbx/rojo\", version = \"%rojoVersion%\" }" "%tempFile%" > "%foremanTomlPath%"
    echo rojo = { source = "rojo-rbx/rojo", version = "%rojoVersion%" } >> "%foremanTomlPath%"
    
    findstr /v /c:"wally = { source = \"UpliftGames/wally\", version = \"%wallyVersion%\" }" "%foremanTomlPath%" > "%tempFile%"
    echo wally = { source = "UpliftGames/wally", version = "%wallyVersion%" } >> "%tempFile%"
    
    :: Replace the original file with the modified temporary file
    move /Y "%tempFile%" "%foremanTomlPath%" > nul
    
    echo foreman.toml file updated successfully.
) else (
    echo foreman.toml file not found.
)

foreman install
foreman list

echo foreman, rojo, and wally installed successfully!
echo Test your installation by running foreman list
pause