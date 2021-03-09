#!/bin/sh

if [ `networksetup -getairportpower en0|rg -o ':\s+(.+)$' -r '$1'` = "Off" ]; then
  echo '睊off'
else
  echo 直 `networksetup -getairportnetwork en0|rg -o ':\s(.+)$' -r '$1'`
fi
