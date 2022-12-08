#!/usr/local/bin/dash
option0="  lock"
option1="  logout"
option2="鈴  suspend"
option3="  shutdown"
option4="  reboot"
options="$option0\n$option1\n$option2\n$option3\n$option4"
chosen="$(echo "$options" | dmenu -l 9 -p "")"
case $chosen in
$option0) xlock -mode qix;;
$option1) killall -u $USER;;
$option2) xlock -mode qix & acpiconf -s 3;;
$option3) poweroff;;
$option4) pkexec reboot;;
esac
