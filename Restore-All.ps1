function Restore-All([string[]] $packs = @())
{
    clist --idonly | Where-Object { ($packs.Length -eq 0) -or ($packs -contains $_) } | ForEach-Object { cinst $_ -yf }
}