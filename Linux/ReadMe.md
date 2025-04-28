# Toolz - Bash Multi-Tool Utility

## 📋 Description

**Toolz** is a modular, bash-based command-line utility designed to centralize multiple essential system administration tasks into a single, easy-to-use script.

It offers interactive helpers for system monitoring, network inspection, disk health checks, user management, and more.

---

## 🚀 Features

- 📁 **Find Helper (`-f`)** — Interactively search for files based on directory and name pattern.
- 📊 **System Information (`-s`)** — Display memory usage, number of running processes, and disk space usage.
- 🧠 **Process Management (`-p`)** — View top resource-consuming processes and optionally kill processes by PID.
- 👥 **User Management (`-u`)** — Show currently logged-in users, active sessions, and recent login history.
- 🌐 **Network Information (`-n`)** — Display IP addresses and currently active network connections.
- 🛠️ **Service List (`-l`)** — View a clean table of all system services with their load, active, and sub statuses.
- 🧹 **Cleanup Temporary Files (`-c`)** — Clear the `/tmp` directory to free up system resources.
- 🔒 **Sudo Users Check (`-v`)** — List all users with sudo (administrative) privileges.
- 💽 **Disk Health Check (`-d`)** — Analyze disk health using `smartctl` and automatically install `smartmontools` if missing.
- 📜 **Help (`-h`)** — Display a helpful summary of all available options.

---

## 🛠️ Usage

```bash
# Make the script executable
chmod +x toolz

# Run Toolz with a desired option
./toolz -s

# View the help menu
./toolz -h