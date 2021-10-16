#!/bin/bash


# Verify if $USER is set to the current username

if [ -z ${USER+} ] ; then
        USER=$(whoami)
fi

CURL="/usr/bin/curl"
#CURL_OPTIONS="--socks5-hostname 127.0.0.1:9050 --silent"
CURL_OPTIONS=""

CONFIG_FILE=~/.telebotrc

if [ -e $CONFIG_FILE ] ; then
        source $CONFIG_FILE
fi


#
# Parse command line
#

for i in "$@"
do
case $i in
	-c=*|--chatid=*)
		CHATID="${i#*=}"
		shift
		;;
	-t=*|--token=*)
		TOKEN="${i#*=}"
		shift
		;;
	-h|--help)
		echo "Usage: $0 [-c=|-chatid=<CHATID>] [-t=|--token=<TOKEN>]"
		exit 0
		;;
	*)

		;;
	esac
done


if [ $# -eq 0 ] ; then
#	No text on comand line
	exit 0
fi

if [ -z "$CHATID" ] || [ -z "$TOKEN" ] ; then
	echo "Incomplete configuration"
	echo "\$CHATID and \$TOKEN required. Check $CONFIG_FILE"
	exit 1
fi

if [ "$#" -lt 1 ] ; then
	echo "Usage: $0 <text to post>"
	exit 1
fi

URL="https://api.telegram.org/bot$TOKEN/sendMessage"
TEXT="$1"
#echo "Sending message"
$CURL $CURL_OPTIONS -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
