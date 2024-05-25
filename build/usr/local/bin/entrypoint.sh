#!/bin/bash

[[ -z ${MODE} ]] && MODE=proxy
[[ -z ${WEB_HOST} ]] && WEB_HOST=127.0.0.1

case ${MODE} in
  proxy)
    /usr/local/bin/mitmweb --set web_host=${WEB_HOST}
  ;;
  transparent)
    /usr/local/bin/mitmweb --mode transparent --set web_host=${WEB_HOST}
  ;;
esac
