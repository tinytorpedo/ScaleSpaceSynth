@echo off
title Scale Space Synth - First Time Setup
echo.
echo ============================================
echo   SCALE SPACE SYNTH - FIRST TIME SETUP
echo ============================================
echo.
echo This downloads the libraries the project needs.
echo You only ever do this ONCE.
echo It takes about a minute.
echo.

set "PACKAGE_MANAGER=npm.cmd"
where npm >nul 2>nul
if errorlevel 1 (
  set "PACKAGE_MANAGER=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\bin\fallback\pnpm.cmd"
  if not exist "%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\bin\fallback\pnpm.cmd" (
    echo.
    echo ERROR: Node.js was not found on PATH and the Codex runtime is unavailable.
    echo Install the Node.js LTS release from https://nodejs.org and run this again.
    echo.
    pause
    exit /b 1
  )
  set "PATH=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin;%PATH%"
  echo Using the Node.js runtime bundled with Codex.
)

echo Working...
echo.
cd /d "%~dp0..\.."
call "%PACKAGE_MANAGER%" install

if errorlevel 1 (
  echo.
  echo Something went wrong. Scroll up to see what.
  echo Most common cause: no internet, or a firewall blocking npm.
  pause
  exit /b 1
)

echo.
echo ============================================
echo   DONE.
echo ============================================
echo.
echo Next: double-click 2-DEV-MODE.bat to start editing,
echo or 3-MAKE-BUILD.bat to make a shareable HTML file.
echo.
echo You can close this window.
pause
