# Description: Boxstarter Script
# Author: Microsoft
# chocolatey fest demo

Disable-UAC
$ConfirmPreference = "None" #ensure installing powershell modules don't prompt on needed dependencies

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$strpos = $helperUri.LastIndexOf("/demos/")
$helperUri = $helperUri.Substring(0, $strpos)
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "FileExplorerSettings.ps1";
executeScript "SystemConfiguration.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "CommonDevTools.ps1";
executeScript "Browsers.ps1";

executeScript "HyperV.ps1";
RefreshEnv
executeScript "WSL.ps1";
RefreshEnv
executeScript "Docker.ps1";

choco install powershell-core
choco install azure-cli
Install-Module -Force Az
Install-Module -Force posh-git
choco install microsoftazurestorageexplorer

# Install tools in WSL instance
write-host "Installing tools inside the WSL distro..."
Ubuntu1804 run apt install ansible -y
Ubuntu1804 run apt install nodejs -y

# personalize
choco install microsoft-teams
choco install office365business

# checkout recent projects
mkdir C:\github
cd C:\github
git.exe clone https://github.com/microsoft/windows-dev-box-setup-scripts
git.exe clone https://github.com/microsoft/winappdriver
git.exe clone https://github.com/microsoft/wsl
git.exe clone https://github.com/PowerShell/PowerShell

Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
