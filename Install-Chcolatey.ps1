function Install-Chocolatey
{
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

    iex Get-WebContent (New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/install.ps1")
}