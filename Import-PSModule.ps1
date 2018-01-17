function Import-PSModule($path='')
{
    if($path -ne ''){
        Import-Module $path
        return
    } 
    Get-ChildItem .\ | Where-Object { $_.FullName -like '*.ps1' } | ForEach-Object { Import-Module $_.FullName }
}