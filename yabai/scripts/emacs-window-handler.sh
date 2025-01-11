#!/bin/zsh
YABAI=/opt/homebrew/bin/yabai

data=$($YABAI -m query --windows --window $YABAI_WINDOW_ID)

title=$(echo $data | jq .title)
display=$(echo $data | jq .display)

if [[ $title =~ "org-capture" && $display == 1 ]]; then
    $YABAI -m window $YABAI_WINDOW_ID --toggle float --move abs:430:230
    $YABAI -m window $YABAI_WINDOW_ID --resize abs:655:600
    $YABAI -m window $YABAI_WINDOW_ID --focus
elif [[ $title =~ "clipr-show" && $display == 1 ]]; then
    $YABAI -m window $YABAI_WINDOW_ID --toggle float --move abs:430:230
    $YABAI -m window $YABAI_WINDOW_ID --resize abs:655:600
    $YABAI -m window $YABAI_WINDOW_ID --focus
else
    false
fi
