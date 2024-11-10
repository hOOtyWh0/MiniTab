#remove masterControl.ico file from ProgramData
	Remove-Item "C:\ProgramData\MasterControl.ico"

#Remove desktop icon from the Public Desktop
	Remove-Item "C:\Users\Public\Desktop\Master Control.lnk"

$BlobUri = ’https://thorneintuneresources.blob.core.windows.net/files/ICO/MiniTab_RM1077.ico’
$Sas = ’?sv=2023-01-03&st=2024-11-07T16%3A31%3A40Z&se=2031-12-08T09%3A36%3A00Z&sr=b&sp=r&sig=drxIJTPS915CMplO3VciOOHJLMqJqUoN2lHMHWsmkqE%3D’
#Output Path with \ on the end
$OutputPath = ’C:\ProgramData\’



#Gets full Uri
$FullUri = "$BlobUri$Sas"
#Downloads file to outpath with correct file type and file found in BlobURI
(New-Object System.Net.WebClient).DownloadFile($FullUri, $OutputPath + ($BlobUri -split ’/’)[-1])


Start-Sleep -Seconds 5

$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut("C:\Users\Public\Desktop\MMiniTab RM1077.lnk")
$ShortCut.TargetPath="https://spc.minitab.com/spc/operations/station/11/"
$ShortCut.IconLocation = "C:\ProgramData\MiniTab_RM1077.ico, 0";
$ShortCut.Save()