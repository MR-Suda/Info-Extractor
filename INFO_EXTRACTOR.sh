#!/bin/bash

# LINUX FUNDAMENTALS | PROJECT: INFO EXTRACTOR
# Student Name: 
# Program Code: 
# Class Code: RTX
# Lecturer: Shiffman David

function root() {
		
	if [[ $EUID -ne 0 ]]; then

		figlet "INFO EXTRACTOR"
		echo
		echo -e "\nSorry, script must be run as root."
		echo -e "\nExiting..."
		sleep 2
		exit
			  
	else
	
		tool_check
	
	fi
}

function tool_check() {
	
	if ! command -v dialog &>/dev/null; then
		echo -e "\e[33m[!] 'dialog' is not installed. Installing now...\e[0m"
		sleep 1
		apt install dialog -y > /dev/null 2>&1
		if [[ $? -ne 0 ]]; then
			echo -e "\e[31m[!] Failed to install 'dialog'. Exiting.\e[0m"
			exit 1
		fi
	else
		echo -e "\e[32m[✔] 'dialog' is already installed.\e[0m"
	fi
	info
}

function draw_ascii_bar() {
	local percent=$1
	local total_blocks=30
	local filled_blocks=$(( percent * total_blocks / 100 ))
	local empty_blocks=$(( total_blocks - filled_blocks ))

	local filled_bar=$(printf '\e[32m█\e[0m%.0s' $(seq 1 $filled_blocks))
	local empty_bar=$(printf '\e[90m░\e[0m%.0s' $(seq 1 $empty_blocks))

	echo -e "   $filled_bar$empty_bar  ${percent}%"
}

function info() {
	
	clear
	fig=$(figlet -w 100 'INFO EXTRACTOR')
	echo -e "\e[31m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m"
	echo -e "\e[31m│\e[0m \e[32m ___ _   _ _____ ___    _______  _______ ____      _    ____ _____ ___  ____ \e[0m  \e[31m│\e[0m"
	echo -e "\e[31m│\e[0m \e[32m|_ _| \ | |  ___/ _ \  | ____\ \/ /_   _|  _ \    / \  / ___|_   _/ _ \|  _ \ \e[0m \e[31m│\e[0m"
	echo -e "\e[31m│\e[0m \e[32m | ||  \| | |_ | | | | |  _|  \  /  | | | |_) |  / _ \| |     | || | | | |_) | \e[0m\e[31m│\e[0m"
	echo -e "\e[31m│\e[0m \e[32m | || |\  |  _|| |_| | | |___ /  \  | | |  _ <  / ___ \ |___  | || |_| |  _ < \e[0m \e[31m│\e[0m"
	echo -e "\e[31m│\e[0m \e[32m|___|_| \_|_|   \___/  |_____/_/\_\ |_| |_| \_\/_/   \_\____| |_| \___/|_| \_\ \e[0m\e[31m│\e[0m"
	echo -e "\e[31m│\e[0m \e[32m                                                                             \e[0m  \e[31m│\e[0m"
	echo -e "\e[31m│\e[0m \e[32mDate: $(date '+%Y-%m-%d %H:%M:%S')\e[0m \e[31m       By MR-SUDA                                    │\e[0m"
	echo -e "\e[31m└────────────────────────────────────────────────────────────────────────────────┘\e[0m"
	echo -e ""

	pu_ip=$(curl -s ifconfig.me)
	echo -e "\n\e[32m[ ================== Public IP ================== ]\e[0m"
	echo -e "\n$pu_ip"

	pr_ip=$(hostname -I)
	echo -e "\n\e[32m[ ================== Private IP ================= ]\e[0m"
	echo -e "\n$pr_ip"

	mac=$(ip link show | awk '/ether/ {print $2}')
	echo -e "\n\e[32m[ ===================== MAC ===================== ]\e[0m"
	echo -e "\n$mac"

	os_name=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d= -f2 | tr -d '"')
	kernel=$(uname -r)
	arch=$(uname -m)
	uptime=$(uptime -p)
	echo -e "\n\e[32m[ ================== OS System ================== ]\e[0m"
	echo -e "\nDistro - $os_name"
	echo -e "Kernel - $kernel"
	echo -e "Arch   - $arch"
	echo -e "Uptime - $uptime"

	cpu=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)
	t_cpu=$(ps -eo %cpu --sort=-%cpu | sed 1d | head -n 5 | awk '{sum += $1} END {printf "%.2f%%\n", sum}')
	t_cpu_int=$(echo "$t_cpu" | tr -d '%' | cut -d'.' -f1)
	echo -e "\n\e[32m[ ============= Top 5 CPU Processes ============= ]\e[0m"
	echo -e "\n$cpu"
	echo
	draw_ascii_bar "$t_cpu_int"

	mem_total=$(free | awk '/Mem:/ {print $2}')
	mem_free=$(free | awk '/Mem:/ {print $7}')
	mem_used_percent=$(( 100 - (mem_free * 100 / mem_total) ))
	memory=$(free -h | awk '/Mem:/ {print "Total:", $2, "| Available:", $7}')
	echo -e "\n\e[32m[ ================ Memory Usage ================= ]\e[0m"
	echo -e "\n$memory"
	echo
	draw_ascii_bar "$mem_used_percent"

	top=$(find /home -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 10)
	echo -e "\n\e[32m[ === TOP-10 Largest Files in /home Directory === ]\e[0m"
	echo -e "\n$top"

	echo -e "\n\e[32m[ =============== System Services =============== ]\e[0m"
	echo
	read -p "Would you like to see the list of active system services with their status? [Y/N] - " ans

	if [[ "$ans" == [Yy] ]]; then
		service --status-all > ./temp_system.txt 2>&1
		echo -e "\n\e[32m[ =============== Running Services ============== ]\e[0m"
		echo
		grep "\[ + \]" ./temp_system.txt
		echo -e "\n\e[31m[ =============== Stopped Services ============== ]\e[0m"
		echo
		grep "\[ - \]" ./temp_system.txt
		echo -e "\n\e[34m[ =============== Unknown Services ============== ]\e[0m"
		echo
		grep "\[ ? \]" ./temp_system.txt
		rm ./temp_system.txt
	else
		echo -e "\nSkipping the list of active system services and \e[31mExiting\e[0m."
		echo
	fi
		echo -e "\e[33mDone !\e[0m"	
}

root
