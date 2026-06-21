param(
    [string]$TaskName = "MoyinSkillDailyPush"
)

$ErrorActionPreference = "Stop"

$RunKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

Remove-ItemProperty -Path $RunKey -Name $TaskName -ErrorAction SilentlyContinue
Write-Output "Removed startup watcher: $TaskName. Daily push now runs from run_daily_export.ps1 after distillation."
