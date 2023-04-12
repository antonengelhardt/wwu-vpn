echo "What platform are you on? (1) Linux, (2) macOS, (3) Windows"
read PLATFORM

if [ $PLATFORM -eq 1 ]; then
    echo "Installing for Linux..."
    sudo apt-get install openconnect oathtool
    echo "Done."
elif [ $PLATFORM -eq 2 ]; then
    echo "Installing for macOS..."
    brew install openconnect oath-toolkit
    echo "Done."
elif [ $PLATFORM -eq 3 ]; then
    echo "Installing for Windows..."
    if command -v choco &> /dev/null; then
        choco install openconnect oath-toolkit
    else
        echo "Chocolatey package manager is not installed on this system."
    fi
else
    echo "Invalid platform."
fi
