#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
JokerK Demo Script
Demonstrates the basic functionality of JokerK
"""

import sys
import os

# Add the current directory to Python path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from jokerk.core import JokerK
import colorama
from colorama import Fore, Style

# Initialize colorama
colorama.init()

def demo_basic_search():
    """Demo basic search without Tor rotation"""
    print(f"{Fore.CYAN}🔍 Demo 1: Basic Search (without Tor rotation){Style.RESET_ALL}")
    print("-" * 50)
    
    try:
        with JokerK(tor_rotation=False) as jokerk:
            results = jokerk.search(
                query="bitcoin",
                engines=["ahmia", "tor66"],
                limit=3
            )
            
            if results:
                print(f"{Fore.GREEN}✅ Found {len(results)} results{Style.RESET_ALL}")
                jokerk.print_results()
            else:
                print(f"{Fore.YELLOW}⚠️ No results found{Style.RESET_ALL}")
                
    except Exception as e:
        print(f"{Fore.RED}❌ Error: {e}{Style.RESET_ALL}")

def demo_tor_rotation():
    """Demo search with Tor IP rotation"""
    print(f"\n{Fore.CYAN}🔍 Demo 2: Search with Tor IP Rotation{Style.RESET_ALL}")
    print("-" * 50)
    
    try:
        with JokerK(tor_rotation=True, rotation_interval=10) as jokerk:
            print(f"{Fore.YELLOW}🔄 IP rotation enabled (every 10 seconds){Style.RESET_ALL}")
            
            results = jokerk.search(
                query="marketplace",
                engines=["ahmia"],
                limit=2
            )
            
            if results:
                print(f"{Fore.GREEN}✅ Found {len(results)} results{Style.RESET_ALL}")
                jokerk.print_results()
                
                # Show statistics
                stats = jokerk.get_stats()
                print(f"\n{Fore.CYAN}📊 Statistics:{Style.RESET_ALL}")
                for key, value in stats.items():
                    print(f"  {key}: {value}")
            else:
                print(f"{Fore.YELLOW}⚠️ No results found{Style.RESET_ALL}")
                
    except Exception as e:
        print(f"{Fore.RED}❌ Error: {e}{Style.RESET_ALL}")
        print(f"{Fore.YELLOW}Make sure Tor is running: sudo systemctl start tor{Style.RESET_ALL}")

def demo_custom_output():
    """Demo custom output fields"""
    print(f"\n{Fore.CYAN}🔍 Demo 3: Custom Output Fields{Style.RESET_ALL}")
    print("-" * 50)
    
    try:
        with JokerK(tor_rotation=False) as jokerk:
            results = jokerk.search(
                query="forum",
                engines=["tor66"],
                limit=2,
                output_file="demo_results.csv"
            )
            
            if results:
                print(f"{Fore.GREEN}✅ Found {len(results)} results{Style.RESET_ALL}")
                
                # Print with custom fields
                print(f"\n{Fore.CYAN}Custom output (engine, domain, url):{Style.RESET_ALL}")
                jokerk.print_results(fields=['engine', 'domain', 'url'])
                
                print(f"\n{Fore.GREEN}💾 Results saved to: demo_results.csv{Style.RESET_ALL}")
            else:
                print(f"{Fore.YELLOW}⚠️ No results found{Style.RESET_ALL}")
                
    except Exception as e:
        print(f"{Fore.RED}❌ Error: {e}{Style.RESET_ALL}")

def main():
    """Main demo function"""
    print(f"{Fore.RED}")
    print(" ██╗ ██████╗ ██╗  ██╗███████╗██████╗ ██╗  ██╗")
    print(" ██║██╔═══██╗██║ ██╔╝██╔════╝██╔══██╗██║ ██╔╝")
    print(" ██║██║   ██║█████╔╝ █████╗  ██████╔╝█████╔╝ ")
    print(" ██║██║   ██║██╔═██╗ ██╔══╝  ██╔══██╗██╔═██╗ ")
    print(" ██║╚██████╔╝██║  ██╗███████╗██║  ██║██║  ██╗")
    print(" ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝")
    print(f"{Style.RESET_ALL}")
    print(f"{Fore.CYAN}JokerK Demo - Advanced Onion Search Tool{Style.RESET_ALL}")
    print(f"{Fore.YELLOW}Educational Purposes Only{Style.RESET_ALL}")
    print()
    
    print(f"{Fore.BLUE}This demo will show you the basic functionality of JokerK.{Style.RESET_ALL}")
    print(f"{Fore.YELLOW}Note: Some demos may fail if Tor is not properly configured.{Style.RESET_ALL}")
    print()
    
    # Run demos
    demo_basic_search()
    demo_tor_rotation()
    demo_custom_output()
    
    print(f"\n{Fore.GREEN}🎉 Demo completed!{Style.RESET_ALL}")
    print(f"{Fore.CYAN}For more information, run: jokerk --help-detailed{Style.RESET_ALL}")

if __name__ == "__main__":
    main() 