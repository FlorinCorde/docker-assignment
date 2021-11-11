#!/bin/sh

if [ "$1" = "start-domain" ]
then
    echo "[Entrypoint] Run init scripts"
    for f in ${SCRIPT_DIR}/init_* ${SCRIPT_DIR}/init.d/*; do
          case "$f" in
            *.sh)  echo "[Entrypoint] running $f"; . "$f" ;;
            *)     echo "[Entrypoint] ignoring $f" ;;
          esac
          echo
    done
    echo "[Entrypoint] Run startInForeground script with arguments [$PAYARA_ARGS]"
    exec ${SCRIPT_DIR}/startInForeground.sh $PAYARA_ARGS
else
	exec "$@"
fi
