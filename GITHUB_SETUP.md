# 🚀 GitHub Setup Guide

Follow these steps to put your Rust + WebAssembly + TypeScript project on GitHub:

## 📋 Prerequisites

Make sure you have:
- [Git](https://git-scm.com/) installed
- A [GitHub](https://github.com) account
- [GitHub CLI](https://cli.github.com/) (optional, but recommended)

## 🔧 Steps to Upload to GitHub

### Option A: Using GitHub CLI (Recommended)

1. **Install GitHub CLI** (if not already installed):
   ```bash
   # macOS
   brew install gh
   
   # Or download from: https://cli.github.com/
   ```

2. **Login to GitHub**:
   ```bash
   gh auth login
   ```

3. **Create and push repository**:
   ```bash
   cd /Users/pekkaroytta/wasm-starter
   gh repo create rust-wasm-typescript-starter --public --description "A progressive learning project demonstrating Rust compiled to WebAssembly with TypeScript and Vite"
   git remote add origin https://github.com/YOUR_USERNAME/rust-wasm-typescript-starter.git
   git push -u origin main
   ```

### Option B: Using GitHub Web Interface

1. **Go to GitHub** and create a new repository:
   - Repository name: `rust-wasm-typescript-starter`
   - Description: "A progressive learning project demonstrating Rust compiled to WebAssembly with TypeScript and Vite"
   - Make it **Public**
   - Don't initialize with README (we already have one)

2. **Connect your local repository**:
   ```bash
   cd /Users/pekkaroytta/wasm-starter
   git remote add origin https://github.com/YOUR_USERNAME/rust-wasm-typescript-starter.git
   git push -u origin main
   ```

## 🎯 After Uploading

### 1. Enable GitHub Pages (Optional)
1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Source: **GitHub Actions**
4. Your project will be automatically deployed when you push to main!

### 2. Update Repository URLs
Replace `YOUR_USERNAME` in these files with your actual GitHub username:
- `package.json` - repository, bugs, and homepage URLs
- `rust-wasm/Cargo.toml` - repository URL
- `CONTRIBUTING.md` - clone URL
- `README.md` - if you add any repository-specific links

### 3. Add Repository Secrets (for advanced features)
If you want to add deployment or other secrets:
1. Go to **Settings** → **Secrets and variables** → **Actions**
2. Add any required secrets

## 📝 Customize Before Pushing

Before you push, you might want to update:

1. **Author information** in `package.json` and `Cargo.toml`:
   ```json
   "author": "Your Real Name <your.email@example.com>"
   ```

2. **Repository name** if you want something different:
   - Update in `package.json`
   - Update in `Cargo.toml` 
   - Use the same name when creating the GitHub repository

3. **License** (if you want a different license):
   - Update `LICENSE` file
   - Update license field in `package.json` and `Cargo.toml`

## 🔥 Ready Commands

Here are the exact commands to run (replace YOUR_USERNAME):

```bash
# Navigate to project
cd /Users/pekkaroytta/wasm-starter

# Option 1: Using GitHub CLI
gh repo create rust-wasm-typescript-starter --public --description "A progressive learning project demonstrating Rust compiled to WebAssembly with TypeScript and Vite"
git remote add origin https://github.com/YOUR_USERNAME/rust-wasm-typescript-starter.git
git push -u origin main

# Option 2: After creating repo on GitHub.com
git remote add origin https://github.com/YOUR_USERNAME/rust-wasm-typescript-starter.git
git push -u origin main
```

## ✅ Verification

After pushing, verify everything worked:
1. Visit your repository on GitHub
2. Check that all files are there
3. Look at the Actions tab to see if CI is running
4. If you enabled GitHub Pages, check the deployment

## 🎉 You're Done!

Your Rust + WebAssembly + TypeScript project is now on GitHub with:
- ✅ Complete source code
- ✅ Documentation and setup instructions  
- ✅ Automated CI/CD pipeline
- ✅ GitHub Pages deployment (if enabled)
- ✅ Contribution guidelines

Share your repository URL with others to showcase your Rust + WebAssembly skills! 🦀✨
