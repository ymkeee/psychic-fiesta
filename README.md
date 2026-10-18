# PlayGTA5 offline

Complete archived website with both map options and a bundled Windows x64 Python runtime.
Extract the entire ZIP before running. No Python installation is required.

## Launch on this PC

Double-click `Launch-Local.cmd`. It opens http://localhost:8000/ in your default
browser and accepts connections only from this PC. Keep the server window open.

## Serve other PCs on your network

1. On the server PC, right-click `Setup-LAN-Firewall.cmd` and select **Run as administrator** once.
2. Double-click `Launch-LAN.cmd`. It accepts connections on port 8080 without opening a browser.
3. On the other PC, open the network URL printed in the server window, e.g. http://192.168.1.100:8080/.

Use the server's Ethernet/Wi-Fi IPv4 address from `ipconfig`, rather than a VPN
address. The firewall rule allows bundled Python on TCP 8080 from the local
subnet, including when Ethernet is marked Public. Run firewall setup again if
you move the extracted folder. Ctrl+C stops either server.

### Client browser setting for LAN HTTP

WebGPU and shared-memory WebAssembly require a secure browser context.
On each client PC, open:

- Chrome: `chrome://flags/#unsafely-treat-insecure-origin-as-secure`
- Edge: `edge://flags/#unsafely-treat-insecure-origin-as-secure`

Add the exact server origin, e.g. `http://192.168.1.100:8080`, enable the setting,
and restart the browser. A trusted HTTPS setup is the alternative. This setting
is unnecessary for localhost. The server supplies the required COOP/COEP headers.

## Controls and requirements

Use a browser and GPU supporting WebGPU and the site's WebAssembly features.
At the title screen: Space opens map selection, 5 selects GTA V Map, and 6
selects the site's GTA VI Map (`env_test`). Enter selects Story Mode.

Direct map URLs: `/?mode=sandbox` and `/?mode=sandbox&map=env_test`.
The client PC runs the game with its own CPU/GPU; the server supplies the files.
Do not open index.html with file://. No CDN is required for archived game assets.

If port 8000 or 8080 is occupied, stop the other server. Custom LAN port example:
`runtime\python.exe serve_local.py --host 0.0.0.0 --port 8081`.
For a custom port, also update the firewall rule and browser origin.

To remove the firewall rule, run in administrator PowerShell:
`Remove-NetFirewallRule -Name PlayGTA5-Offline-LAN-8080`.

Source: https://playgta5.com/ — archived 2026-10-06, build 8b0b5899ed.
The map names follow the site's labels; `env_test` provenance is unverified.
Server startup, headers and range/batch I/O were checked; gameplay is untested.
Python's license is included in runtime/LICENSE.txt.
