# 🚀 Dev Environment Setup Script

This shell script installs essential development tools on a Debian/Ubuntu-based Linux system:

- ✅ **Visual Studio Code** (VS Code)
- 🍃 **MongoDB Compass**
- 🐳 **Docker Engine**
- 📦 **Docker Compose (v2)**

---

## 🧾 Prerequisites

- Ubuntu or Debian-based Linux (tested on Ubuntu 20.04/22.04)
- Sudo privileges

---

## 📥 How to Use

### 1. Clone or Download the Script

```bash
wget https://yourdomain.com/install_dev_tools.sh -O install_dev_tools.sh
```

Or manually create the file:

```bash
nano install_dev_tools.sh
# Paste the script content and save
```

### 2. Make the Script Executable

```bash
chmod +x install_dev_tools.sh
```

### 3. Run the Script

```bash
./install_dev_tools.sh
```

> ⚠️ Note: This script requires an internet connection and may take several minutes to complete.

---

## 🔍 What's Installed

| Tool              | Description                                      |
|-------------------|--------------------------------------------------|
| **VS Code**       | Source-code editor from Microsoft with extensions |
| **MongoDB Compass** | GUI for MongoDB to explore and query your data |
| **Docker Engine** | Run containers and microservices                |
| **Docker Compose**| Define and run multi-container apps using YAML  |

---

## 📌 Post-Installation

- 🔄 **Reboot or log out/in** to apply Docker group permissions:

```bash
sudo reboot
```

- ✅ **Verify installations:**

```bash
code --version
docker --version
docker compose version
mongodb-compass
```

---

## 🛠 Customization

You can change:
- MongoDB Compass version
- Docker Compose version
- Add/remove other tools

Just edit the corresponding URLs/commands in the script.

---

## 📄 License

This script is open-source and free to use. Contributions welcome!
