#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'vscode',`
            'jdk8',`
            'commandbox',`
            'git.install',`
            'bitvise-ssh-server'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Install IIS
Add-WindowsFeature Web-Asp-Net45; Add-WindowsFeature NET-Framework-45-Core; Add-WindowsFeature Web-Net-Ext45; Add-WindowsFeature NET-WCF-Services45;Add-WindowsFeature NET-WCF-HTTP-Activation45;Add-WindowsFeature NET-WCF-MSMQ-Activation45;Add-WindowsFeature NET-WCF-Pipe-Activation45;Add-WindowsFeature NET-WCF-TCP-Activation45; Add-WindowsFeature Web-ISAPI-Ext; Add-WindowsFeature Web-ISAPI-Filter; Add-WindowsFeature Web-CGI; Add-WindowsFeature Web-Mgmt-Console; Add-WindowsFeature Web-Mgmt-Compat,Web-Lgcy-Mgmt-Console; Add-WindowsFeature Web-Scripting-Tools; Add-WindowsFeature Search-Service; Add-WindowsFeature Web-Filtering; Add-WindowsFeature Web-Basic-Auth; Add-WindowsFeature Web-Default-Doc; Add-WindowsFeature Web-Http-Errors; Add-WindowsFeature Web-Static-Content;

#Grab Module
Import-Module WebAdministration;

#Remove Default Web Site
Get-Website | Remove-Website;

#Create Web Site Directory
New-Item C:\inetpub\wwwroot\websites\pms-es -ItemType Directory;

#Make New Web SIte
New-WebSite -Name pms-es -Port 80 -HostHeader pmses.devmilnet.com -PhysicalPath "$env:systemdrive\inetpub\wwwroot\websites\pms-es";
Get-WebBinding;
(Get-Website -Name 'pms-es').bindings.Collection;
New-WebBinding -Name 'pms-es' -IPAddress * -Port 443 -Protocol https;

#Create Self Signed Certificate
$cert = New-SelfSignedCertificate -CertStoreLocation 'Cert:\LocalMachine\My' -DnsName 'pmses.devmilnet.com';
$certPath = "Cert:\LocalMachine\My\$($cert.Thumbprint)";
$providerPath = 'IIS:\SSLBindings\0.0.0.0!443';
Get-Item $certPath | New-Item $providerPath;

#Install Additional Provisions
choco install urlrewrite -y;
choco install iis-arr -y;
choco install webpi -y;
choco install conemu --version=16.12.6.0 -y;
Restart-Computer -Force
