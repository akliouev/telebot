## telebot.sh

## A simple script to send telegram messages

telebot.sh is wirtten with minimal dependancies in mind. It requres only curl and bash to operate

# Installation

Just clone the repo to a destination, make telebot.sh executable

# Configuration
In order to operate, telebot.sh needs at least Telegram Bot token (ask BotFather for one). In order to send messages, it will need a "chat id".

telebot.sh will read a config file (~/.telebotrc) for the following configuration variables
- TOKEN -- Bot token
- CHATID -- Numeric chat id
- (optional) TELEBOTAPIURL -- basic api url instead of http://api.telegram.org
- (optional) CURL_OPTIONS -- any extra options you want curl to use

# Usage

Usage help is available with --help command line switch

To sent a message:
```sh
telebot.sh --token=<TOKEN> --chatid=<CHATID> "<message to be send>"
```
To get the latest updates for the bot:
```sh
telebot.sh --token=<TOKEN> --read
```

This will dump a JSON structure with the latest updates for the given bot token. Useful to figure out chat ids
