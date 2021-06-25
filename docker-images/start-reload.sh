#! /usr/bin/env sh
set -e

if [ -f /app/app/main.py ]; then
    DEFAULT_MODULE_NAME=app.main
elif [ -f /app/main.py ]; then
    DEFAULT_MODULE_NAME=main
fi
MODULE_NAME=${MODULE_NAME:-$DEFAULT_MODULE_NAME}
VARIABLE_NAME=${VARIABLE_NAME:-app}
export APP_MODULE=${APP_MODULE:-"$MODULE_NAME:$VARIABLE_NAME"}

HOST=${HOST:-0.0.0.0}
PORT=${PORT:-80}
LOG_LEVEL=${LOG_LEVEL:-info}
ADDITIONAL_ARGS=${(ADDITIONAL_ARGS):---}

# If there's a prestart.sh script in the / directory or other path specified, run it before starting
echo "Checking for prestart script"

if [ -f /app/prestart.sh ] ; then
    DEFAULT_PRE_START_PATH=/app/prestart.sh
elif [ -f /app/app/prestart.sh ] ; then
    DEFAULT_PRE_START_PATH=/app/app/prestart.sh
elif [ -f /app/scripts/prestart.sh ]; then
    DEFAULT_PRE_START_PATH=/app/scripts/prestart.sh
elif [ -f /app/app/scripts/prestart.sh ]; then
    DEFAULT_PRE_START_PATH=/app/app/scripts/prestart.sh
else
    DEFAULT_PRE_START_PATH=/prestart.sh
fi

PRE_START_PATH=${PRE_START_PATH:-$DEFAULT_PRE_START_PATH}

if [ -f "$PRE_START_PATH" ] ; then
    echo "Running script $PRE_START_PATH"
    . "$PRE_START_PATH"
else
    echo "There is no script $PRE_START_PATH"
fi

# Start Uvicorn with live reload
exec uvicorn --reload --host $HOST --port $PORT --log-level $LOG_LEVEL "$APP_MODULE" "$ADDITIONAL_ARGS"
