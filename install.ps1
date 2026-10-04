$ErrorActionPreference="Stop"
$Repo="https://github.com/nadeemmhdm/study-flow.git"
$Dir=if($env:STUDY_FLOW_HOME){$env:STUDY_FLOW_HOME}else{Join-Path $HOME ".study-flow"}
try { git --version | Out-Null } catch { Write-Error "[SF-3001] Git is required."; exit 1 }
try { node --version | Out-Null } catch { Write-Error "[SF-1001] Node.js 20+ is required."; exit 1 }
try {
 if(Test-Path (Join-Path $Dir ".git")){ Set-Location $Dir; git pull --ff-only origin main } else { git clone $Repo $Dir; Set-Location $Dir }
 npm install
 if($LASTEXITCODE -ne 0){throw "[SF-2001] Dependency install failed."}
 npm run build
 if($LASTEXITCODE -ne 0){throw "[SF-2002] Build failed."}
 Write-Host "Study Flow ready at $Dir"; Write-Host "Start: cd `"$Dir`"; npm run sf -- start"
} catch { Write-Error $_; exit 1 }
