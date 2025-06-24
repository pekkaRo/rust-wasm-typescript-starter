# 🛠️ Development Setup Guide

## Quick Start

### First Time Setup
```bash
# 1. Install dependencies
npm install

# 2. Build WebAssembly module (REQUIRED before first run)
npm run build-wasm

# 3. Start development server
npm run dev:fast
```

### Daily Development
```bash
# Option 1: Full rebuild (slower but safe)
npm run dev

# Option 2: Fast start (if WASM hasn't changed)
npm run dev:fast
```

## 🔄 When to Rebuild WASM

**Always rebuild WASM when:**
- First time setting up the project
- After changing Rust code in `rust-wasm/src/lib.rs`
- After pulling changes that modify Rust code
- Getting import errors about missing `pkg/rust_wasm.js`

**Commands:**
```bash
# Just rebuild WASM
npm run build-wasm

# Rebuild WASM and start dev server
npm run dev
```

## 🚨 Common Issues

### Error: "Failed to resolve import ../pkg/rust_wasm.js"
**Cause**: WebAssembly module not built yet
**Solution**: Run `npm run build-wasm` first

### Error: "No such file or directory: pkg/"
**Cause**: First time setup, WASM not built
**Solution**: Run `npm run build-wasm`

### Dev server won't start
**Solution**: 
1. Stop any running dev servers (Ctrl+C)
2. Run `npm run build-wasm`
3. Run `npm run dev:fast`

## 📁 Generated Files (Don't Edit)

After building WASM, you'll see:
```
pkg/
├── rust_wasm.js          # JavaScript bindings
├── rust_wasm.d.ts        # TypeScript definitions
├── rust_wasm_bg.wasm     # WebAssembly binary
└── ...
```

These files are auto-generated and will be recreated when you build.

## 🔧 Available Scripts

- `npm run dev` - Build WASM + start dev server
- `npm run dev:fast` - Start dev server (WASM must exist)
- `npm run build-wasm` - Build only the WebAssembly module
- `npm run build` - Build for production
- `npm run build-pages` - Build for GitHub Pages
- `npm run preview` - Preview production build

## 🎯 Development Workflow

1. **Edit Rust code** in `rust-wasm/src/lib.rs`
2. **Rebuild WASM**: `npm run build-wasm`
3. **Refresh browser** to see changes
4. **Edit TypeScript** in `src/main.ts` (hot reload works)
5. **Edit HTML/CSS** (hot reload works)

## 🚀 Ready to Code!

Your development environment is now set up correctly. The dev server is running at:
**http://localhost:5177/**

Happy coding with Rust + WebAssembly! 🦀✨
