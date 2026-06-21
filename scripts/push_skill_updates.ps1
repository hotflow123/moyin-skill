$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
Set-Location -LiteralPath $RepoRoot

git config user.name "Codex Automation"
git config user.email "codex-automation@users.noreply.github.com"

$env:GIT_SSH_COMMAND = "ssh -i `"$env:USERPROFILE\.ssh\id_ed25519_duoyixuexi`" -o IdentitiesOnly=yes"

$TrackedPaths = @("SKILL.md", "references", "agents", "scripts", ".gitignore", ".gitattributes")

if (git diff --quiet -- $TrackedPaths) {
    Write-Output "No skill changes to commit."
    exit 0
}

git add -- $TrackedPaths
git commit -m "chore: refresh skill memory from daily dialogue"
if ($LASTEXITCODE -eq 1) {
    Write-Output "No commit created."
    exit 0
}
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

git push -u origin HEAD
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
