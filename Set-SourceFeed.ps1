function Set-SourceFeed($name,$feed)
{
    choco source add -s=@($feed) -n=$name 

    choco source disable -n=chocolatey
}