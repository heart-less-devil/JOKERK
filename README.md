# JokerK 🃏

**Advanced Onion Search Tool with Tor IP Rotation**

JokerK is an enhanced version of OnionSearch with automatic Tor IP rotation every 5 seconds for maximum anonymity and security.

## 🎯 Features

- **Onion Search Engine Scraping**: Search across multiple .onion search engines
- **Automatic IP Rotation**: Changes IP every 5 seconds using Tor routing
- **Proxy Chain Support**: Advanced proxy configuration
- **Multi-processing**: Parallel search across engines
- **Real-time Output**: Continuous writing to output files
- **Kali Linux Optimized**: Designed specifically for Kali Linux

## 🛠️ Prerequisites

- Python 3.7+
- Tor Browser or Tor service
- Kali Linux (recommended)

## 📦 Installation

### Method 1: Direct Installation (Recommended for Kali)

```bash
# Clone the repository
git clone https://github.com/jokerk/JokerK.git
cd JokerK

# Install dependencies
pip3 install -r requirements.txt

# Install JokerK
python3 setup.py install

# Make the bash script executable
chmod +x jokerk.sh
```

### Method 2: Using the Bash Script

```bash
# Download and run the installation script
curl -sSL https://raw.githubusercontent.com/jokerk/JokerK/master/install.sh | bash
```

## 🚀 Quick Start

### Basic Usage

```bash
# Search for "computer" across all engines
jokerk "computer"

# Search with IP rotation every 5 seconds
jokerk "computer" --tor-rotation

# Search specific engines only
jokerk "computer" --engines ahmia tor66 phobos --tor-rotation
```

### Advanced Usage

```bash
# Search with custom Tor rotation interval (default: 5 seconds)
jokerk "computer" --tor-rotation --rotation-interval 10

# Use custom Tor proxy
jokerk "computer" --proxy 127.0.0.1:9050 --tor-rotation

# Limit results and enable continuous writing
jokerk "computer" --limit 5 --continuous-write --tor-rotation

# Exclude specific engines
jokerk "computer" --exclude ahmia candle --tor-rotation
```

## 📚 Supported Search Engines

- ahmia
- darksearchio
- onionland
- notevil
- darksearchenginer
- phobos
- onionsearchserver
- torgle
- onionsearchengine
- tordex
- tor66
- tormax
- haystack
- multivac
- evosearch
- deeplink

## 🔧 Configuration

### Tor Configuration

JokerK automatically detects and uses your Tor service. Make sure Tor is running:

```bash
# Start Tor service
sudo systemctl start tor

# Check Tor status
sudo systemctl status tor
```

### Proxy Configuration

You can configure custom proxy settings:

```bash
# Use SOCKS5 proxy
jokerk "search" --proxy socks5://127.0.0.1:9050

# Use HTTP proxy
jokerk "search" --proxy http://proxy:8080
```

## 📊 Output Formats

### Default CSV Output

```csv
"engine","name","url","timestamp","ip_address"
"ahmia","Example Site","http://example.onion","2024-01-01 12:00:00","1.2.3.4"
```

### Custom Fields

```bash
# Output only engine and domain
jokerk "computer" --fields engine domain --tor-rotation

# Custom delimiter
jokerk "computer" --field-delimiter ";" --tor-rotation
```

## 🛡️ Security Features

- **Automatic IP Rotation**: Changes IP every 5 seconds
- **Tor Integration**: Seamless Tor network usage
- **User-Agent Randomization**: Prevents fingerprinting
- **Request Delays**: Built-in delays to avoid detection
- **SSL Verification**: Secure connections

## 🔍 Examples

### Basic Search
```bash
jokerk "bitcoin mixer"
```

### Advanced Search with IP Rotation
```bash
jokerk "marketplace" --engines ahmia tor66 --limit 10 --tor-rotation --continuous-write
```

### Search with Custom Settings
```bash
jokerk "forum" --exclude notevil --rotation-interval 3 --output results.csv --tor-rotation
```

## 📝 License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## ⚠️ Disclaimer

This tool is for educational and research purposes only. Users are responsible for complying with all applicable laws and regulations. The authors are not responsible for any misuse of this tool.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

For support and questions:
- Create an issue on GitHub
- Email: jokerk@protonmail.com

## 🙏 Acknowledgments

- Based on [OnionSearch](https://github.com/megadose/OnionSearch) by megadose
- Tor Project for providing the anonymity network
- The open-source community for various libraries and tools

---

**Remember**: Always use this tool responsibly and in accordance with local laws and regulations. 