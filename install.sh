#!/bin/bash
echo "First, move this directory to a place where you won't move it again. This is because the script will add a line to your .zshrc file that will point to this directory. If you move this directory, you will need to update the .zshrc file manually."
unameOut="$(uname -s)"
case "${unameOut}" in
Linux*) machine=Linux ;;
Darwin*) machine=Mac ;;
CYGWIN*) machine=Cygwin ;;
MINGW*) machine=MinGw ;;
*) machine="UNKNOWN:${unameOut}" ;;
esac

if ! command -v zsh &>/dev/null; then
    echo "Zsh is not installed. Would you like to install it now? (y/n)"
    read install_zsh
else
    echo "Zsh is already installed. Skipping installation."
    install_zsh="n"
fi

if [ "$install_zsh" == "y" ]; then
    if [ "$machine" == "Mac" ]; then
        brew install zsh
    elif [ "$machine" == "Linux" ]; then
        sudo apt-get install zsh
    else
        echo "Unable to detect OS. Exiting script."
        exit 1
    fi
else
    echo "Skipping zsh installation."
fi

echo "Enter your OpenAI API key: "
read openaikey

sed -i '' "s/INSERT_KEY/${openaikey}/g" txt2cmd.py
sed -i '' "s|INSERT_CURRENT_DIR|$(pwd)|" addtozshrc.txt
sed -i '' "s/INSERT_OS_HERE/${machine}/" txt2cmd.py
cat addtozshrc.txt >>~/.zshrc

echo "Refresh shell to use. Press ctrl+R after you have typed your natural language command to convert it to bash."