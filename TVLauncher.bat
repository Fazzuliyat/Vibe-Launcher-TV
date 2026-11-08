@echo off
title Vibe Launcher TV
cd /d "%~dp0"

:: Activate virtual environment

call venv\Scripts\activate.bat

:: Run Launcher in the venv
python TvLauncher_Windows.py

:: Keep window open
pause
