if (-Not (Get-Command sqlcmd))
{
    Exit
}
if (-Not (Test-Path -Path ./logs ))
{
    New-Item -ItemType directory -Path ./logs
}
$directoryInfo = Get-ChildItem ./logs | Measure-Object
if ($directoryInfo.Count)
{
    Remove-Item ./logs/* -Recurse
}
sqlcmd -S . -E -i .\sql\setup.sql
Start-Process -FilePath 'sqlcmd.exe' -ArgumentList '-S . -d TestDb -E -i .\sql\session1.sql -o .\logs\session1.txt'
Start-Process -FilePath 'sqlcmd.exe' -ArgumentList '-S . -d TestDb -E -i .\sql\session2.sql -o .\logs\session2.txt'
$Pids = (Get-Process sqlcmd).Id
Wait-Process $Pids
sqlcmd -S . -E -i .\sql\teardown.sql
