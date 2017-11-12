#!/usr/bin/env bash

export ACBUILD_BIN_DIR=/home/core/acbuild/bin
export PATH=$PATH:$ACBUILD_BIN_DIR

acbuild --debug begin
acbuild --debug set-name mypresentationaci
acbuild --debug dep add quay.io/coreos/alpine-sh
acbuild --debug run apk update
acbuild --debug run apk add nginx
acbuild --debug port add http tcp 80
acbuild --debug copy-to-dir dist/* /usr/share/nginx/html/
acbuild --debug set-exec -- /usr/sbin/nginx -g "daemon off;"
acbuild --debug write --overwrite mypresentationaci.aci
