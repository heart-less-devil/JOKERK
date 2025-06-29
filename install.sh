#!/bin/bash

# JokerK Installation Script
# Quick installation for Kali Linux

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🚀 Installing JokerK...${NC}"

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    echo -e "${RED}❌ Don't run as root${NC}"
    exit 1
fi

# Install dependencies
echo -e "${BLUE}📦 Installing dependencies...${NC}"
sudo apt update
sudo apt install -y python3 python3-pip tor git

# Start Tor service
echo -e "${BLUE}🔧 Starting Tor service...${NC}"
sudo systemctl start tor
sudo systemctl enable tor

# Install Python packages
echo -e "${BLUE}🐍 Installing Python packages...${NC}"
pip3 install --user requests beautifulsoup4 lxml colorama tqdm fake-useragent stem PySocks

# Install JokerK
echo -e "${BLUE}🔧 Installing JokerK...${NC}"
python3 setup.py install --user

# Make script executable
chmod +x jokerk.sh

echo -e "${GREEN}✅ Installation complete!${NC}"
echo -e "${YELLOW}📝 Usage:${NC}"
echo "  ./jokerk.sh install"
echo "  jokerk --help" 