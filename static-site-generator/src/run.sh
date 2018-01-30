#!/usr/bin/env bash
echo "Installing dependencies..."
npm install

echo "Running gulp"
./node_modules/.bin/gulp
