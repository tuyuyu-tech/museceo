# Zero-cost CEO loop (PowerShell)
# Usage: .\run-ceo.ps1 (Ctrl+C to stop)
# Progress: console + logs\ceo-YYYYMMDD-HHmm.log + STATE.md

$ErrorActionPreference = "Continue"
$LogDir = Join-Path $PSScriptRoot "logs"
New-Item -ItemType Directory -Path $LogDir -Force | Out-Null

while ($true) {
  $stamp = Get-Date -Format "yyyyMMdd-HHmm"
  $log = Join-Path $LogDir ("ceo-" + $stamp + ".log")
  Write-Host ("=== CEO run " + (Get-Date -Format "yyyy-MM-dd HH:mm") + " ===")
  Write-Host ("Log: " + $log)
  opencode run --agent ceo --auto "Read STATE.md and LEDGER.md, then execute the single highest-profit next 1-hour task. Update both files. End with one line: CONTINUE / NEED-HUMAN / DONE." 2>&1 | Tee-Object -FilePath $log
  Write-Host ("=== Run finished. Log saved: " + $log + " ===")
  Write-Host "Waiting 1 hour... (Ctrl+C to stop)"
  Start-Sleep -Seconds 3600
}
