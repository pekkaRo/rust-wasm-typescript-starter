<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

# Rust + WebAssembly + TypeScript Project

This is a progressive learning project that demonstrates Rust compiled to WebAssembly, integrated with TypeScript and Vite.

## Project Structure
- `rust-wasm/`: Rust library code that compiles to WebAssembly
- `pkg/`: Generated WebAssembly output and TypeScript bindings
- `src/`: TypeScript frontend code
- `index.html`: Main HTML file with demo interface

## Development Guidelines

### Rust/WebAssembly
- Use `wasm-bindgen` for JS ↔ Rust interop
- Use `web-sys` for DOM manipulation from Rust
- Always add `#[wasm_bindgen]` annotation for exported functions
- Use `console_log!` macro for debugging output
- Build with: `cd rust-wasm && wasm-pack build --target web --out-dir ../pkg`

### TypeScript
- Import WASM functions from `../pkg/rust_wasm.js`
- Always initialize WASM module with `await init()` before using functions
- Handle async WASM loading properly
- Use proper TypeScript types (auto-generated in `pkg/`)

### Build Process
1. Compile Rust to WASM: `wasm-pack build --target web`
2. Run Vite dev server: `npm run dev`
3. Build for production: `npm run build`

### Learning Path
1. Start with simple functions (math, string processing)
2. Move to performance comparisons (Fibonacci, prime counting)
3. Learn DOM manipulation from Rust
4. Eventually add API communication and state management

### Best Practices
- Keep Rust functions focused and pure when possible
- Use TypeScript for type safety with WASM bindings
- Test performance-critical code in both JS and Rust
- Use browser dev tools for WASM debugging
