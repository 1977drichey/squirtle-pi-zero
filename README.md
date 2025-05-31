# squirtle-pi-zero
This workfl builds a minimal Alpine image with v4l2rtspserver, Wi-Fi auto-connect, SSH, and heat-watchdog scripts
# 🐢 **Squirtle Pi**: The Ultimate RTSP Streamer

> **"Squirtle, I choose you!"**

---

## 📖 Pokédex Entry

**Name:** Squirtle Pi
**Type:** Water / Streamer
**Height:** 2 ft (Compact!)
**Weight:** 5.25 lbs (Featherlight!)

> *"Squirtle Pi uses its shell as a heatsink and fires off crisp RTSP streams to support the grand Olivia. It never runs out of bubbles...or bandwidth."*

---

## 🎯 Moveset (Core Features)

| Move           | Description                                                                      |
| -------------- | -------------------------------------------------------------------------------- |
| **Tackle**     | **v4l2rtspserver** at 640×480 @ 5 FPS — lightweight, pure RTSP.                  |
| **Water Gun**  | **heat-watchdog** script — monitors temperature, auto-reboots at ≥75 °C.         |
| **Rapid Spin** | **Auto Wi-Fi** connect to **NETGEAR42** (PSK: heavybug047) via `wpa_supplicant`. |
| **Withdraw**   | Alpine Linux base — musl-powered, <50 MB RAM footprint, no GUI bloat.            |
| **Swift**      | Fast boot & init (OpenRC) — ready to stream in under 30 s from power-up.         |

---

## 🛠️ Trainer Tips (Getting Started)

1. **Clone & Configure**

   ```bash
   git clone https://github.com/1977drichey/squirtle-pi.git
   cd squirtle-pi
   ```
2. **Copy the Workflow**

   * Place `build-squirtle-alpine.yml` under `.github/workflows/`.
3. **Push to GitHub**

   ```bash
   git add .github/workflows/build-squirtle-alpine.yml \
       rootfs/usr/local/bin/stream-launcher.sh \
       rootfs/usr/local/bin/heat-watchdog.sh \
       rootfs/etc/init.d/stream \
       rootfs/etc/init.d/heat-watchdog
   git commit -m "Add Squirtle Pi streaming image workflow"
   git push origin main
   ```
4. **Watch the Build**

   * Go to the **Actions** tab and cheer for Squirtle Pi as it crafts its streaming image! 🎉
5. **Flash & Deploy**

   ```bash
   xzcat squirtle-alpine-streamer.img.xz | sudo dd of=/dev/sdX bs=4M status=progress conv=fsync
   ```
6. **Power On & Connect**

   * Find IP via `nmap -sn 192.168.1.0/24 | grep Raspberry`
   * SSH: `ssh richeyda@<IP>` (password: `Sally`)
   * Stream: `rtsp://<IP>:8554/live.sdp`

---

## 🌊 Evolution & Future Plans

* **Level 1:** Squirtle Pi *(Current)* — minimal RTSP streaming.
* **Level 2:** Wartortle Pi — add **Tailscale**/SSH exit node for remote control.
* **Level 3:** Blastoise Pi — GPU offload, Coral TPU integration, advanced AI detection.

> *"Only the trainer who’s prepared for debugging can bring Squirtle to its final evolution."*

---

## 🏆 League Badge

When you see a stable RTSP stream with zero CPU meltdown, you’ve earned the **Stream Master** badge. Strap in, Trainer—Squirtle Pi is about to make a splash!

---

*— Built with ❤️ by Team Olivia & Trainer David Richey*
