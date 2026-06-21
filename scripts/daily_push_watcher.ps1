param(
    [string]$RunTime = "23:58"
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$PushScript = Join-Path $RepoRoot "scripts\push_skill_updates.ps1"

function Get-NextRun {
    param([string]$Clock)
    $parts = $Clock.Split(":")
    $target = (Get-Date).Date.AddHours([int]$parts[0]).AddMinutes([int]$parts[1])
    if ((Get-Date) -ge $target) {
        $target = $target.AddDays(1)
    }
    return $target
}

while ($true) {
    $nextRun = Get-NextRun -Clock $RunTime
    $sleepSeconds = [Math]::Max(30, [int]([Math]::Ceiling(($nextRun - (Get-Date)).TotalSeconds)))
    Start-Sleep -Seconds $sleepSeconds
    try {
        & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $PushScript
    }
    catch {
        Start-Sleep -Seconds 20
        & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $PushScript
    }
}
