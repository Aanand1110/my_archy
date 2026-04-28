#!/bin/sh

# run this script if you want to configure docker and K8

result=""
sudo pacman -S docker
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed docker.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot install docker for some resaon (run 'sudo pacman -S docker').\e[0m\n")
fi
sudo pacman -S docker-compose
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed docker-compose.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot install docker-compose for some resaon (run 'sudo pacman -S docker-compose').\e[0m\n")
fi
sudo systemctl enable docker.service
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully enabled docker.service.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot enable docker.service.(run 'sudo systemctl enable docker.service').\e[0m\n")
fi
sudo systemctl start docker.service
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully started docker.service.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot start docker.service.(run 'sudo systemctl sttart docker.service').\e[0m\n")
fi
sudo usermod -aG docker $USER
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully added this user to docker group.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot add this user to docker group.\e[0m\n")
fi

sudo pacman -S minikube
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed minikube.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot install minikube for some resaon (run 'sudo pacman -S minikube').\e[0m\n")
fi
sudo pacman -S kubectl
if [ $? -eq 0 ]; then
    result+=$(echo -e "\033[0;32m✓ Successfully installed kubectl.\033[0m\n")
else 
    result+=$(echo -e "\e[31m✕ Couldnot install kubectl for some resaon (run 'sudo pacman -S kubectl').\e[0m\n")
fi
echo $result