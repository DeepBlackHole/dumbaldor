#!/bin/bash
GREEN='\033[0;32m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${PURPLE}
⠀⠀⠀⠀⠀⠀⠀⠀⠢⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀
⠀⠀⠀⢀⠀⠀⠀⠀⣠⣴⡶⠂⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠁⠀⠀⣿⣿⠁⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀
⢀⠀⠀⠀⠀⠀⠀⢿⣿⡦⣀⣀⣴⠃⠀⠀⠀⠃⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠿⠛⠁⠀⠀⠀⠀⠀⠀⢀
⠀⡀⠀⠀⠀⠀⡏⢋⣭⣿⢍⡉⢈⡇⠀⠀⠀⠀⠀⠀
⣀⠁⠀⠀⠀⠀⠋⢁⡴⡳⢧⡈⠉⠀⠀⠈⠀⠀⠀⡀
⠀⠀⠀⠀⠀⠀⠰⠏⠀⣿⠀⠙⠓⠐⡄⠀⠀⠀⠐⡁
⠀⠀⠀⠀⢠⠖⠊⠉⠉⣿⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠓⠦⠤⠤⣿⠤⣀⡀⠀⠀⠀⡀⠀⠀⠀
⠀⠀⠀⣀⡀⠀⠀⠀⠀⣿⠀⠀⡸⠃⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠞⠁⠀⠀⠀⠀⠀⠀⠆⠀
⠀⠀⠀⠀⠀⠀⠂⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${NC}
${BOLD}${GREEN}       D U M B A L D O R${NC}
${CYAN}    macOS Tor IP Changer v1.0${NC}
"

interval=5

echo -e "${YELLOW}[*] Changing IP every ${interval}s"
echo ""
while true; do
  killall -HUP tor 2>/dev/null
  sleep 2
  ip=$(curl -s --socks5 127.0.0.1:9050 https://check.torproject.org/api/ip | grep -o '"IP":"[^"]*"')
  echo -e "${GREEN}[$i/$count]${NC} $ip"
  [ $i -lt $count ] && sleep $interval
done
echo ""
echo -e "${RED}[✓] Done${NC}"
