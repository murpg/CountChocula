#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'vscode',`
            'jdk8',`
            'certifytheweb',`
            'git.install'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Install IIS
Add-WindowsFeature Web-Asp-Net45; Add-WindowsFeature NET-Framework-45-Core; Add-WindowsFeature Web-Net-Ext45; Add-WindowsFeature NET-WCF-Services45;Add-WindowsFeature NET-WCF-HTTP-Activation45;Add-WindowsFeature NET-WCF-MSMQ-Activation45;Add-WindowsFeature NET-WCF-Pipe-Activation45;Add-WindowsFeature NET-WCF-TCP-Activation45; Add-WindowsFeature Web-ISAPI-Ext; Add-WindowsFeature Web-ISAPI-Filter; Add-WindowsFeature Web-CGI; Add-WindowsFeature Web-Mgmt-Console; Add-WindowsFeature Web-Mgmt-Compat,Web-Lgcy-Mgmt-Console; Add-WindowsFeature Web-Scripting-Tools; Add-WindowsFeature Search-Service; Add-WindowsFeature Web-Filtering; Add-WindowsFeature Web-Basic-Auth; Add-WindowsFeature Web-Default-Doc; Add-WindowsFeature Web-Http-Errors; Add-WindowsFeature Web-Static-Content;

#Grab Module
Import-Module WebAdministration;

#Install Additional Provisions
choco install urlrewrite -y;
choco install iis-arr -y;
choco install webpi -y;
choco install commandbox -y;
choco install conemu --version=16.12.6.0 -y;

# Install Windows Update Module (only needed once). You'll be prompted to approve the untrusted repository
Install-Module PSWindowsUpdate 

# Get and install Windows Updates. To get or install individual updates, use parameter -KBArticleID (e.g. 'Install-WindowsUpdate -KBArticleID KB1234567')
Get-WindowsUpdate
Install-WindowsUpdate -AcceptAll -AutoReboot

