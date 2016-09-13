#!/bin/bash

docker run -d \
    --restart always \
    -p ${HOST_GRAFANA_PORT}:3000 \
    -v ${HOST_GRAFANA_STORAGE}:/var/lib/grafana \
    -v ${HOST_GRAFANA_BOOTSTRAP_DIR}:/etc/grafana \
    -e "GF_SERVER_ROOT_URL=${GRAFANA_URL}"  \
    -e "GF_SECURITY_ADMIN_USER=${GRAFANA_USERNAME}" \
    -e "GF_SECURITY_ADMIN_PASSWORD=${GRAFANA_PASSWORD}" \
    frontporch/grafana:latest
