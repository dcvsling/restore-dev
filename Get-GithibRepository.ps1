function Get-GithubRepository($url) 
{
    cinst git -yf;

    git clone $url;
}