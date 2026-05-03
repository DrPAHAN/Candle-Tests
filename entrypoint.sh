#!/bin/bash

echo "=== Candle GTest Results in Kubernetes ==="

# Ждём старта приложения
sleep 12

while true; do
  echo "[$(date)] Fetching logs from candle-app..."

  # Получаем логи из пода app
  APP_LOGS=$(kubectl logs -l app=candle-app --tail=500 2>&1 || echo "App pod is not ready yet...")

  cat > /usr/share/nginx/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Candle Tests — Kubernetes</title>
    <style>
        body {
            font-family: 'Courier New', monospace;
            padding: 30px;
            background: #1e1e1e;
            color: #d4d4d4;
            line-height: 1.5;
        }
        pre {
            background: #000;
            padding: 25px;
            border-radius: 8px;
            overflow: auto;
            white-space: pre-wrap;
        }
        .passed { color: #00ff00; }
        h1 { color: #ffffff; }
    </style>
</head>
<body>
    <h1>🧪 Candle Autotests Results (Kubernetes)</h1>
    <pre>${APP_LOGS}</pre>
    <p><small>Последнее обновление: $(date)</small></p>
</body>
</html>
EOF

  echo "Page updated successfully."
  sleep 15
done &

# Запускаем Nginx
nginx -g 'daemon off;'