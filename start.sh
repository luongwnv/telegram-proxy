#!/bin/sh

# Railway provides PORT environment variable
PORT=${PORT:-443}

# Generate secret if not provided
if [ -z "$SECRET" ]; then
    SECRET=$(head -c 16 /dev/urandom | xxd -ps)
    echo "Generated SECRET: $SECRET"
fi

# Get proxy secret from Telegram
curl -s https://core.telegram.org/getProxySecret -o /data/proxy-secret

# Get proxy config
curl -s https://core.telegram.org/getProxyConfig -o /data/proxy-multi.conf

echo "======================================="
echo "MTProxy Starting..."
echo "Port: $PORT"
echo "Secret: $SECRET"
echo "======================================="

# Start MTProxy
cd /mtproxy
./objs/bin/mtproto-proxy \
    -u nobody \
    -p 8888 \
    -H $PORT \
    -S $SECRET \
    --aes-pwd /data/proxy-secret /data/proxy-multi.conf