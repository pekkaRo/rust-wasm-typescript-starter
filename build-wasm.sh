#!/bin/bash

# Build script for Rust + WebAssembly project

echo "🦀 Building Rust WebAssembly module..."

# Navigate to rust-wasm directory and build
cd rust-wasm
wasm-pack build --target web --out-dir ../pkg

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ WASM build successful!"
    echo "📦 Generated files in /pkg directory"
    cd ..
    echo "🚀 Run 'npm run dev' to start the development server"
else
    echo "❌ WASM build failed!"
    exit 1
fi
