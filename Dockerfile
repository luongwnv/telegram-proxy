FROM alpine:latest

# Install dependencies
RUN apk add --no-cache \
    git \
    build-base \
    openssl-dev \
    zlib-dev \
    linux-headers

# Clone MTProxy
RUN git clone https://github.com/TelegramMessenger/MTProxy.git /mtproxy

# Build MTProxy
WORKDIR /mtproxy
RUN make

# Create working directory
RUN mkdir -p /data

# Copy configuration script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 443

CMD ["/start.sh"]