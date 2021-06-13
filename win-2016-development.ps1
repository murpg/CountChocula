Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Software
choco install microsoft-edge -y

#Assign Packages to Install
$Packages = 'googlechrome',`
            'vscode',`
            'adoptopenjdk11',`
            'git.install'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Install IIS
Add-WindowsFeature Web-Asp-Net45; Add-WindowsFeature NET-Framework-45-Core; Add-WindowsFeature Web-Net-Ext45; Add-WindowsFeature NET-WCF-Services45;Add-WindowsFeature NET-WCF-HTTP-Activation45;Add-WindowsFeature NET-WCF-MSMQ-Activation45;Add-WindowsFeature NET-WCF-Pipe-Activation45;Add-WindowsFeature NET-WCF-TCP-Activation45; Add-WindowsFeature Web-ISAPI-Ext; Add-WindowsFeature Web-ISAPI-Filter; Add-WindowsFeature Web-CGI; Add-WindowsFeature Web-Mgmt-Console; Add-WindowsFeature Web-Mgmt-Compat,Web-Lgcy-Mgmt-Console; Add-WindowsFeature Web-Scripting-Tools; Add-WindowsFeature Search-Service; Add-WindowsFeature Web-Filtering; Add-WindowsFeature Web-Basic-Auth; Add-WindowsFeature Web-Default-Doc; Add-WindowsFeature Web-Http-Errors; Add-WindowsFeature Web-Static-Content;

#Grab Module
Import-Module WebAdministration;

#Installs iis-administration module
Install-WindowsFeature web-mgmt-console;

#Install Additional Provisions
choco install urlrewrite -y;
choco install iis-arr -y;
choco install webpi -y;
choco install cmder -y;

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\Users\dbgAdmin\Desktop\Cmder.lnk")
$Shortcut.TargetPath = "C:\tools\Cmder\Cmder.exe"
$Shortcut.Save()

cd "C:\tools\Cmder\bin"
Invoke-WebRequest -Uri "https://s3.amazonaws.com/downloads.ortussolutions.com/ortussolutions/commandbox/5.4.0-alpha/commandbox-jre-win64-5.4.0-alpha.zip" -OutFile "commandbox-jre-win64-5.4.0-alpha.zip";
Expand-Archive -Path "C:\tools\Cmder\bin\commandbox-jre-win64-5.4.0-alpha.zip" -DestinationPath "C:\tools\Cmder\bin";
Remove-Item -Path "C:\tools\Cmder\bin\commandbox-jre-win64-5.4.0-alpha.zip" -Force;

Restart-Computer -Force
