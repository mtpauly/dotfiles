#!/usr/bin/env bash
set -euo pipefail

label=com.local.KeyRemapping
domain="gui/$(id -u)"
service="$domain/$label"
plist="$HOME/Library/LaunchAgents/$label.plist"

if [[ ! -f "$plist" ]]; then
    echo "Missing LaunchAgent: $plist (run ./setup.sh first)" >&2
    exit 1
fi

if launchctl print "$service" >/dev/null 2>&1; then
    launchctl bootout "$service"
fi

launchctl bootstrap "$domain" "$plist"
launchctl kickstart -k "$service"

launchctl print "$service"

# NOTE: If the keybinds aren't working on a new machine you may need to manually enable input
# monitoring for the hidutil executable in system settings.
