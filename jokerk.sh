#!/bin/bash

# JokerK - Advanced Onion Search Tool with Tor IP Rotation
# Installation and usage script for Kali Linux

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner
print_banner() {
    echo -e "${RED}"
    echo " ██╗ ██████╗ ██╗  ██╗███████╗██████╗ ██╗  ██╗"
    echo " ██║██╔═══██╗██║ ██╔╝██╔════╝██╔══██╗██║ ██╔╝"
    echo " ██║██║   ██║█████╔╝ █████╗  ██████╔╝█████╔╝ "
    echo " ██║██║   ██║██╔═██╗ ██╔══╝  ██╔══██╗██╔═██╗ "
    echo " ██║╚██████╔╝██║  ██╗███████╗██║  ██║██║  ██╗"
    echo " ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝"
    echo -e "${NC}"
    echo -e "${CYAN}Advanced Onion Search Tool with Tor IP Rotation${NC}"
    echo -e "${YELLOW}Version 1.0.0 | Educational Purposes Only${NC}"
    echo ""
}

# Check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        echo -e "${RED}❌ This script should not be run as root${NC}"
        exit 1
    fi
}

# Check system requirements
check_requirements() {
    echo -e "${BLUE}🔍 Checking system requirements...${NC}"
    
    # Check if Python 3 is installed
    if ! command -v python3 &> /dev/null; then
        echo -e "${RED}❌ Python 3 is not installed${NC}"
        echo -e "${YELLOW}Please install Python 3: sudo apt update && sudo apt install python3 python3-pip${NC}"
        exit 1
    fi
    
    # Check Python version
    python_version=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
    required_version="3.7"
    
    if [ "$(printf '%s\n' "$required_version" "$python_version" | sort -V | head -n1)" != "$required_version" ]; then
        echo -e "${RED}❌ Python 3.7 or higher is required (found: $python_version)${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ Python 3.7+ found: $python_version${NC}"
    
    # Check if pip is installed
    if ! command -v pip3 &> /dev/null; then
        echo -e "${RED}❌ pip3 is not installed${NC}"
        echo -e "${YELLOW}Please install pip3: sudo apt install python3-pip${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ pip3 found${NC}"
}

# Install Tor if not present
install_tor() {
    echo -e "${BLUE}🔍 Checking Tor installation...${NC}"
    
    if ! command -v tor &> /dev/null; then
        echo -e "${YELLOW}⚠️ Tor is not installed. Installing...${NC}"
        sudo apt update
        sudo apt install -y tor
        echo -e "${GREEN}✅ Tor installed successfully${NC}"
    else
        echo -e "${GREEN}✅ Tor is already installed${NC}"
    fi
    
    # Start Tor service
    echo -e "${BLUE}🚀 Starting Tor service...${NC}"
    sudo systemctl start tor
    sudo systemctl enable tor
    
    # Check Tor status
    if sudo systemctl is-active --quiet tor; then
        echo -e "${GREEN}✅ Tor service is running${NC}"
    else
        echo -e "${RED}❌ Failed to start Tor service${NC}"
        exit 1
    fi
}

# Install JokerK
install_jokerk() {
    echo -e "${BLUE}📦 Installing JokerK...${NC}"
    
    # Create installation directory
    INSTALL_DIR="$HOME/.jokerk"
    mkdir -p "$INSTALL_DIR"
    cd "$INSTALL_DIR"
    
    # Download requirements
    echo -e "${BLUE}📥 Installing Python dependencies...${NC}"
    pip3 install --user requests beautifulsoup4 lxml colorama tqdm fake-useragent stem PySocks
    
    # Install JokerK
    echo -e "${BLUE}🔧 Installing JokerK...${NC}"
    if [ -d "JokerK" ]; then
        cd JokerK
        git pull
    else
        git clone https://github.com/jokerk/JokerK.git
        cd JokerK
    fi
    
    pip3 install --user -e .
    
    echo -e "${GREEN}✅ JokerK installed successfully${NC}"
}

# Create alias
create_alias() {
    echo -e "${BLUE}🔗 Creating jokerk alias...${NC}"
    
    # Add alias to bashrc
    ALIAS_LINE="alias jokerk='python3 -m jokerk.cli'"
    
    if ! grep -q "alias jokerk=" ~/.bashrc; then
        echo "$ALIAS_LINE" >> ~/.bashrc
        echo -e "${GREEN}✅ Alias added to ~/.bashrc${NC}"
    else
        echo -e "${YELLOW}⚠️ Alias already exists in ~/.bashrc${NC}"
    fi
    
    # Source bashrc for current session
    source ~/.bashrc
}

# Show usage examples
show_examples() {
    echo -e "${CYAN}📚 Usage Examples:${NC}"
    echo ""
    echo -e "${GREEN}Basic search:${NC}"
    echo "  jokerk \"bitcoin mixer\""
    echo ""
    echo -e "${GREEN}Search with IP rotation:${NC}"
    echo "  jokerk \"marketplace\" --tor-rotation"
    echo ""
    echo -e "${GREEN}Search specific engines:${NC}"
    echo "  jokerk \"forum\" --engines ahmia tor66 --limit 5"
    echo ""
    echo -e "${GREEN}Advanced search with custom settings:${NC}"
    echo "  jokerk \"search term\" --tor-rotation --rotation-interval 10 --output results.csv"
    echo ""
    echo -e "${GREEN}Get help:${NC}"
    echo "  jokerk --help"
    echo "  jokerk --help-detailed"
    echo ""
}

# Main installation function
install() {
    print_banner
    echo -e "${BLUE}🚀 Starting JokerK installation...${NC}"
    echo ""
    
    check_root
    check_requirements
    install_tor
    install_jokerk
    create_alias
    
    echo ""
    echo -e "${GREEN}🎉 JokerK installation completed successfully!${NC}"
    echo ""
    echo -e "${YELLOW}📝 Next steps:${NC}"
    echo "  1. Restart your terminal or run: source ~/.bashrc"
    echo "  2. Start using JokerK with: jokerk --help"
    echo ""
    show_examples
}

# Uninstall function
uninstall() {
    print_banner
    echo -e "${YELLOW}🗑️ Uninstalling JokerK...${NC}"
    
    # Remove alias
    sed -i '/alias jokerk=/d' ~/.bashrc
    
    # Remove installation directory
    INSTALL_DIR="$HOME/.jokerk"
    if [ -d "$INSTALL_DIR" ]; then
        rm -rf "$INSTALL_DIR"
        echo -e "${GREEN}✅ Removed installation directory${NC}"
    fi
    
    # Uninstall Python package
    pip3 uninstall -y jokerk 2>/dev/null || true
    
    echo -e "${GREEN}✅ JokerK uninstalled successfully${NC}"
}

# Check Tor status
check_tor() {
    print_banner
    echo -e "${BLUE}🔍 Checking Tor status...${NC}"
    
    if sudo systemctl is-active --quiet tor; then
        echo -e "${GREEN}✅ Tor service is running${NC}"
        
        # Check control port
        if nc -z localhost 9051 2>/dev/null; then
            echo -e "${GREEN}✅ Tor control port (9051) is accessible${NC}"
        else
            echo -e "${YELLOW}⚠️ Tor control port (9051) is not accessible${NC}"
            echo -e "${YELLOW}You may need to configure Tor control port in /etc/tor/torrc${NC}"
        fi
        
        # Check SOCKS port
        if nc -z localhost 9050 2>/dev/null; then
            echo -e "${GREEN}✅ Tor SOCKS port (9050) is accessible${NC}"
        else
            echo -e "${RED}❌ Tor SOCKS port (9050) is not accessible${NC}"
        fi
        
    else
        echo -e "${RED}❌ Tor service is not running${NC}"
        echo -e "${YELLOW}Start it with: sudo systemctl start tor${NC}"
    fi
}

# Show help
show_help() {
    print_banner
    echo -e "${CYAN}JokerK - Advanced Onion Search Tool${NC}"
    echo ""
    echo -e "${GREEN}Usage:${NC}"
    echo "  $0 [command]"
    echo ""
    echo -e "${GREEN}Commands:${NC}"
    echo "  install     Install JokerK (default)"
    echo "  uninstall   Uninstall JokerK"
    echo "  check-tor   Check Tor service status"
    echo "  help        Show this help message"
    echo ""
    echo -e "${GREEN}Examples:${NC}"
    echo "  $0 install"
    echo "  $0 check-tor"
    echo "  $0 uninstall"
    echo ""
}

# Main script logic
case "${1:-install}" in
    "install")
        install
        ;;
    "uninstall")
        uninstall
        ;;
    "check-tor")
        check_tor
        ;;
    "help"|"-h"|"--help")
        show_help
        ;;
    *)
        echo -e "${RED}❌ Unknown command: $1${NC}"
        show_help
        exit 1
        ;;
esac 