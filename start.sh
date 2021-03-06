#!/bin/bash

git pull
while true; do
	if [ ! -f "restart" ]; then
		echo
		echo -e "\e[42;30m START \e[0m"
		echo
	else
		rm restart # file created by bot
	fi
	luvit bot.lua 2>> >(tee -a errorlog) # this filename is important, used in the bot
	exitcode=$?
	if [ -f "restart" ]; then
		echo
		echo -e "\e[46;30m RESTART \e[0m"
		echo
	else
		echo
		echo -e "\e[43;30m STOP \e[0m"
		echo
	fi
	if [ $exitcode != "0" ]; then
		echo -e "\e[41;30m ERROR \e[0m Bot didn't exit cleanly, code: \e[30;46m $exitcode \e[0m"
	fi
done

