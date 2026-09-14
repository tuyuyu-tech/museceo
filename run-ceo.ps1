# 0円CEOループ用 (PowerShell)
# 使い方: .\run-ceo.ps1 (止める時は Ctrl+C)

$ErrorActionPreference = "Stop"

while ($true) {
  Write-Host "`n=== CEO run $(Get-Date -Format 'yyyy-MM-dd HH:mm') ===" -ForegroundColor Cyan
  opencode run --agent ceo --auto "STATE.mdとLEDGER.mdを読んで、次の1時間で最終利益が最大になる1手だけ実行して。両ファイルを更新して。終わったら CONTINUE / NEED-HUMAN / DONE で締めて。"
  if ($LASTEXITCODE -ne 0) {
    Write-Host "opencodeが異常終了。10分後に再試行" -ForegroundColor Yellow
    Start-Sleep -Seconds 600
    continue
  }
  Write-Host "1時間待機中... (Ctrl+Cで停止)" -ForegroundColor Gray
  Start-Sleep -Seconds 3600
}
