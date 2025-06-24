#!/bin/bash

# Local preview script for GitHub Pages build

echo "🌐 Testing GitHub Pages build locally..."

# Check if dist folder exists
if [ ! -d "dist" ]; then
    echo "❌ No dist folder found. Run 'npm run build-pages' first."
    exit 1
fi

# Start a simple HTTP server
echo "🚀 Starting local server..."
echo "📍 Testing URL: http://localhost:8080/rust-wasm-typescript-starter/"
echo "🛑 Press Ctrl+C to stop"
echo ""

# Use Python's built-in server if available, otherwise suggest alternatives
if command -v python3 &> /dev/null; then
    cd dist && python3 -m http.server 8080
elif command -v python &> /dev/null; then
    cd dist && python -m http.server 8080
elif command -v npx &> /dev/null; then
    npx serve dist -l 8080
else
    echo "❌ No suitable HTTP server found."
    echo "Please install Python or run: npm install -g serve"
    echo "Then run: serve dist -l 8080"
    exit 1
fi
