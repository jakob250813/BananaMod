<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title>BananaMod Launcher</title>
    <script src="https://bundle.run/skinview3d@3.0.0-alpha.1"></script>
    <style>
        body { background: #0f0f12; color: #fff; font-family: 'Segoe UI', sans-serif; margin: 0; display: flex; height: 100vh; overflow: hidden; user-select: none; }
        .sidebar { width: 220px; background: #141419; display: flex; flex-direction: column; padding: 20px; border-right: 2px solid #ffe600; }
        .logo { font-size: 24px; font-weight: bold; color: #ffe600; text-align: center; margin-bottom: 40px; text-transform: uppercase; letter-spacing: 2px; }
        .nav-btn { background: none; border: none; color: #a0a0a5; padding: 12px; text-align: left; font-size: 16px; cursor: pointer; border-radius: 6px; margin-bottom: 10px; transition: 0.2s; }
        .nav-btn:hover, .nav-btn.active { background: #202027; color: #ffe600; }
        .main-content { flex: 1; padding: 40px; display: flex; justify-content: center; align-items: center; position: relative; }
        .page { display: none; width: 100%; height: 100%; flex-direction: column; align-items: center; justify-content: center; }
        .page.active { display: flex; }
        
        /* Das Nametag mit deiner EIGENEN VERPIXELTEN BANANE */
        .nametag-container { display: flex; align-items: center; margin-bottom: 20px; background: rgba(0, 0, 0, 0.6); padding: 8px 15px; border-radius: 4px; border: 1px solid #2c2c35; }
        .pixel-banana-img { width: 18px; height: 18px; margin-right: 10px; image-rendering: pixelated; }
        #nametag-text { font-family: monospace; font-size: 18px; color: #fff; }
        
        #skin-container { width: 200px; height: 260px; margin-bottom: 20px; }
        input[type="text"] { background: #1c1c24; border: 2px solid #2c2c35; color: white; padding: 12px 20px; border-radius: 8px; width: 250px; text-align: center; font-size: 16px; margin-bottom: 20px; transition: 0.2s; }
        input[type="text"]:focus { border-color: #ffe600; outline: none; }
        .launch-btn { background: #ffe600; color: #000; border: none; padding: 15px 50px; font-size: 20px; font-weight: bold; border-radius: 8px; cursor: pointer; text-transform: uppercase; box-shadow: 0 5px 15px rgba(255, 230, 0, 0.3); transition: 0.2s; }
        .launch-btn:hover { transform: translateY(-3px); box-shadow: 0 8px 20px rgba(255, 230, 0, 0.5); }
        
        /* PAUSENMENÜ MIT DEINER EIGENEN HD BANANE */
        .pause-screen { display: none; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(15, 15, 18, 0.95); z-index: 200; flex-direction: column; align-items: center; justify-content: center; }
        .hd-banana-img { width: 150px; height: 150px; object-fit: contain; margin-bottom: 20px; animation: float 3s ease-in-out infinite; }
        @keyframes float { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-10px); } }
        
        .pause-title { color: #ffe600; font-size: 28px; font-weight: bold; margin-bottom: 30px; letter-spacing: 2px; }
        .pause-btn { background: #1c1c24; border: 2px solid #2c2c35; color: white; width: 300px; padding: 12px; margin: 8px; border-radius: 6px; font-size: 16px; cursor: pointer; transition: 0.2s; }
        .pause-btn:hover { background: #ffe600; color: black; border-color: #ffe600; font-weight: bold; }

        /* Einstellungen & Rest-Logik */
        .settings-box { background: #141419; padding: 30px; border-radius: 12px; width: 80%; border: 1px solid #2c2c35; }
        .switch-container { display: flex; align-items: center; margin-bottom: 15px; }
        .switch { position: relative; display: inline-block; width: 50px; height: 26px; margin-right: 15px; }
        .switch input { opacity: 0; width: 0; height: 0; }
        .slider { position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; background-color: #2c2c35; transition: .4s; border-radius: 34px; }
        .slider:before { position: absolute; content: ""; height: 18px; width: 18px; left: 4px; bottom: 4px; background-color: white; transition: .4s; border-radius: 50%; }
        input:checked + .slider { background-color: #ffe600; }
        input:checked + .slider:before { transform: translateX(24px); }
        .info-overlay { display: none; position: absolute; top: 20px; right: 20px; background: rgba(20, 20, 25, 0.95); border: 2px solid #ffe600; padding: 20px; border-radius: 12px; width: 280px; z-index: 100; }
        .info-line { display: flex; justify-content: space-between; margin: 8px 0; font-family: monospace; font-size: 14px; }
        .map-view { display: none; width: 100%; height: 100%; background: #1a2e1a; border: 4px dashed #ffe600; border-radius: 12px; position: relative; justify-content: center; align-items: center; }
        .map-player { width: 15px; height: 15px; background: #ffe600; border-radius: 50%; position: absolute; animation: pulse 2s infinite; }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="logo">BananaMod</div>
        <button class="nav-btn active" id="btn-home" onclick="switchPage('home')">Home</button>
        <button class="nav-btn" id="btn-settings" onclick="switchPage('settings')">Einstellungen</button>
        <button class="nav-btn" onclick="openPauseMenu()">Pausenmenü</button>
    </div>

    <div class="main-content">
        
        <div id="pause-menu" class="pause-screen">
            <img src="banana_hd.png" class="hd-banana-img" alt="HD Banane"> <div class="pause-title">SPIEL PAUSIERT</div>
            <button class="pause-btn" onclick="closePauseMenu()">Zurück zum Launcher</button>
            <button class="pause-btn" onclick="alert('Optionen werden geladen...')">BananaMod Optionen</button>
            <button class="pause-btn" style="color: #ff4444;" onclick="closePauseMenu()">Verbindung trennen</button>
        </div>

        <div id="info-overlay" class="info-overlay">
            <h3>System Status</h3>
            <div class="info-line"><span>FPS:</span><span id="val-fps">144</span></div>
            <div class="info-line"><span>XYZ:</span><span id="val-xyz">X: 243 Y: 64 Z: -108</span></div>
            <div class="info-line"><span>Ping:</span><span>12ms</span></div>
        </div>

        <div id="home" class="page active">
            <div class="nametag-container">
                <img src="banana_pixel.png" class="pixel-banana-img" alt="Pixel Banane"> <div id="nametag-text">Spieler</div>
            </div>
            
            <div id="skin-container"></div>
            <input type="text" id="username" placeholder="Username eingeben..." oninput="updateSkin()">
            <button class="launch-btn" onclick="openPauseMenu()">Launch</button>
        </div>

        <div id="gps-map" class="map-view">
            <div class="map-player"></div>
            <h2 style="color: #ffe600; z-index: 10; text-shadow: 2px 2px #000;">📡 GPS-NAVIGATION AKTIV</h2>
        </div>

        <div id="settings" class="page">
            <div class="settings-box">
                <h2>Menü-Konfiguration</h2>
                <div class="switch-container">
                    <label class="switch"><input type="checkbox" id="toggle-info-menu" onchange="checkGpsStatus()"><span class="slider"></span></label>
                    <span>Info-Menü erlauben (Freischaltung für STRG + I)</span>
                </div>
                <div class="switch-container">
                    <label class="switch"><input type="checkbox" id="toggle-gps" onchange="checkGpsStatus()"><span class="slider"></span></label>
                    <span>GPS-Ortung &amp; Live-Map aktivieren</span>
                </div>
            </div>
        </div>
    </div>

    <script>
        let infoMenuAllowed = false;
        let gpsActive = false;
        let overlayVisible = false;

        function switchPage(pageId) {
            if(gpsActive) return;
            document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
            document.querySelectorAll('.nav-btn').forEach(b => b.classList.remove('active'));
            document.getElementById(pageId).classList.add('active');
            document.getElementById('btn-' + pageId).classList.add('active');
        }

        function openPauseMenu() { document.getElementById('pause-menu').style.display = 'flex'; }
        function closePauseMenu() { document.getElementById('pause-menu').style.display = 'none'; }

        function checkGpsStatus() {
            infoMenuAllowed = document.getElementById('toggle-info-menu').checked;
            gpsActive = document.getElementById('toggle-gps').checked;
            const gpsMap = document.getElementById('gps-map');
            if(gpsActive) {
                gpsMap.style.display = 'flex';
                document.getElementById('home').classList.remove('active');
                document.getElementById('settings').classList.remove('active');
            } else {
                gpsMap.style.display = 'none';
                document.getElementById('settings').classList.add('active');
            }
        }

        window.addEventListener('keydown', function(e) {
            if (e.ctrlKey && e.key.toLowerCase() === 'i') {
                e.preventDefault();
                if(!infoMenuAllowed || gpsActive) return;
                overlayVisible = !overlayVisible;
                document.getElementById('info-overlay').style.display = overlayVisible ? 'block' : 'none';
            }
        });

        let skinViewer = new skinview3d.SkinViewer({ canvas: document.createElement("canvas"), width: 200, height: 260 });
        document.getElementById("skin-container").appendChild(skinViewer.canvas);
        skinViewer.loadSkin("https://mineskin.org/assets/img/steve.png");
        skinViewer.animations.add(skinview3d.walkAnimation);

        function updateSkin() {
            let user = document.getElementById('username').value;
            document.getElementById('nametag-text').innerText = user ? user : "Spieler";
            if(user.length > 2) skinViewer.loadSkin("https://minotar.net/skin/" + user);
        }
    </script>
</body>
</html>
