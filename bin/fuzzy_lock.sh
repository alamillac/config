#!/bin/bash

screen_off() {
    sleep 60; pgrep i3lock && xset dpms force off
}

# Take a screenshot
scrot /tmp/screen_locked.png

# Pixellate it 5x
mogrify -scale 20% -scale 500% /tmp/screen_locked.png

# Lock screen displaying this image.
i3lock -i /tmp/screen_locked.png

# Turn the screen off after a delay.
[ "$1" == "--no-off" ] || screen_off
