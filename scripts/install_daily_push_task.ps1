param(
    [string]$TaskName = "PushMoyinSkillDaily",
    [string]$Time = "23:58"
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$Watcher = Join-Path $RepoRoot "scripts\daily_push_watcher.ps1"
$RunKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$EntryName = "MoyinSkillDailyPush"

Set-Content -LiteralPath $Watcher -Encoding UTF8 -Value @"
param(
    [string]`$RunTime = "$Time"
)

`$ErrorActionPreference = "Stop"
`$RepoRoot = Split-Path -Parent `$PSScriptRoot
`$PushScript = Join-Path `$RepoRoot "scripts\push_skill_updates.ps1"

function Get-NextRun {
    param([string]`$Clock)
    `$parts = `$Clock.Split(":")
    `$target = (Get-Date).Date.AddHours([int]`$parts[0]).AddMinutes([int]`$parts[1])
    if ((Get-Date) -ge `$target) {
        `$target = `$target.AddDays(1)
    }
    return `$target
}

while (`$true) {
    `$nextRun = Get-NextRun -Clock `$RunTime
    `$sleepSeconds = [Math]::Max(30, [int]([Math]::Ceiling((`$nextRun - (Get-Date)).TotalSeconds)))
    Start-Sleep -Seconds `$sleepSeconds
    & powershell.exe -NoProfile -ExecutionPolicy Bypass -File `$PushScript
}
"@

Set-ItemProperty -Path $RunKey -Name $EntryName -Value "powershell.exe -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$Watcher`""
Write-Output "Registered startup watcher: $EntryName at $Time"
