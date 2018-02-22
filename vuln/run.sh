#!/bin/bash

NAME=$1
CONTAINER_ID="$NAME-$REMOTE_HOST-$((RANDOM))"

exec 2>/dev/null
timeout --signal=KILL 60 runc run --bundle /vuln/box/$NAME $CONTAINER_ID
runc delete -f $CONTAINER_ID
