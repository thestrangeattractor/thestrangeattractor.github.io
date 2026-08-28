@echo off
setlocal EnableDelayedExpansion

echo ========================================
echo   TENEBRAE - Push to GitHub Pages
echo ========================================
echo.

set /p GH_USER="Enter your GitHub username: "

if "%GH_USER%"=="" (
    echo ERROR: GitHub username is required.
    pause
    exit /b 1
)

cd /d C:\Users\Admin\Documents\kimi\workspace\tenebrae-jekyll

echo.
echo Setting remote origin...
git remote add origin https://github.com/%GH_USER%/%GH_USER%.github.io.git

echo.
echo Pushing to GitHub...
git push -u origin main

echo.
echo ========================================
echo   Done! Next steps:
echo ========================================
echo.
echo 1. Go to https://github.com/%GH_USER%/%GH_USER%.github.io/settings/pages
echo 2. Under "Source", select "Deploy from a branch"
echo 3. Choose "main" branch, "/ (root)" folder
echo 4. Click Save
echo.
echo Your blog will be live at:
echo   https://%GH_USER%.github.io
echo.
pause
