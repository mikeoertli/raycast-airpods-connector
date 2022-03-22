#!/bin/bash
# -*- coding: utf-8 -*-

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title AirPods Connector
# @raycast.mode silent
# @raycast.packageName Audio

# Optional parameters:
# @raycast.icon ./icon.png
# @raycast.iconDark ./icon.png

# Documentation:
# @raycast.author Mike Oertli
# @raycast.authorURL https://github.com/mikeoertli
# @raycast.description Toggle connection with AirPods

if command -v BluetoothConnector; then 
	confFile="./airpods-mac.conf"
	if [[ -f $confFile ]]; then
		export AIRPODS_MAC=`\cat ./airpods-mac.conf`
		status=$(BluetoothConnector --status "$AIRPODS_MAC")

		# The --notify shouldn't be necessary, but it appears to be required. I'm guessing due to how results are returned?
		if [ "$status" == "Connected" ]; then
			${HOMEBREW_PREFIX:-/opt/homebrew}/bin/BluetoothConnector --disconnect --notify $AIRPODS_MAC
			echo "👂 AirPods Disconnected!"
		else
			${HOMEBREW_PREFIX:-/opt/homebrew}/bin/BluetoothConnector --connect --notify $AIRPODS_MAC
			echo "🟢 AirPods Connected!"
		fi
	else
		echo "❌  airpods-mac.conf is missing!"
	fi
else
	echo "❌  BluetoothConnector is Missing!"
fi
