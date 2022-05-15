:: Config image Codec

echo off
title Codecs Installer


:: Associate with files

reg import "image.reg"
reg import "video.reg"
reg import "audio.reg"
reg import "prog_pc.reg"

:: UWP Codecs
FOR %%f IN (UWP\*.Appx) DO "powershell.exe" Add-AppxPackage %%f
FOR %%f IN (UWP\*.AppxBundle) DO "powershell.exe" Add-AppxPackage %%f



:: Remove Windows Thing
"powershell.exe" "get-appxpackage -AllUsers *zunevideo* | Remove-AppxPackage"
"powershell.exe" "get-appxpackage -AllUsers *zunemusic* | Remove-AppxPackage"
"powershell.exe" "get-appxpackage -AllUsers *photos* | Remove-AppxPackage"



:: Image Codec
"image\FastPictureViewerCodecPack_setup_3.8.0.97.msi" /qn /norestart
"image\FastPictureViewerCodecPack64_setup_3.8.0.97.msi" /qn /norestart
"image\svg_see_x64.exe" /VERYSILENT /NOICONS


:: Config System Format Codec

"systemfileformat\Ext2Fsd-0.69.exe" /Silent
"systemfileformat\HFS4Win.msi" /QN /NORESTART

:: Install Multimedia Codecs
"multimedia\Install Blackmagic RAW v2.2.1.msi" /QN /NORESTART
"multimedia\ac3filter_2_6_0b.exe" /Silent
"multimedia\atrac3.exe" /s
"multimedia\intel_libmfxsw_2018r2.exe" /Silent
"multimedia\LagarithSetup_1327.exe" /Silent
"multimedia\on2_vp7_personal_edition.exe" /s "/qn"
"multimedia\ProResRAW.msi" /qn /norestart
"multimedia\RealMedia_Splitter.exe" /Silent
"multimedia\utvideo-23.0.0-win.exe" /silent
"multimedia\vp4personal-4-0-20-25.exe" /s /v"/qn"
"multimedia\vp6_decoder.exe"
"multimedia\vp8vfw-setup-1.2.0.exe" /silent
"multimedia\YV12QuickTimeCodecSetup.msi" /qn /norestart


:: Copying files
xcopy "files_to_copy\IrfanView" "C:\Program Files\IrfanView" /y /e /h /c /i
xcopy "files_to_copy\Multimedia_player"  "C:\Program Files (x86)\K-Lite Codec Pack\MPC-HC64" /y /E /H /C /I
xcopy "files_to_copy\VideoLAN" "C:\Program Files\VideoLAN" /y /e /h /c /i
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AC3Filter"
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Blackmagic Design"
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Blue Ripple Sound"
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ut Video Codec Suite"
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\On2 Technologies"
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Paragon HFS+ for Windows"
rmdir /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Unthinkable Research LLC"