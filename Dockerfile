FROM caomingjun/warp

# Cài Python3 để làm HTTP server đơn giản
RUN apt update && apt install -y python3

# Tạo file script khởi động
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
