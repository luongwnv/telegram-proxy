#!/bin/bash

# (Tùy chọn) Thử kết nối WARP, nếu cần
# warp-cli connect &

# Tạo HTTP server trên cổng 3000 để vượt health check
python3 -m http.server 3000
