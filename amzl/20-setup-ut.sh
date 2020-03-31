#!/usr/bin/env sh
set -eu

echo "setting up UT99"
aws s3 cp "s3://${S3_ARTIFACTS_BUCKET}/ut-server-436.tar.gz"  .

tar -zxf ut-server-436.tar.gz
cd ut-server
chmod +x ucc

echo "patching UT99"
aws s3 cp "s3://${S3_ARTIFACTS_BUCKET}/UTPGPatch451LINUX.tar.tar"  .
tar xfj UTPGPatch451LINUX.tar.tar
rm UTPGPatch451LINUX.tar.tar

echo "installing asu addon"
aws s3 cp "s3://${S3_ARTIFACTS_BUCKET}/asu-0.6.tar.gz" .
tar -zxf asu-0.6.tar.gz
rm asu-0.6.tar.gz
chmod +x asu.sh

echo "
I
ec2-user

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
chmod +x ucc-bin

echo "Reconfiguring UnrealTournament.ini"
sed -i "s/ServerName=.*/ServerName=${SERVER_NAME}/g" UnrealTournament.ini
sed -i "s/ShortName=.*/ShortName=${SERVER_SHORT_NAME}/g" UnrealTournament.ini
sed -i "s/AdminUsername=.*/AdminUsername=${ADMIN_USERNAME}/g" UnrealTournament.ini
sed -i "s/AdminPassword=.*/AdminPassword=${ADMIN_PASSWORD}/g" UnrealTournament.ini
sed -i "s/bEnabled=.*/bEnabled=True\nListenPort=8080\nServerName=${SERVER_NAME}/g" UnrealTournament.ini

cd ..

echo "chowning for ec2-user"
chown -R ec2-user:ec2-user .
