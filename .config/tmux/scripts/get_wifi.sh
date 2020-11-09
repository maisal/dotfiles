#!/bin/bash

if [ `networksetup -getairportpower en0|rg -o ':\s+(.+)$' -r '$1'` = "Off" ]; then
  echo '睊off'
else
  echo -n 直 `networksetup -getairportnetwork en0|rg -o ':\s(.+)$' -r '$1'`
fi
