#!/bin/bash

# Build script for GitHub Pages deployment

echo "🔨 Building for GitHub Pages..."

# Step 1: Build WebAssembly
echo "📦 Building Rust WebAssembly module..."
cd rust-wasm
wasm-pack build --target web --out-dir ../pkg
cd ..

if [ $? -ne 0 ]; then
    echo "❌ WebAssembly build failed!"
    exit 1
fi

# Step 2: Build the frontend
echo "🏗️  Building frontend..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Frontend build failed!"
    exit 1
fi

# Step 3: Create .nojekyll file for GitHub Pages
echo "📄 Creating .nojekyll file..."
touch dist/.nojekyll

# Step 4: Create a simple index redirect if needed
if [ ! -f "dist/index.html" ]; then
    echo "⚠️  No index.html found in dist folder!"
    exit 1
fi

echo "✅ Build complete! Files are ready in ./dist/"
echo ""
echo "📋 Next steps:"
echo "1. Push your changes to GitHub"
echo "2. Enable GitHub Pages in repository settings"
echo "3. Set source to 'GitHub Actions'"
echo ""
echo "🌐 Your site will be available at:"
echo "   https://pekkaro.github.io/rust-wasm-typescript-starter/"
