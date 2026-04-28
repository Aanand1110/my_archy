#!/bin/sh

# run this script if you want to configure docker and K8

result=""
sudo pacman -S docker
sudo pacman -S docker-compose
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker $USER

sudo pacman -S minikube
sudo pacman -S kubectl
echo $result