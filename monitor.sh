#!/bin/bash

HOSTS_FILE="./config/hosts.txt"
LOG_FILE="./logs/netwatch-$(date +%F).log"
PORTS=(22 80 443)

mkdir -p ./logs

echo "==============================" >> "$LOG_FILE"
echo "Scan started: $(date)"         >> "$LOG_FILE"
echo "==============================" >> "$LOG_FILE"

while IFS= read -r host; do
  echo "" >> "$LOG_FILE"
  echo "--- Checking: $host ---" >> "$LOG_FILE"

  # PING CHECK — is the host reachable?
  if ping -c 2 -W 1 "$host" &>/dev/null; then
    echo "[UP]     $host responds to ping" >> "$LOG_FILE"
  else
    echo "[DOWN]   $host is NOT reachable" >> "$LOG_FILE"
  fi

  # PORT CHECKS — is a service running?
  for port in "${PORTS[@]}"; do
    nc -zv -w 2 "$host" "$port" &>/dev/null \
      && echo "[OPEN]   $host : port $port"   >> "$LOG_FILE" \
      || echo "[CLOSED] $host : port $port"   >> "$LOG_FILE"
  done

done < "$HOSTS_FILE"

echo "" >> "$LOG_FILE"
echo "Scan complete: $(date)" >> "$LOG_FILE"
echo "✅ Log saved: $LOG_FILE"