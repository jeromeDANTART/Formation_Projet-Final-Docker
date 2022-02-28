#!/bin/bash
echo "*** Projet final ***"
echo "Lancement du playbook..."
ansible-playbook -i hosts playbook.yml --ssh-common-args='-o StrictHostKeyChecking=no'
