#!/bin/bash
true=1
false=0

[[ -z ${LISTEN_PORT} ]]       && LISTEN_PORT=8080
[[ -z ${MODE} ]]              && MODE=regular
[[ -z ${WEB_HOST} ]]          && WEB_HOST=127.0.0.1
[[ -z ${WEB_PORT} ]]          && WEB_PORT=8081

MODE=`echo ${MODE} | awk '{print tolower($1)}'`

case ${MODE} in
  regular | reverse | socks5 | transparent | upstream )
    /usr/local/bin/mitmweb --anticomp --listen-port ${LISTEN_PORT} --mode ${MODE} --no-web-open-browser --save-stream-file /var/log/mitmproxy/${MODE}.log --web-port ${WEB_PORT} --set web_host=${WEB_HOST} --showhost
  ;;
esac