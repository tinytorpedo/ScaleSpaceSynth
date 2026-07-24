@echo off
title Scale Space Synth - Make Build
echo.
echo ============================================
echo   SCALE SPACE SYNTH - MAKE BUILD
echo ============================================
echo.
echo Bundling everything into a single HTML file
echo that anyone can double-click to run.
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
  echo Running first-time setup for you...
  echo.
  call "%PACKAGE_MANAGER%" install
  if errorlevel 1 (
    echo Install failed. Check your internet connection.
    pause
    exit /b 1
  )
)

echo.
call "%PACKAGE_MANAGER%" run build

if errorlevel 1 (
  echo.
  echo Build failed. Scroll up to see why.
  pause
  exit /b 1
)

echo.
echo ============================================
echo   DONE.
echo ============================================
echo.
echo Your shareable file is at:
echo   dist\index.html
echo.
echo Opening that folder for you now...
start "" "%~dp0..\..\..\dist"
echo.
echo You can close this window.
pause
