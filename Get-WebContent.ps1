function Get-WebContent($url) 
{
    return (New-Object System.Net.WebClient).DownloadString($url)
}