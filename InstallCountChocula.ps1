#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'vscode',`
            'jdk8',`
            'commandbox',`
            'git.install',`
            'vscode-docker'`

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Reboot
Add-WindowsFeature Web-Asp-Net45;Add-WindowsFeature NET-Framework-45-Core;Add-WindowsFeature Web-Net-Ext45;Add-WindowsFeature Web-ISAPI-Ext;Add-WindowsFeature Web-ISAPI-Filter;Add-WindowsFeature Web-Mgmt-Console;Add-WindowsFeature Web-Scripting-Tools;Add-WindowsFeature Search-Service;Add-WindowsFeature Web-Filtering;Add-WindowsFeature Web-Basic-Auth;Add-WindowsFeature Web-Windows-Auth;Add-WindowsFeature Web-Default-Doc;Add-WindowsFeature Web-Http-Errors;Add-WindowsFeature Web-Static-Content;
New-Item C:\inetpub\wwwroot\websites\pmses -ItemType Directory;
New-WebSite -Name pmses -Port 80 -HostHeader pmses.devmilnet.com -PhysicalPath "$env:systemdrive\inetpub\wwwroot\websites\pmses";
choco install urlrewrite -y;
choco install iis-arr -y;
choco install webpi -y;
choco install conemu --version=16.12.6.0 -y;
Restart-Computer -Force
