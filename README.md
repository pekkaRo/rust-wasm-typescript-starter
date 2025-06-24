# 🦀 Rust + WebAssembly + TypeScript Starter

A progressive learning project that demonstrates how to integrate Rust compiled to WebAssembly with TypeScript and Vite for modern frontend development.

## 🚀 Features

- **Rust Functions**: Math operations, string processing, and performance-heavy computations
- **TypeScript Integration**: Type-safe integration with auto-generated WASM bindings
- **Modern Tooling**: Vite for fast development and building
- **Interactive Demo**: Real-time examples showcasing WASM capabilities
- **DOM Manipulation**: Direct DOM updates from Rust code
- **Performance Testing**: Compare Rust vs JavaScript performance

## 📁 Project Structure

```
wasm-starter/
├── rust-wasm/          # Rust source code
│   ├── src/lib.rs      # Rust functions exported to WASM
│   └── Cargo.toml      # Rust dependencies and config
├── pkg/                # Generated WASM output (auto-generated)
├── src/                # TypeScript frontend code
│   ├── main.ts         # Main application logic
│   └── style.css       # Styling
├── index.html          # Demo interface
├── vite.config.ts      # Vite configuration
└── package.json        # Node.js dependencies
```

## 🛠️ Setup and Development

### Prerequisites
- [Rust](https://rustup.rs/) (latest stable)
- [Node.js](https://nodejs.org/) (v18 or later)
- [wasm-pack](https://rustwasm.github.io/wasm-pack/installer/)

### Install wasm-pack (if not already installed)
```bash
npm install -g wasm-pack
```

### Build and Run
1. **Clone and setup:**
   ```bash
   npm install
   ```

2. **Build the Rust/WASM module (REQUIRED first):**
   ```bash
   npm run build-wasm
   ```

3. **Start development server:**
   ```bash
   npm run dev:fast
   ```

4. **Open your browser** and navigate to the displayed localhost URL

### Development Workflow
```bash
# After changing Rust code
npm run build-wasm

# For daily development (auto-builds WASM)
npm run dev

# Quick start (if WASM already built)
npm run dev:fast
```

⚠️ **Important**: Always run `npm run build-wasm` before your first `npm run dev` or after changing Rust code!

### Production Build
```bash
npm run build
```

### GitHub Pages Deployment
```bash
# Build for GitHub Pages
npm run build-pages

# Test locally (optional)
./preview-pages.sh

# Then push to GitHub and enable Pages in repository settings
```

## 🌐 Live Demo

After deploying to GitHub Pages, your project will be available at:
**https://pekkaro.github.io/rust-wasm-typescript-starter/**

### Setting up GitHub Pages
1. Push your code to GitHub
2. Go to repository **Settings** → **Pages**
3. Source: **GitHub Actions**
4. The site will be automatically deployed on every push to `main`

## 🎯 Learning Path

This project is designed for progressive learning:

### 1. **Basic Functions (Current)**
- Simple math operations (`add`, `multiply`)
- String processing (`reverse_string`, `count_words`)
- Understanding WASM ↔ JS data transfer

### 2. **Performance Comparisons**
- Fibonacci calculations
- Prime number counting
- Benchmarking Rust vs JavaScript

### 3. **DOM Manipulation**
- Direct DOM updates from Rust
- Working with `web-sys` crate

### 4. **Future Enhancements** (Next Steps)
- Memory management optimization
- API communication from Rust
- State management between JS and WASM
- Complex data structures
- Error handling patterns

## 🔧 Development Commands

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `cd rust-wasm && wasm-pack build --target web --out-dir ../pkg` - Rebuild WASM

## 🧠 Key Concepts Demonstrated

### Rust Side (`rust-wasm/src/lib.rs`)
- `#[wasm_bindgen]` annotations for JS exports
- `console_log!` macro for debugging
- `web-sys` for DOM manipulation
- Performance-optimized algorithms

### TypeScript Side (`src/main.ts`)
- Async WASM module initialization
- Type-safe function calls
- Error handling
- Performance measurement

### Build Integration
- Vite configuration for WASM
- Auto-generated TypeScript definitions
- Hot module replacement during development

## 🎮 Interactive Demo Features

1. **Math Operations**: Test basic arithmetic with Rust functions
2. **String Processing**: Reverse strings and count words
3. **Performance Tests**: Compare Rust vs JS speed on CPU-intensive tasks
4. **DOM Manipulation**: Update HTML elements directly from Rust
5. **Console Logging**: See Rust debug messages in browser console

## 📚 Learning Resources

- [Rust and WebAssembly Book](https://rustwasm.github.io/docs/book/)
- [wasm-bindgen Guide](https://rustwasm.github.io/wasm-bindgen/)
- [web-sys Documentation](https://rustwasm.github.io/wasm-bindgen/web-sys/index.html)
- [MDN WebAssembly](https://developer.mozilla.org/en-US/docs/WebAssembly)

## 🚀 Next Steps

1. **Add more complex examples**: Image processing, data structures
2. **Implement API communication**: Fetch data from Rust
3. **Add testing**: Unit tests for Rust functions
4. **Optimize bundle size**: Tree shaking and code splitting
5. **Add multithreading**: Web Workers with WASM

## 🔍 Debugging Tips

- Open browser DevTools (F12) to see Rust console messages
- Use `wasm-pack build --dev` for debug builds with better error messages
- Check Network tab to ensure WASM files are loading correctly
- Use browser's WebAssembly debugger for step-through debugging

---

**Happy coding!** 🦀✨ This project provides a solid foundation for learning Rust + WebAssembly development. Start simple, experiment with the examples, and gradually build more complex features!
