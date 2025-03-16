
#!/bin/bash
 
entries="Logout Suspend Reboot Shutdown"
 
selected=$(printf '%s\n' $entries | rofi -dmenu | awk '{print tolower($1)}')
 
case $selected in
  logout)
    swaymsg exit;;
  suspend)
    exec notify-send "suspend!" && systemctl suspend;;
  reboot)
    exec notify-send "Restart!" && systemctl reboot;;
  shutdown)
    exec notify-send "Poweroff" && systemctl poweroff -i;;
esac
