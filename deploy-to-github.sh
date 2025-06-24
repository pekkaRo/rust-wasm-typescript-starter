#!/bin/bash

# Quick GitHub deployment script for Rust + WebAssembly + TypeScript project

echo "🚀 Preparing to deploy to GitHub..."

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Git repository not initialized. Run 'git init' first."
    exit 1
fi

# Check if we have uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo "📝 You have uncommitted changes. Committing them now..."
    git add .
    read -p "Enter commit message: " commit_message
    git commit -m "$commit_message"
fi

# Check if remote origin exists
if ! git remote get-url origin &> /dev/null; then
    echo "🔗 No remote origin found."
    read -p "Enter your GitHub repository URL (e.g., https://github.com/username/repo.git): " repo_url
    git remote add origin "$repo_url"
    echo "✅ Remote origin added: $repo_url"
fi

# Push to GitHub
echo "📤 Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ Successfully deployed to GitHub!"
    echo "🌐 Your repository is now available at: $(git remote get-url origin | sed 's/.git$//')"
    echo "📖 Don't forget to enable GitHub Pages in your repository settings for live demo!"
else
    echo "❌ Failed to push to GitHub. Please check your credentials and try again."
    exit 1
fi
