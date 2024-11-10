#remove masterControl.ico file from ProgramData
Remove-Item "C:\ProgramData\MasterControl.ico"

#Remove desktop icon from the Public Desktop
Remove-Item "C:\Users\Public\Desktop\Master Control.lnk"

$BlobUri = ’https://thorneintuneresources.blob.core.windows.net/files/ICO/MiniTab_RM1071.ico’
$Sas = ’?sv=2023-01-03&st=2024-11-07T16%3A00%3A13Z&se=2035-12-08T08%3A00%3A00Z&sr=b&sp=r&sig=7Zn8cEXP4K%2F9KVMZJ0zACOI5ihhCHb3E0duet7rewM0%3D’
#Output Path with \ on the end
$OutputPath = ’C:\ProgramData\’



#Gets full Uri
$FullUri = "$BlobUri$Sas"
#Downloads file to outpath with correct file type and file found in BlobURI
(New-Object System.Net.WebClient).DownloadFile($FullUri, $OutputPath + ($BlobUri -split ’/’)[-1])


Start-Sleep -Seconds 5

$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut("C:\Users\Public\Desktop\MMiniTab RM1071.lnk")
$ShortCut.TargetPath="https://spc.minitab.com/spc/operations/station/8/"
$ShortCut.IconLocation = "C:\ProgramData\MiniTab_RM1071.ico, 0";
$ShortCut.Save()