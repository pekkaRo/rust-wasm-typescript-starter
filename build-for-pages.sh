#!/bin/bash

# Build script for GitHub Pages deployment

echo "🔨 Building for GitHub Pages..."

# Step 1: Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf dist/
rm -rf pkg/

# Step 2: Build WebAssembly
echo "📦 Building Rust WebAssembly module..."
cd rust-wasm
wasm-pack build --target web --out-dir ../pkg --release
cd ..

if [ $? -ne 0 ]; then
    echo "❌ WebAssembly build failed!"
    exit 1
fi

echo "✅ WebAssembly build successful!"
echo "📋 Generated files:"
ls -la pkg/

# Step 3: Build the frontend
echo "🏗️  Building frontend with TypeScript compilation..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Frontend build failed!"
    exit 1
fi

# Step 4: Create .nojekyll file for GitHub Pages
echo "📄 Creating .nojekyll file..."
touch dist/.nojekyll

# Step 5: Verify build contents
echo "📋 Build verification:"
echo "Dist folder contents:"
ls -la dist/
echo ""
echo "Assets folder contents:"
ls -la dist/assets/

# Step 6: Check for essential files
if [ ! -f "dist/index.html" ]; then
    echo "❌ No index.html found in dist folder!"
    exit 1
fi

if [ ! -d "dist/assets" ] || [ -z "$(ls -A dist/assets)" ]; then
    echo "❌ No assets found in dist/assets folder!"
    exit 1
fi

echo "✅ Build complete! Files are ready in ./dist/"
echo ""
echo "📋 Next steps:"
echo "1. Push your changes to GitHub: git push"
echo "2. GitHub Actions will automatically deploy to Pages"
echo "3. Or test locally first: ./preview-pages.sh"
echo ""
echo "🌐 Your site will be available at:"
echo "   https://pekkaro.github.io/rust-wasm-typescript-starter/"
