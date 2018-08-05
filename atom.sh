# !/bin/bash

echo "Starting"

# depends -----------------------------------
echo "Installing depends..."
apt update
apt install toilet figlet screenfetch gradle default-jre default-jdk -y
# -------------------------------------------

# terminal setup ----------------------------
clear
echo "System Info:"
screenfetch
sleep 5
clear
figlet AtomMc Script
# -------------------------------------------

echo "type "help" for help"
read -p "Atom> "

if [[ $REPLY = help ]]
then
    echo "Commands:"
    echo "help - lists commands"
    echo "quit - exits this cli"
    echo "clear - clears the cli"
    echo "minecraft - starts up a minecraft client"
    echo "update - updates src"
    echo "build - builds AtomMC from src"
    echo "install - package manager for apt to get dependencies"
fi

if [[ $REPLY = quit ]]
then
    exit
fi

if [[ $REPLY = clear ]]
then
    clear
fi

if [[ $REPLY = minecraft ]]
then
    sudo apt install default-jre default-jdk -y
    wget http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
    rm Minecraft.jar.*
    java -jar Minecraft.jar
fi

if [[ $REPLY = build ]]
then
    echo "Make sure gradle and java are installed."
    echo "To install maven, run "install maven" followed buy "install java" in this cli."
    sleep 3
    git clone https://github.com/AtomMC/AtomMC.git
    cd AtomMC
    gradle build
    gradle dumpLibs
    sleep 3
    mkdir server
    mv ./build/libraries/ ./server/libraries
    cd ..
    cd mcserver
    java -jar glowstone.jar
    cd ..
fi

if [[ $REPLY = update ]]
then
    git fetch https://github.com/AtomMC/AtomMC
fi

if [[ $REPLY = install ]]
then
    echo "Invalid Usage: install [App]"
    echo "To see a list of apps you can install, run "install list""
fi

if [[ $REPLY = "install list" ]]
then
    echo "Installable Apps:"
    echo "java"
    echo "gradle"
fi

if [[ $REPLY = "install java" ]]
then
    sudo apt install default-jre default-jdk -y
fi

if [[ $REPLY = "install gradle" ]]
then
    apt install gradle -y
fi
