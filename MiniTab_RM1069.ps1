#remove masterControl.ico file from ProgramData
Remove-Item "C:\ProgramData\MasterControl.ico"

#Remove desktop icon from the Public Desktop
Remove-Item "C:\Users\Public\Desktop\Master Control.lnk"


$BlobUri = ’https://thorneintuneresources.blob.core.windows.net/files/ICO/MiniTab_RM1069.ico’
$Sas = ’??sv=2023-01-03&st=2024-11-07T15%3A57%3A30Z&se=2038-12-08T15%3A01%3A00Z&sr=b&sp=r&sig=T0n4tf3voR7WeC3NCKKVNyi4ODGYWvyU1suGf98iNtw%3D’
#Output Path with \ on the end
$OutputPath = ’C:\ProgramData\’



#Gets full Uri
$FullUri = "$BlobUri$Sas"
#Downloads file to outpath with correct file type and file found in BlobURI
(New-Object System.Net.WebClient).DownloadFile($FullUri, $OutputPath + ($BlobUri -split ’/’)[-1])


Start-Sleep -Seconds 5

$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut("C:\Users\Public\Desktop\MMiniTab_RM1069.lnk")
$ShortCut.TargetPath="https://spc.minitab.com/spc/operations/station/2/"
$ShortCut.IconLocation = "C:\ProgramData\MiniTab RM1069.ico, 0";
$ShortCut.Save()