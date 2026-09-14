# Zero-cost CEO loop (PowerShell)
# Usage: .\run-ceo.ps1 (Ctrl+C to stop)

$ErrorActionPreference = "Continue"

while ($true) {
  Write-Host ("=== CEO run " + (Get-Date -Format "yyyy-MM-dd HH:mm") + " ===")
  opencode run --agent ceo --auto "Read STATE.md and LEDGER.md, then execute the single highest-profit next 1-hour task. Update both files. End with one line: CONTINUE / NEED-HUMAN / DONE."
  if ($LASTEXITCODE -ne 0) {
    Write-Host "opencode exited with error. Retrying in 10 minutes."
    Start-Sleep -Seconds 600
    continue
  }
  Write-Host "Waiting 1 hour... (Ctrl+C to stop)"
  Start-Sleep -Seconds 3600
}
