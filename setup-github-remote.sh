#!/bin/bash

# GitHub Remote Setup Script
# This script helps you create and connect to a GitHub remote repository

echo "🚀 GitHub Remote Setup for rust-wasm-typescript-starter"
echo "=============================================="

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Not in a git repository. Please run 'git init' first."
    exit 1
fi

# Check if remote origin already exists
if git remote get-url origin &> /dev/null; then
    echo "ℹ️  Remote 'origin' already exists:"
    git remote get-url origin
    echo ""
    read -p "Do you want to remove and recreate it? (y/N): " recreate
    if [[ $recreate =~ ^[Yy]$ ]]; then
        git remote remove origin
        echo "✅ Removed existing remote"
    else
        echo "Keeping existing remote. Exiting."
        exit 0
    fi
fi

# Display the repository information from package.json
echo "📋 Repository Information:"
echo "Name: rust-wasm-typescript-starter"
echo "Owner: pekkaro" 
echo "URL: https://github.com/pekkaro/rust-wasm-typescript-starter.git"
echo ""

# Option 1: Try GitHub CLI
if command -v gh &> /dev/null; then
    echo "✅ GitHub CLI found! Creating repository..."
    
    # Check if user is logged in
    if gh auth status &> /dev/null; then
        echo "Creating repository on GitHub..."
        gh repo create rust-wasm-typescript-starter \
            --public \
            --description "A progressive learning project demonstrating Rust compiled to WebAssembly with TypeScript and Vite" \
            --add-readme=false
        
        if [ $? -eq 0 ]; then
            echo "✅ Repository created successfully!"
            git remote add origin https://github.com/pekkaro/rust-wasm-typescript-starter.git
            echo "✅ Remote added successfully!"
            
            # Commit any pending changes
            if ! git diff-index --quiet HEAD --; then
                echo "📝 Committing pending changes..."
                git add .
                git commit -m "Update project metadata and prepare for GitHub"
            fi
            
            # Push to GitHub
            echo "📤 Pushing to GitHub..."
            git push -u origin main
            
            if [ $? -eq 0 ]; then
                echo ""
                echo "🎉 SUCCESS! Your project is now on GitHub!"
                echo "🌐 Repository: https://github.com/pekkaro/rust-wasm-typescript-starter"
                echo "📖 Enable GitHub Pages in Settings → Pages for live demo"
                exit 0
            else
                echo "❌ Failed to push. You may need to force push or check permissions."
                echo "Try: git push -u origin main --force"
            fi
        else
            echo "❌ Failed to create repository with GitHub CLI"
        fi
    else
        echo "❌ Not logged in to GitHub CLI. Run: gh auth login"
    fi
fi

# Option 2: Manual setup instructions
echo ""
echo "🔧 Manual Setup Instructions:"
echo "=============================="
echo ""
echo "1. Go to GitHub.com and create a new repository:"
echo "   - Repository name: rust-wasm-typescript-starter"
echo "   - Description: A progressive learning project demonstrating Rust compiled to WebAssembly with TypeScript and Vite"
echo "   - Make it Public"
echo "   - DON'T initialize with README (we already have one)"
echo ""
echo "2. Then run these commands:"
echo "   git remote add origin https://github.com/pekkaro/rust-wasm-typescript-starter.git"
echo "   git push -u origin main"
echo ""
echo "3. If you get errors, you might need to force push:"
echo "   git push -u origin main --force"
echo ""

# Option 3: Add remote manually and attempt push
read -p "Do you want me to add the remote and try pushing now? (y/N): " add_remote

if [[ $add_remote =~ ^[Yy]$ ]]; then
    echo "📡 Adding remote origin..."
    git remote add origin https://github.com/pekkaro/rust-wasm-typescript-starter.git
    
    if [ $? -eq 0 ]; then
        echo "✅ Remote added successfully!"
        
        # Commit any pending changes
        if ! git diff-index --quiet HEAD --; then
            echo "📝 Committing pending changes..."
            git add .
            git commit -m "Update project metadata and prepare for GitHub"
        fi
        
        echo "📤 Attempting to push..."
        git push -u origin main
        
        if [ $? -eq 0 ]; then
            echo ""
            echo "🎉 SUCCESS! Your project is now on GitHub!"
            echo "🌐 Repository: https://github.com/pekkaro/rust-wasm-typescript-starter"
        else
            echo ""
            echo "⚠️  Push failed. This usually means:"
            echo "   1. The repository doesn't exist on GitHub yet"
            echo "   2. You don't have push permissions"
            echo "   3. There are conflicts"
            echo ""
            echo "Please create the repository on GitHub first, then try:"
            echo "   git push -u origin main --force"
        fi
    else
        echo "❌ Failed to add remote"
    fi
fi

echo ""
echo "📚 Next Steps:"
echo "- Enable GitHub Pages for live demo"
echo "- Add topics/tags to your repository"
echo "- Share your project with the community!"
