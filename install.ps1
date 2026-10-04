$ErrorActionPreference="Stop"
$Repo="https://github.com/nadeemmhdm/study-flow.git"
$Dir=if($env:STUDY_FLOW_HOME){$env:STUDY_FLOW_HOME}else{Join-Path $HOME ".study-flow"}
function Has($c){ return [bool](Get-Command $c -ErrorAction SilentlyContinue) }
function Fail($code,$msg){ Write-Error "[$code] $msg"; exit 1 }
function Install-Winget($id,$label){
 if(-not (Has "winget")){ Fail "SF-1100" "Missing $label and Windows Package Manager (winget) is unavailable. Install $label manually." }
 Write-Host "Installing $label..."
 winget install --id $id -e --accept-package-agreements --accept-source-agreements
 if($LASTEXITCODE -ne 0){ Fail "SF-1104" "$label automatic installation failed." }
 $env:Path=[Environment]::GetEnvironmentVariable("Path","Machine")+";"+[Environment]::GetEnvironmentVariable("Path","User")
}
Write-Host "Study Flow: checking required packages..."
if(-not (Has "git")){ Install-Winget "Git.Git" "Git" }
if(-not (Has "node")){ Install-Winget "OpenJS.NodeJS.LTS" "Node.js LTS" }
if(-not (Has "npm")){ $env:Path=[Environment]::GetEnvironmentVariable("Path","Machine")+";"+[Environment]::GetEnvironmentVariable("Path","User"); if(-not (Has "npm")){Fail "SF-1002" "npm was not found after Node.js installation. Reopen PowerShell and retry."} }
$major=[int](node -p "process.versions.node.split('.')[0]")
if($major -lt 20){ Fail "SF-1001" "Node.js 20+ is required. Current: $(node -v)" }
Write-Host "Prerequisites ready: Node $(node -v), npm $(npm -v), $(git --version)"
try {
 if(Test-Path (Join-Path $Dir ".git")){ Set-Location $Dir; if((git status --porcelain)){Fail "SF-3002" "Local changes detected; refusing automatic update."}; git pull --ff-only origin main } else { git clone $Repo $Dir; Set-Location $Dir }
 if($LASTEXITCODE -ne 0){throw "[SF-3004] Repository setup/update failed."}
 npm install; if($LASTEXITCODE -ne 0){throw "[SF-2001] Dependency installation failed."}
 npm run build; if($LASTEXITCODE -ne 0){throw "[SF-2002] Build failed."}
 npm run sf -- doctor; if($LASTEXITCODE -ne 0){throw "[SF-9000] Doctor failed."}
 Write-Host "Study Flow ready at $Dir"; Write-Host "Start: cd `"$Dir`"; npm run sf -- start"
} catch { Write-Error $_; exit 1 }
