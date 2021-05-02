Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Software
choco install microsoft-edge -y
choco install obs-studio -y
choco install obs-ndi -y
choco install skype -y


#Assign Packages to Install
$Packages = 'googlechrome',`
            'vscode --version=1.36.1',`
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
Restart-Computer -Force

