#!/bin/bash
# Automate Host Addition and Key Distribution for Hassle-Free SSH Access

# Check if the correct number of arguments is provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <username> <host> [identity_file]"
    exit 1
fi

USERNAME="$1"
HOST="$2"
IDENTITY_FILE="${3:-$HOME/.ssh/id_rsa}"
SSH_DIR="$HOME/.ssh"
CONFIG_FILE="$SSH_DIR/config"

# Ensure SSH directory exists
if [ ! -d "$SSH_DIR" ]; then
    mkdir -p "$SSH_DIR"
fi

# Ensure SSH config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    touch "$CONFIG_FILE"
fi

# Backup the SSH config file
cp "$CONFIG_FILE" "$CONFIG_FILE.bak"

# Copy SSH key to the remote host
if ssh-copy-id -i "$IDENTITY_FILE" "$USERNAME@$HOST"; then
    echo "SSH key copied to $USERNAME@$HOST"
else
    echo "Failed to copy SSH key to $USERNAME@$HOST"
    exit 1
fi

# Add the host to the SSH config file if not already present
if ! grep -q "Host $HOST" "$CONFIG_FILE"; then
    {
        echo -e "\nHost $HOST"
        echo "    HostName $HOST"
        echo "    User $USERNAME"
        echo "    IdentityFile $IDENTITY_FILE"
    } >> "$CONFIG_FILE"
    echo "Host $HOST added to $CONFIG_FILE"
else
    echo "Host $HOST already exists in $CONFIG_FILE"
fi

# Set correct permissions on the config file
chmod 600 "$CONFIG_FILE"

echo "Configuration completed successfully."
