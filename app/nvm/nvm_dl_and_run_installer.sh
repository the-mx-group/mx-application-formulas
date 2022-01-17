#!/bin/bash

NVMLATEST=$(curl --silent "https://api.github.com/repos/nvm-sh/nvm/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
curl --silent "https://raw.githubusercontent.com/nvm-sh/nvm/${NVMLATEST}/install.sh" | bash
