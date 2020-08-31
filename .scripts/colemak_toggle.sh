if setxkbmap -query | grep -q colemak; then
    setxkbmap us
else
    setxkbmap us -variant colemak
fi

# Reenable compose key
xmodmap -e "keycode 94 = Multi_key"
