#!/bin/zsh
YABAI=/opt/homebrew/bin/yabai
BC=/usr/bin/bc

function toggle_maximize {
    local window_id=$($YABAI -m query --windows --window | jq '.id')
    local window_width=$($YABAI -m query --windows --window | jq '.frame.w')
    local display_width=$($YABAI -m query --displays --display | jq '.frame.w')
    local window_ratio=$($BC -l -S 2 -e "ceil($window_width / $display_width, 1)")
    local split_child=$($YABAI -m query --windows --window | jq -r '."split-child"')
    local old_ratio_file="/var/tmp/wnd_${window_id}"

    if [[ $window_ratio == ".9" ]]; then
        local old_ratio=$(cat $old_ratio_file)
        if [[ $split_child == "second_child" ]]; then
            local expr_="1.0 - $old_ratio"
        else
            local expr_="$old_ratio"
        fi
        $YABAI -m window --ratio abs:$($BC -l -S 2 -e "ceil($expr_, 1)")
        rm $old_ratio_file
    else
        echo $window_ratio > $old_ratio_file
        if [[ $split_child == "second_child" ]]; then
            local max_ratio=0.1
        else
            local max_ratio=0.9
        fi
        $YABAI -m window --ratio abs:$max_ratio
    fi
}

toggle_maximize
