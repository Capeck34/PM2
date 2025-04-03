@echo off
echo WARNING! Multiplayer is very experimental. Play with people on the same router for the best results.
pause
:: Fetch list of IWADs from basegames folder
echo Available IWADs:
for /f "delims=" %%i in ('dir /b basegames\*.ipk3 basegames\*.wad 2^>nul') do echo %%i

:: Prompt player to select an IWAD
set /p iwad=Enter the IWAD filename (including extension) from the list above: 

:: Prompt for joining or hosting
set /p choice=Do you want to (J)oin or (H)ost a server? 
if /i "%choice%"=="J" goto join
if /i "%choice%"=="H" goto host

echo Invalid choice. Exiting.
goto end

:join
set /p server_hostname=Enter the hostname the host gave you: 
start "" "engine\gzdoom.exe" -iwad basegames\%iwad% -file engine\enginemod.pk3 -join %server_hostname%
goto end

:host
set /p server_map=Enter the map you want to play on: 
set /p server_players=Enter the exact number of players playing: 
start "" "engine\gzdoom.exe" -file engine\enginemod.pk3 -iwad basegames\%iwad% +map %server_map% -host %server_players% -deathmatch -netmode 0 +sv_cheats 1 +dmflags 8

goto end

:end
