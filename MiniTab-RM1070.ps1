$BlobUri = ’https://thorneintuneresources.blob.core.windows.net/files/ICO/MiniTab-RM1070.ico’
$Sas = ’?sv=2023-01-03&st=2024-11-07T16%3A34%3A13Z&se=2031-12-08T10%3A34%3A00Z&sr=b&sp=r&sig=J2MkWv%2FB6%2Bcw9VVyP%2FpumHXMZJBQNNg33G8zKEscLZE%3D’
#Output Path with \ on the end
$OutputPath = ’C:\ProgramData\’



#Gets full Uri
$FullUri = "$BlobUri$Sas"
#Downloads file to outpath with correct file type and file found in BlobURI
(New-Object System.Net.WebClient).DownloadFile($FullUri, $OutputPath + ($BlobUri -split ’/’)[-1])


Start-Sleep -Seconds 5

$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut("C:\Users\Public\Desktop\MMiniTab RM1070.lnk")
$ShortCut.TargetPath="https://spc.minitab.com/spc/operations/station/5/"
$ShortCut.IconLocation = "C:\ProgramData\MiniTab_RM1070.ico, 0";
$ShortCut.Save()