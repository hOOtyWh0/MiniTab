#remove masterControl.ico file from ProgramData
Remove-Item "C:\ProgramData\MasterControl.ico"

#Remove desktop icon from the Public Desktop
Remove-Item "C:\Users\Public\Desktop\Master Control.lnk"


$BlobUri = ’https://thorneintuneresources.blob.core.windows.net/files/ICO/MiniTab_RM1075.ico’
$Sas = ’?sv=2023-01-03&st=2024-11-07T16%3A24%3A56Z&se=2037-12-08T16%3A29%3A00Z&sr=b&sp=r&sig=NK4VbSDCmWali9rbny8ZfZAvXb9DYXyCgsLJIpwIxjg%3D’
#Output Path with \ on the end
$OutputPath = ’C:\ProgramData\’



#Gets full Uri
$FullUri = "$BlobUri$Sas"
#Downloads file to outpath with correct file type and file found in BlobURI
(New-Object System.Net.WebClient).DownloadFile($FullUri, $OutputPath + ($BlobUri -split ’/’)[-1])


Start-Sleep -Seconds 5

$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut("C:\Users\Public\Desktop\MMiniTab RM1075.lnk")
$ShortCut.TargetPath="https://spc.minitab.com/spc/operations/station/9/"
$ShortCut.IconLocation = "C:\ProgramData\MiniTab_RM1075.ico, 0";
$ShortCut.Save()