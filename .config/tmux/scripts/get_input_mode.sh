#!/bin/sh
defaults read ~/Library/Preferences/com.apple.HIToolbox.plist  AppleSelectedInputSources|rg -o '"Input Mode"\s+=\s+"com\.apple\..+\.(\w+)";' -r '$1'
