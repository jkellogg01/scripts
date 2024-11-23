#! /usr/bin/env bash

export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt6ct

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1

export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

exec sway
