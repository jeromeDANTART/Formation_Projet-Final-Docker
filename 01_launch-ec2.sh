#!/bin/bash
AMI=ami-0d527b8c289b4af7f # ubuntu server 20.4 pour la région eu-central-1
TYPE=t2.micro
SG=sg-047f2aaa7109444d2 # identifiant de "Security Group" 
KEY=akka # nom de la "key pair" ssh utilisée

echo "*** Projet final ***"
echo "Lancement une instance EC2 pour le dev: "
read USER

aws ec2 run-instances \
  --image-id $AMI  \
  --instance-type $TYPE  \
  --security-group-ids $SG \
  --key-name $KEY \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$USER}]"

echo "[+] instance EC2 créée"