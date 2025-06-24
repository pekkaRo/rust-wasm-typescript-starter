#!/bin/bash

# Debug script to check what's being deployed to GitHub Pages

echo "🔍 Debugging GitHub Pages deployment..."

# Check if dist exists
if [ ! -d "dist" ]; then
    echo "❌ No dist directory found. Run build first."
    exit 1
fi

echo "📁 Contents of dist directory:"
find dist -type f -name "*.html" -o -name "*.js" -o -name "*.css" -o -name "*.wasm" | head -20

echo ""
echo "🔍 Checking index.html for TypeScript references:"
if [ -f "dist/index.html" ]; then
    echo "--- dist/index.html content ---"
    cat dist/index.html | grep -E "(\.ts|script|link)" || echo "No script/link tags found"
    echo "--- end ---"
else
    echo "❌ No index.html found in dist/"
fi

echo ""
echo "📦 Assets directory contents:"
if [ -d "dist/assets" ]; then
    ls -la dist/assets/
else
    echo "❌ No assets directory found"
fi

echo ""
echo "🌐 What GitHub Pages should serve:"
echo "- URL: https://pekkaro.github.io/rust-wasm-typescript-starter/"
echo "- Should load: dist/index.html"
echo "- Should NOT load any .ts files"
