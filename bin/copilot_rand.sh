#!/bin/bash

COPILOT_ENABLED=$(($RANDOM % 2))
[ "$COPILOT_ENABLED" -eq 1 ] || touch /tmp/copilot_disabled
