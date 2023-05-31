#docker pull qiushaocloud/os-ubuntu-1604
#docker rmi -f qiushaocloud/nginx-server || true
docker build -t qiushaocloud/nginx-server .
