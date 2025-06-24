# 🔧 GitHub Pages Troubleshooting Guide

## Common Issues and Solutions

### Issue: 404 Errors for TypeScript Files
**Error**: `GET https://pekkaro.github.io/src/main.ts net::ERR_ABORTED 404`

**Cause**: Browser trying to load raw TypeScript files instead of compiled JavaScript.

**Solution**: ✅ **FIXED**
- Updated script tag to use relative path
- Improved build process to ensure proper TypeScript compilation
- Separated dev and production configurations

### Issue: Assets Not Loading (vite.svg, CSS, JS)
**Error**: `Failed to load resource: 404 (Not Found)`

**Cause**: Incorrect base path configuration for GitHub Pages subdirectory.

**Solution**: ✅ **FIXED**
- Added `base: '/rust-wasm-typescript-starter/'` to vite.config.ts
- Fixed all asset paths to be relative
- Added `.nojekyll` file to prevent Jekyll processing

## 🚀 How to Deploy

### Method 1: Automatic (Recommended)
1. Push changes to GitHub: `git push`
2. GitHub Actions automatically builds and deploys
3. Wait 2-3 minutes for deployment
4. Visit: https://pekkaro.github.io/rust-wasm-typescript-starter/

### Method 2: Manual Testing
```bash
# Build for GitHub Pages
npm run build-pages

# Test locally
./preview-pages.sh

# Then push to GitHub
git push
```

## 🔍 Debugging Steps

### 1. Check GitHub Actions
- Go to your repo → Actions tab
- Verify the workflow completed successfully
- Check for any build errors

### 2. Verify Build Output
```bash
npm run build-pages
ls -la dist/
ls -la dist/assets/
```

Should see:
- `dist/index.html` (compiled, no TypeScript references)
- `dist/assets/` folder with JS, CSS, and WASM files
- `dist/.nojekyll` file

### 3. Test Locally
```bash
./preview-pages.sh
# Visit: http://localhost:8080/rust-wasm-typescript-starter/
```

### 4. Check Browser Network Tab
- Open DevTools (F12) → Network tab
- Reload the page
- All resources should load with 200 status
- No 404 errors for TypeScript files

## 📋 File Structure After Build

```
dist/
├── .nojekyll                           # Prevents Jekyll processing
├── index.html                          # Main HTML (no TypeScript refs)
├── vite.svg                            # Favicon
└── assets/
    ├── index-[hash].js                 # Compiled TypeScript + dependencies
    ├── index-[hash].css                # Compiled CSS
    └── rust_wasm_bg-[hash].wasm        # WebAssembly binary
```

## 🌐 URLs and Paths

### Development (Local)
- URL: `http://localhost:5175/`
- Base path: `/` (root)
- Assets: `/assets/`

### GitHub Pages (Production)
- URL: `https://pekkaro.github.io/rust-wasm-typescript-starter/`
- Base path: `/rust-wasm-typescript-starter/`
- Assets: `/rust-wasm-typescript-starter/assets/`

## ✅ Current Status

**All major issues have been resolved:**
- ✅ TypeScript compilation working
- ✅ Asset paths corrected
- ✅ WASM loading properly
- ✅ Automated deployment configured
- ✅ Local development environment separated

Your site should now work perfectly at:
**https://pekkaro.github.io/rust-wasm-typescript-starter/**

## 🆘 If Issues Persist

1. **Clear browser cache** (Ctrl+Shift+R or Cmd+Shift+R)
2. **Wait for GitHub Pages deployment** (can take 5-10 minutes)
3. **Check GitHub Actions logs** for build errors
4. **Test locally first** with `./preview-pages.sh`

The deployment process is now much more robust and should handle all the previous issues! 🎉
