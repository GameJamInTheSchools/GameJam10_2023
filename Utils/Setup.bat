@echo off

if "%1"=="" (
    echo Please provide the team name as a parameter.
    exit /b 1
)

set TEAM_NAME=%1

echo Initializing git repository...
git init

echo Adding remote origin...
git remote add origin https://github.com/GameJamInTheSchools/GameJam10_2023.git

echo Setting up sparse-checkout for team $TEAM_NAME%...
git sparse-checkout set GameJam_%TEAM_NAME%

echo Pulling changes from main branch...
git pull origin main

echo Setup complete!