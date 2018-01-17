
function Restore-Start($name,$source)
{
    if($name -eq '') 
    {
        return;
    }
    if(source -eq '')
    {
        $source = "https://github.com/$name/restore-dev/blob/master/settings.json"
    }

    $content = Get-WebContent $source;

    $settings = ConvertFrom-Json -InputObject $content
    
    Install-Chcocolatey

    Get-GithubRepository $settings.git.restore.repo

    Set-SourceFeed -Name $setting.choco.source.name -Feed $setting.choco.source.feed

    Restore-All

    Set-GitEnviroment $settings.git;

}
