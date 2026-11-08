@echo off
:: Starts Vibe Launcher TV without a console window - use this one for autostart.
:: If it ever fails to start, run TVLauncher.bat instead: it keeps the window open and shows the error.
cd /d "%~dp0"
start "" "%~dp0venv\Scripts\pythonw.exe" TvLauncher_Windows.py
