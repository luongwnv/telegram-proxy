FROM ubuntu:20.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    curl \
    xxd \
    && rm -rf /var/lib/apt/lists/*

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

# Railway sử dụng PORT environment variable
EXPOSE $PORT

CMD ["/start.sh"]