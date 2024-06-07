# SSH Host Configurator

![SSH Logo](https://img.shields.io/badge/SSH-Configurator-blue.svg)
![Bash Script](https://img.shields.io/badge/Bash-Script-brightgreen.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

## Overview

Welcome to the **SSH Host Configurator**! This powerful and user-friendly bash script automates the process of adding SSH hosts and distributing SSH keys. Whether you are managing a few servers or a complex infrastructure, this tool ensures seamless and secure SSH access by efficiently managing your `~/.ssh/config` file and distributing SSH keys across multiple remote servers with ease.

## Features

- 🚀 **Automated SSH Key Distribution**: Effortlessly copy your SSH public key to remote hosts, enabling passwordless SSH access.
- ⚙️ **Automatic SSH Config Management**: Dynamically adds new SSH host configurations to your `~/.ssh/config` file.
- 🔒 **Password Prompt for Authentication**: Automatically prompts for a password if SSH key authentication fails.
- 🔑 **Custom SSH Key Support**: Flexibly specify a custom SSH identity file for your connections.
- 🛡️ **Backup and Permissions**: Reliably creates backups of your SSH config file and ensures proper file permissions for security.

## Requirements

Before you begin, ensure you have the following installed:

- `sshpass` (required for password-based SSH key copying)
- `ssh` (standard SSH client)

## Installation

### Step 1: Clone the Repository

Start by cloning the repository and navigating into the project directory:

git clone https://github.com/morteck/ssh-host-configurator.git
cd ssh-host-configurator

Usage
Add a New SSH Host
To add a new SSH host and distribute your SSH key, simply run the script and follow the prompts:

./ssh-host-configurator.sh
Custom SSH Key
If you want to use a custom SSH key, provide the path to your identity file:

./ssh-host-configurator.sh -i /path/to/your/custom_key

Happy configuring! 🎉
