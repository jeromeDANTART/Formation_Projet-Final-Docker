#!/bin/bash
echo "*** Projet final ***"
echo "Infos EC2 pour le dev: "
read USER

ID=$(aws ec2 describe-instances \
  --query "Reservations[0].Instances[0].InstanceId" \
  --filters Name=tag:Name,Values=$USER Name=instance-state-name,Values=running)

ID_CLEAN=`echo $ID | tr -d '"'`

echo "[+] EC2 instance ID: $ID_CLEAN"

PUBLIC_DNS=$(aws ec2 describe-instances \
  --instance-ids $ID_CLEAN \
  --query "Reservations[0].Instances[0].PublicDnsName" | tr -d '"')

echo "[+] Public DNS: $PUBLIC_DNS"