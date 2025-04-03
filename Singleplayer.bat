@echo off
:: Fetch list of IWADs from basegames folder
echo Available IWADs:
for /f "delims=" %%i in ('dir /b basegames\*.ipk3 basegames\*.wad 2^>nul') do echo %%i

:: Prompt player to select an IWAD
set /p iwad=Enter the IWAD filename (including extension) from the list above: 

engine\gzdoom.exe -iwad basegames\%iwad% -file engine\enginemod.pk3 +dmflags 8