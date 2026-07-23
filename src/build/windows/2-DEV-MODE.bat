@echo off
title Scale Space Synth - Dev Mode
echo.
echo ============================================
echo   SCALE SPACE SYNTH - DEV MODE
echo ============================================
echo.
echo Starting the live editor server.
echo Your browser should open automatically in a few seconds.
echo.
echo Edit src\app.js or src\app.css with any text editor.
echo Save the file. Browser refreshes by itself.
echo.
echo To stop: close this window.
echo ============================================
echo.

set "PACKAGE_MANAGER=npm.cmd"
where npm >nul 2>nul
if errorlevel 1 (
  set "PACKAGE_MANAGER=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\bin\fallback\pnpm.cmd"
  if not exist "%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\bin\fallback\pnpm.cmd" (
    echo ERROR: Node.js was not found on PATH and the Codex runtime is unavailable.
    echo Install the Node.js LTS release from https://nodejs.org.
    pause
    exit /b 1
  )
  set "PATH=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin;%PATH%"
  echo Using the Node.js runtime bundled with Codex.
)

cd /d "%~dp0..\.."

if not exist "node_modules" (
  echo It looks like you haven't run 1-INSTALL.bat yet.
  echo Doing that for you now...
  echo.
  call "%PACKAGE_MANAGER%" install
  if errorlevel 1 (
    echo Install failed. Check your internet connection.
    pause
    exit /b 1
  )
)

call "%PACKAGE_MANAGER%" run dev
pause
