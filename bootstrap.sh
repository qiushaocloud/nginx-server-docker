#!/bin/bash

while true; do
  # 检查Nginx进程是否在运行中
  if ! pgrep nginx >/dev/null; then
    echo "Nginx is not running. Starting Nginx..."
    /usr/local/nginx/sbin/nginx -g "daemon off;"
  fi

  sleep 5  # 每隔5秒检查一次Nginx进程状态
done
