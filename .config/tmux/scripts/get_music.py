#!/usr/bin/env python3

import sys

import appscript

music = appscript.app("Music")
if not music.isrunning():
    sys.exit()
else:
    position = music.player_position.get()
    if type(position) != float:
        sys.exit()
    else:
        title = music.current_track.name.get()
        ttime = music.current_track.time.get()
        if 59 < position:
            min = int(position // 60)
            sec = int(position % 60)
        else:
            min = 0
            sec = int(position // 1)
        print(f"{title} ({min}:{sec:02}/{ttime}) ")
