#!/bin/bash

SCRIPT_DIRECTORY="$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)"

if [ ! -d "/Applications/.Karabiner-VirtualHIDDevice-Manager.app" ]; then
  wget https://raw.github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice/main/dist/Karabiner-DriverKit-VirtualHIDDevice-5.0.0.pkg -O /tmp/Karabiner-DriverKit-VirtualHIDDevice.pkg
 
  open /tmp/Karabiner-DriverKit-VirtualHIDDevice.pkg
else
  echo "Karabiner-VirtualHIDDevice-Manager is already installed"
fi

wget https://github.com/jtroo/kanata/releases/download/v1.7.0-prerelease-1/kanata_macos_arm64 -O /tmp/kanata
sudo mv /tmp/kanata /usr/local/bin/kanata
chmod +x /usr/local/bin/kanata

if [ -f "/etc/kanata.kdb" ]; then
  echo "cleaning up the previous version of /etc/kanata.kdb"
  sudo rm -f /etc/kanata.kdb
fi

sudo cp ${SCRIPT_DIRECTORY}/kanata.kdb /etc/kanata.kdb

sudo launchctl disable system/dev.m19c.kanata
sudo launchctl disable gui/${UID}/dev.m19c.kanata

if [ -f "/Library/LaunchDaemons/dev.m19c.kanata.plist" ]; then
  echo "cleaning up the previous version of /Library/LaunchDaemons/dev.m19c.kanata.plist"
  sudo rm -f /Library/LaunchDaemons/dev.m19c.kanata.plist
fi

sudo cp ${SCRIPT_DIRECTORY}/dev.m19c.kanata.plist /Library/LaunchDaemons/dev.m19c.kanata.plist
sudo launchctl bootstrap system /Library/LaunchDaemons/dev.m19c.kanata.plist
sudo launchctl start dev.m19c.kanata

