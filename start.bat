@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Server 2019" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat
net user administrator @malyc220 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo ¡Instalado exitosamente! Si el RDP está muerto, por favor reconstruya nuevamente ¡Ok!
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "No se puede obtener el túnel NGROK, asegúrese de que NGROK_AUTH_TOKEN sea correcto en Configuración> Secretos> Secreto del repositorio. Tal vez su VM anterior todavía se esté ejecutando: https://dashboard.ngrok.com/status/tunnels"
echo Username: administrator
echo Password: YoutubeMalyc
echo Inicie sesión en su RDP ahora
ping -n 10 127.0.0.1 >nul
