#Install Chocolatey

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'vscode',`
            'commandbox',`
            'jdk8',`
            'git.install',`
            'vscode-docker',`
            'zoom',`
            'conemu'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Reboot 
Restart-Computer -Force
