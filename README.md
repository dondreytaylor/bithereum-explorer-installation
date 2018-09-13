# Bithereum Explorer Installation Script

PLEASE NOTE: This script assumes you are running Ubuntu 18.04. For any other version of Ubuntu, please update the MongoDB installation portion of the script, to reflect the version compatible with your flavor of Ubuntu.

```
# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
```

# Prerequisite
Ubuntu 18.04

# Run Installation
Run the explorer.sh file from within your home directory to start the installation.

```
./install.sh
```
