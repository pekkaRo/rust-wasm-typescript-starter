#!/bin/bash

# Local preview script for GitHub Pages build

set -e

echo "🌐 Testing GitHub Pages build locally..."

# Ensure dist exists
if [ ! -d "dist" ]; then
  echo "❌ No dist folder found. Run 'npm run build-pages' first."
  exit 1
fi

# Create a temp root with a subfolder matching project base
ROOT_DIR=$(mktemp -d)
PREFIX="rust-wasm-typescript-starter"
echo "📂 Setting up preview directory: $ROOT_DIR/$PREFIX"
mkdir -p "$ROOT_DIR/$PREFIX"
cp -r dist/* "$ROOT_DIR/$PREFIX/"

echo "🚀 Starting local server at http://localhost:8080/$PREFIX/"
cd "$ROOT_DIR"

# Start HTTP server
if command -v python3 &> /dev/null; then
  python3 -m http.server 8080
elif command -v python &> /dev/null; then
  python -m http.server 8080
elif command -v npx &> /dev/null; then
  npx serve "$ROOT_DIR" -l 8080
else
  echo "❌ No suitable HTTP server found."
  exit 1
fi
