#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'vscode',`
            'commandbox',`
            'git.install',`
            'vscode-docker',`
            'conemu',`
            'docker-desktop'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Reboot
Add-LocalGroupMember -Group "Docker-users" -Member "dbgAdmin"
Restart-Computer -Force
