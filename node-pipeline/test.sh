#!/usr/bin/env bash

echo "user: $(whoami)"
echo "node: $(node --version)"
echo "npm: $(npm --version)"
echo "yarn: $(yarn --version)"
echo "firebase: $(firebase --version)"
echo "Cypress"
cypress version
