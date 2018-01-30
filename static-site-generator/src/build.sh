#!/usr/bin/env bash
echo "Installing dependencies..."
npm install

echo "Building gulp"
./node_modules/.bin/gulp build-project
