# 🚀 NetWatch — Network Health Monitor

A lightweight , automated system to monitor server uptime and port status. Build with Shell scripting and containerized with docker 


## 🧩 Features
* **Ping Monitoring:** Tracks host availability and latency.
* **Port Scanning:** Checks if critical ports (22, 80, 443) are open.
* **Dockerized:** Run in an isolated Alpine Linux Container.
* **CI/CD:** Automated testing via Github Actions.

## 🛠️ Skills Demonstrated
* **Linux/Shell:** Bash scripting, `nc`, `ping`, and `awk`.
* **DevOps:** Docker, Docker-Compose, and CI/CD workflows.
* **Networking:** TCP/IP connectivity and port management.

## 🚀 How to Run
1. **Configure Hosts:** Add your IPs/Domains to `config/hosts.txt`.
2. **Start the Monitor:**
   ```
     bash
     docker-compose up -d

## 🔍 View logs

```
Bash
tail -f logs/netwatch-$(date +%F).log