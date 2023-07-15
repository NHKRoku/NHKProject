#!/data/data/com.termux/files/usr/bin/bash

if ! [ -x "$(command -v screen)"  ] ; then
apt install wget -y
apt install screen -y
fi

if ! [ -x "$(command -v AdGuardHome)"  ] ; then
cd ~
wget https://static.adguard.com/adguardhome/release/AdGuardHome_linux_armv5.tar.gz
tar -zxvf AdGuardHome_linux_armv7.tar.gz
rm -rf AdGuardHome_linux_armv7.tar.gz
chmod +x AdGuardHome
cd AdGuardHome
cp AdGuardHome /data/data/com.termux/files/usr/bin/
cd ~
screen -dmS Ad sudo AdGuardHome
echo -e "\033[31mChrome ブラウザで開いてください、127.0.0.1:3000\033[0m"
echo ""
am start -a android.intent.action.VIEW -d http://127.0.0.1:3000

else
screen -dmS Ad sudo AdGuardHome
echo -e "\033[31mChrome ブラウザで開いてください、127.0.0.1\033[0m"
echo ""
am start -a android.intent.action.VIEW -d http://127.0.0.1
fi
