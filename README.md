# BM_Loadingscreen

Custom FiveM loading screen by **Benny Modding**.

---

## Features

- Fullscreen background image
- Animated loading progress bar (synced to FiveM's real load fraction)
- Music player with playlist support — prev / next / play-pause / mute / volume
- Server info cards (features list, community/social links)
- All text and links configurable via `config.lua` — no HTML editing needed

---

## File Structure

```
BM_Loadingscreen/
├── config.lua          ← all configuration
├── client.lua          ← sends config to the NUI
├── fxmanifest.lua
├── index.html
├── img/
│   └── background.png  ← background image
└── music/
    └── *.mp3           ← music files (all .mp3 files here are loaded automatically)
```

---

## Installation

1. Copy the `BM_Loadingscreen` folder into your server's `resources` directory.
2. Add the following line to your `server.cfg` **before** any other resources:
   ```
   ensure BM_Loadingscreen
   ```
   It must start early so it is visible during the initial load.

---

## Configuration (`config.lua`)

### General

| Option | Description |
|---|---|
| `Config.ServerName` | Server name shown in the large heading |
| `Config.Tagline` | Small pill text above the heading |
| `Config.Description` | Subtitle paragraph text |

### Features list

```lua
Config.Features = {
    "Realistisches Economy-System",
    "Eigene Fahrzeuge & Maps",
    "Optimierte Scripts",
    "Aktives Support-Team"
}
```

Add, remove, or rename entries as needed.

### Social links

```lua
Config.Discord = "https://discord.gg/dein-link"
Config.TikTok  = "https://tiktok.com/@dein-profil"
```

### Music

```lua
Config.Music = {
    volume   = 70,       -- default volume, 0 – 100
    playlist = {
        { file = "music/track1.mp3", name = "Track 1" },
        { file = "music/track2.mp3", name = "Track 2" },
    }
}
```

- Drop any `.mp3` file into the `music/` folder and add it to the playlist.
- Tracks play in order and loop back to the first track after the last one.

---

## Adding Music

1. Place your `.mp3` file in `BM_Loadingscreen/music/`.
2. Add an entry to `Config.Music.playlist` in `config.lua`:
   ```lua
   { file = "music/mysong.mp3", name = "My Song" },
   ```
3. Restart the resource (`restart BM_Loadingscreen`).

No changes to `fxmanifest.lua` are needed — it uses `music/*.mp3` to include all files in the folder automatically.

---

## Replacing the Background

Overwrite `img/background.png` with your own image. Recommended resolution: **1920×1080**.

---

## Known Behaviour

- **Cursor** — visible by default via `cursor: default` in CSS (FiveM's CEF hides it otherwise).
- **Autoplay** — the browser starts music automatically. If it is blocked, clicking anywhere on the screen unlocks it.
- **Audio resume** — if FiveM briefly hides the loading screen during the handoff phase, the music automatically resumes when the screen becomes visible again.
