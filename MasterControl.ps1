$BlobUri = ’https://thorneintuneresources.blob.core.windows.net/files/MasterControl.ico’
$Sas = ’?sv=2023-01-03&st=2024-06-06T13%3A38%3A37Z&se=2054-12-07T14%3A44%3A00Z&sr=b&sp=r&sig=Dx88I1ncU6IB4Z8EqQzUdUHa%2BgS43i72G5%2B8XSgc4M0%3D’
#Output Path with \ on the end
$OutputPath = ’C:\ProgramData\’



#Gets full Uri
$FullUri = "$BlobUri$Sas"
#Downloads file to outpath with correct file type and file found in BlobURI
(New-Object System.Net.WebClient).DownloadFile($FullUri, $OutputPath + ($BlobUri -split ’/’)[-1])


Start-Sleep -Seconds 5

$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut("C:\Users\Public\Desktop\Master Control.lnk")
$ShortCut.TargetPath="https://thorne.mastercontrol.com/thorne/login/index.cfm?initialRequest=%2Fthorne%2F"
$ShortCut.IconLocation = "C:\ProgramData\MasterControl.ico, 0";
$ShortCut.Save()