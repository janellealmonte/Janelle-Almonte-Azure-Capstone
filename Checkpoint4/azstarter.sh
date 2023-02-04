#!/bin/bash

# The script to give me basic info about my account
echo "------------------------------------"
echo "get azure running version in this system"
echo "===================================="
az --version

echo "------------------------------------"
echo "gets list of accounts"
echo "===================================="
az account list --output table

echo "------------------------------------"
echo "gets list of resource groups"
echo "===================================="
az group list --output table"
