#!/bin/bash

winExec() {
  VBoxManage guestcontrol "Windows 7 (IE9)" execute --image "cmd.exe" --username misko --password "" --wait-exit -- "/c" "$1" "$2" "$3" "$4" 
}

killIe() {
  winExec C:\\Windows\\system32\\taskkill.exe /IM iexplore.exe /F
}

trap "killIe; exit 0" EXIT

captureUrl=$1
winExec "C:\\Program Files\\Internet Explorer\\iexplore.exe" ${captureUrl/localhost/192.168.56.1}