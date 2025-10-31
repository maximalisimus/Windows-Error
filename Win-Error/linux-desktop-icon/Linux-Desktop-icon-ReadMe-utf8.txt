
Shutdown.desktop
[Desktop Entry]
Exec=/home/mikl/programs/shutdown-poweroff.sh
Type=Application
Name=Shutdown
Terminal=false
Icon=/home/mikl/programs/poweroff-icon.png
 
Reboot.desktop
[Desktop Entry]
Exec=/home/mikl/programs/shutdown-reboot.sh
Type=Application
Name=Reboot
Terminal=false
Icon=/home/mikl/programs/reboot-icon.png
StartupNotify=false
 
7zFM.desktop
[Desktop Entry]
Exec=/home/mikl/programs/7zFM/7zFm.sh
Type=Application
Name=7zFM
Terminal=false
Icon=/home/mikl/programs/7zFM/7zfm-icon.png
 
7zFm.sh
#!/bin/bash
cd "/home/mikl/.wine/drive_c/Program Files/7-Zip/"
wine "./7zFM.exe"
 
 
Google Chrome
/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=/app/bin/chrome --file-forwarding com.google.Chrome @@u %U @@
 
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 
 
 
 
 
 



