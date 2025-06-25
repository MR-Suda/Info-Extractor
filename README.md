# 🧠 INFO EXTRACTOR

> **A Linux system information collector script written in Bash**  
> 📁 Project for *Linux Fundamentals* | 🧑‍🎓 By **MR-SUDA** | 🎓 Lecturer: Shiffman David

---

## 🧰 Features

- ✅ Root privilege check
- ✅ Tool installation check (`dialog`)
- ✅ Beautiful ASCII + colorized banner
- ✅ Public / Private IP detection
- ✅ MAC address info
- ✅ OS details (Distro, Kernel, Architecture, Uptime)
- ✅ Top 5 CPU-hungry processes
- ✅ Memory usage (with ASCII bars)
- ✅ Top-10 largest files in `/home`
- ✅ Optional system services overview

---

## 📟 Terminal View

```text
┌────────────────────────────────────────────────────────────────────────────────┐
│  ___ _   _ _____ ___    _______  _______ ____      _    ____ _____ ___  ____   │
│ |_ _| \ | |  ___/ _ \  | ____\ \/ /_   _|  _ \    / \  / ___|_   _/ _ \|  _ \  │
│  | ||  \| | |_ | | | | |  _|  \  /  | | | |_) |  / _ \| |     | || | | | |_) | │
│  | || |\  |  _|| |_| | | |___ /  \  | | |  _ <  / ___ \ |___  | || |_| |  _ <  │
│ |___|_| \_|_|   \___/  |_____/_/\_\ |_| |_| \_\/_/   \_\____| |_| \___/|_| \_\ │
│                                                                             │
│ Date: 2025-06-25 19:19:56               By MR-SUDA                         │
└────────────────────────────────────────────────────────────────────────────────┘

[ ================== Public IP ================== ]

46.xxx.xxx.xxx

[ ================== Private IP ================= ]

192.168.xxx.xxx

[ ===================== MAC ===================== ]

00:0c:xx:xx:xx:xx

[ ================== OS System ================== ]

Distro - Kali GNU/Linux Rolling
Kernel - 6.xx.xx-amd64
Arch   - x86_64
Uptime - up xx hour, xx minutes

[ ============= Top 5 CPU Processes ============= ]

 PID COMMAND         %CPU
1052 Xorg            4.8
55414 qterminal      1.6
55421 zsh            1.3
1379 xfwm4           0.4
1438 wrapper-2.0     0.2

   ███░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  8%

[ ================ Memory Usage ================= ]

Total: 1.9Gi | Available: 1.1Gi

   ████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  46%

[ === TOP-10 Largest Files in /home Directory === ]

566M /home/kali/Desktop/burpsuite/xxx.jar
564M /home/kali/Desktop/burpsuite/xxx.zip
...
22M  /home/kali/.cache/mozilla/firefox/xxx.default/cache2/entries/...
```

## ⚙️ Usage

### Clone the repository or download the script

    ⚠️ Script must be run as root to access full system information.

```bash
wget https://raw.githubusercontent.com/MR-Suda/Info-Extractor/main/INFO_EXTRACTOR.sh
chmod +x INFO_EXTRACTOR.sh
sudo ./INFO_EXTRACTOR.sh
```

## 📁 Project Details
Student Name	              - MR-SUDA
Program Code	              - XXX
Class Code	                - RTX
Lecturer	                  - Shiffman David
Project	Linux Fundamentals - Info Extractor

## 📄 License

This project is released for educational purposes.
Feel free to fork, improve, and share. Credits will be appreciated 🖤


---
