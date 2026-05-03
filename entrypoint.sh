# Ждём, пока контейнер app запустится и выведет тесты
echo "Waiting for app container to finish tests..."
sleep 8

# Получаем логи контейнера app (по имени сервиса)
APP_LOGS=$(docker logs test-repo_app 2>&1 || echo "No logs yet")

cat > /usr/share/nginx/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Candle Tests Results</title>
    <style>
        body { font-family: monospace; padding: 20px; background: #1e1e1e; color: #d4d4d4; }
        pre { background: #000; padding: 15px; border-radius: 5px; }
        .passed { color: #00ff00; }
    </style>
</head>
<body>
    <h1>Candle GTest Results</h1>
    <pre>$APP_LOGS</pre>
    <p>Обновлено: $(date)</p>
</body>
</html>
EOF

echo "Tests output written to index.html"
nginx -g 'daemon off;'