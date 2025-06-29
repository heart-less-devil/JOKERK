#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

with open("requirements.txt", "r", encoding="utf-8") as fh:
    requirements = [line.strip() for line in fh if line.strip() and not line.startswith("#")]

setup(
    name="jokerk",
    version="1.0.0",
    author="JokerK Team",
    author_email="jokerk@protonmail.com",
    description="Advanced Onion Search Tool with Tor IP Rotation",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/jokerk/JokerK",
    packages=find_packages(),
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Information Technology",
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Topic :: Internet :: WWW/HTTP :: Indexing/Search",
        "Topic :: Security",
    ],
    python_requires=">=3.7",
    install_requires=requirements,
    entry_points={
        "console_scripts": [
            "jokerk=jokerk.cli:main",
        ],
    },
    keywords="onion search tor darkweb osint security",
    project_urls={
        "Bug Reports": "https://github.com/jokerk/JokerK/issues",
        "Source": "https://github.com/jokerk/JokerK",
        "Documentation": "https://github.com/jokerk/JokerK/blob/master/README.md",
    },
) 