@echo off
for /f %%i in ('hostname') do set serverhost=%%i
echo Your server is hosted on: %serverhost%
echo Share this with your friends so they can join your game.
pause
exit