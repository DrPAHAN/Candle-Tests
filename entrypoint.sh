#!/bin/bash

echo "=== Candle GTest Results via Kubernetes ==="

# Ждём запуска app пода
sleep 10

while true; do
  echo "Fetching logs from candle-app at $(date)..."
  
  APP_LOGS=$(kubectl logs -l app=candle-app --tail=100 2>&1 || echo "Waiting for app pod...")

  cat > /usr/share/nginx/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candle Tests - Kubernetes</title>
    <style>
        body { font-family: monospace; padding: 20px; background: #1e1e1e; color: #d4d4d4; }
        pre { background: #000; padding: 20px; border-radius: 8px; overflow: auto; }
        .passed { color: #00ff00; }
    </style>
</head>
<body>
    <h1>Candle Autotests Results (Kubernetes)</h1>
    <pre>${APP_LOGS}</pre>
    <p><small>Обновлено: $(date)</small></p>
</body>
</html>
EOF
  sleep 15
done &

nginx -g 'daemon off;'