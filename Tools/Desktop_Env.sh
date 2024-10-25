#!/bin/bash

cat logo.txt

#Desktop Enviroment
echo "Viper Offensive Toolkit Setup"
echo "Choose your Desktop Enviroment."
echo " (1) KDE Plasma"
echo " (2) XFCE"
echo " (3) Skip and keep the default."

echo "Enter Selection:"
read selection
if [ "$selection" -eq 1 ]; then
    sudo apt update
    sudo apt install kde-plasma-desktop -y


elif [ "$selection" -eq 2 ]; then
	sudo apt update &> /dev/null
	sudo apt install xfce4


elif [ "$selection" -eq 3 ]; then
	echo "Default Desktop Enviroment"
else
	echo "Invalid selection."
fi

echo "Finished..."
echo "Login to your new desktop enviroment and run the coresponding setup script. eg. KDE_Setup.sh"
