$ErrorActionPreference = 'Stop'
$principal = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw 'Administrator rights required. Run Setup-LAN-Firewall.cmd as administrator.'
}
$ruleName = 'PlayGTA5-Offline-LAN-8080'
$pythonPath = Join-Path $PSScriptRoot 'runtime\python.exe'
if (-not (Test-Path -LiteralPath $pythonPath)) { throw 'Extract the full bundle first: runtime\python.exe is missing.' }
Get-NetFirewallRule -Name $ruleName -ErrorAction SilentlyContinue | Remove-NetFirewallRule
New-NetFirewallRule -Name $ruleName -DisplayName 'PlayGTA5 offline LAN (TCP 8080, local subnet)' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 8080 -RemoteAddress LocalSubnet -Profile Any -Program $pythonPath | Out-Null
Write-Host 'Firewall configured for bundled Python on TCP 8080, local subnet only.'
