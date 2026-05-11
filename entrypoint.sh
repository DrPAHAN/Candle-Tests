#!/bin/bash
echo "=== Web Container Started ==="

while true; do
    echo "[$(date)] Trying to get logs..."

    APP_LOGS=$(kubectl logs -l app=candle-app --tail=200 2>&1 || echo "No app logs yet")

    cat > /usr/share/nginx/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candle Tests</title>
    <style>
        body { font-family: monospace; background:#1e1e1e; color:#ddd; padding:30px; }
        pre { background:#000; padding:20px; border-radius:8px; }
    </style>
</head>
<body>
    <h1>Candle Autotests Results (Kubernetes)</h1>
    <pre>${APP_LOGS}</pre>
    <p>Updated: $(date)</p>
</body>
</html>
EOF
    sleep 10
done &

exec nginx -g 'daemon off;'