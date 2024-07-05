#!/bin/bash

# Function to install cpolar
install_cpolar() {
    # Check if cpolar is already installed
    if ! command -v cpolar &> /dev/null
    then
        echo "cpolar is not installed. Installing cpolar..."
        sudo apt-get install curl -y
        curl -L https://www.cpolar.com/static/downloads/install-release-cpolar.sh | sudo bash
        echo "cpolar installed successfully."
    else
        echo "cpolar is already installed."
    fi

    # Check if token exists in /usr/local/etc/cpolar/cpolar.yml
    if ! grep -q "authtoken:" /usr/local/etc/cpolar/cpolar.yml 2>/dev/null; then
        read -p "Please enter your cpolar authtoken: " user_token
        cpolar authtoken "$user_token"
    else
        echo "cpolar authtoken already exists in configuration, skipping input."
    fi

    # Enable and start cpolar service
    sudo systemctl enable cpolar
    sudo systemctl start cpolar

    # Check service status
    sudo systemctl status cpolar | grep "active (running)" &> /dev/null

    if [ $? -eq 0 ]; then
        echo "cpolar service is running."
    else
        echo "Failed to start cpolar service, please check the logs."
    fi

    # Ask if the user wants to create a systemd service for cpolar http
    read -p "Do you want to create a systemd service for 'cpolar http'? (y/n): " create_service

    if [ "$create_service" == "y" ]; then
        read -p "Enter the port number you want to use for 'cpolar http': " port_number

        # Create a systemd service for cpolar http with the specified port
        echo "Creating systemd service for 'cpolar http $port_number'..."
        sudo bash -c "cat > /etc/systemd/system/cpolar-http.service <<EOF
[Unit]
Description=Cpolar HTTP Tunnel Service
After=network.target

[Service]
ExecStart=/usr/local/bin/cpolar http $port_number
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF"

        # Enable and start the cpolar-http service
        sudo systemctl daemon-reload
        sudo systemctl enable cpolar-http
        sudo systemctl start cpolar-http

        # Check cpolar-http service status
        sudo systemctl status cpolar-http | grep "active (running)" &> /dev/null

        if [ $? -eq 0 ]; then
            echo "cpolar-http service is running and will start on boot."
        else
            echo "Failed to start cpolar-http service, please check the logs."
        fi
    else
        echo "Skipped creating systemd service for 'cpolar http'."
    fi
}

# Function to uninstall cpolar
uninstall_cpolar() {
    echo "Uninstalling cpolar..."
    curl -L https://www.cpolar.com/static/downloads/install-release-cpolar.sh | sudo bash -s -- --remove
    echo "cpolar uninstalled successfully."

    # Disable and stop cpolar service
    sudo systemctl disable cpolar
    sudo systemctl stop cpolar

    # Remove the cpolar-http systemd service if it exists
    if [ -f /etc/systemd/system/cpolar-http.service ]; then
        sudo systemctl disable cpolar-http
        sudo systemctl stop cpolar-http
        sudo rm /etc/systemd/system/cpolar-http.service
        sudo systemctl daemon-reload
        echo "cpolar-http service removed successfully."
    fi
}

# Main script execution
echo "Select an option:"
echo "1. Install cpolar"
echo "2. Uninstall cpolar"
read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        install_cpolar
        ;;
    2)
        uninstall_cpolar
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac
