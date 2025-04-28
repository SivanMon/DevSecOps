# Toolz Pro - Bash Multi-Tool Utility

![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?logo=gnu-bash)
![License](https://img.shields.io/badge/License-MIT-blue)

## 📋 Project Overview

**Toolz Pro** is a modular, interactive Bash utility that centralizes critical Linux system administration tasks into a single powerful tool.

It simplifies system monitoring, process management, user management, network diagnostics, cron scheduling, and much more.

---

## 🚀 Features

- 📁 **Find Helper (`-f`)** — Search files in a directory based on a filename pattern.
- 📊 **System Information (`-s`)** — View memory, process count, and disk usage.
- 🧠 **Process Management (`-p`)** — Display and optionally kill top CPU/memory processes.
- 👥 **User Management (`-u`)** — Show currently logged-in users and login history.
- 🌐 **Network Information (`-n`)** — Display IP configurations and active network connections.
- 🛠️ **Service List (`-l`)** — Show the status of all services running under systemd.
- 🧹 **Clean Temporary Files (`-c`)** — Remove unnecessary files from `/tmp`.
- 🔒 **Sudo Users Check (`-v`)** — List users with administrative rights.
- 💽 **Disk Health Check (`-d`)** — Check disk SMART health, with automatic installer for `smartmontools` if missing.
- 📜 **Analyze Logs (`-a`)** — Search specific keywords (default `error`) in system logs.
- 📅 **Cron Manager (`-t`)** — Interactive scheduling of new tasks with guided questions, edit or delete crontab jobs.
- 📜 **Help (`-h`)** — Display a neat and clean help menu.

---

## 🛠️ Installation

```bash
# Clone this repository
git clone https://github.com/your-username/toolz-pro.git
cd toolz-pro

# Make the installer executable
chmod +x install.sh

# Run the installer
./install.sh
