#!/usr/bin/env sh
set -eu

echo "setting up UT99"
cd ut-server
chmod +x ucc

echo "installing asu addon"
chmod +x asu.sh

echo "
I
ut99

1



P
y
n
n
n
y
O
C
20000
I
120
X
X
" | bash ./asu.sh

echo "fixing System"
cd System
ln -s libSDL-1.1.so.0 libSDL-1.2.so.0
chmod +x ucc-bin

echo "Reconfiguring UnrealTournament.ini"
sed -i "s/ServerName=.*/ServerName=${SERVER_NAME}/g" UnrealTournament.ini
sed -i "s/ShortName=.*/ShortName=${SERVER_SHORT_NAME}/g" UnrealTournament.ini
sed -i "s/AdminUsername=.*/AdminUsername=${ADMIN_USERNAME}/g" UnrealTournament.ini
sed -i "s/AdminPassword=.*/AdminPassword=${ADMIN_PASSWORD}/g" UnrealTournament.ini
sed -i "s/bEnabled=.*/bEnabled=True\nListenPort=8080\nServerName=${SERVER_NAME}/g" UnrealTournament.ini

cd ..

echo "fixing libnsl"
ln -s /usr/lib/libnsl.so.2 /usr/lib/libnsl.so.1

echo "chowning for ut99"
chown -R ut99:ut99 .
