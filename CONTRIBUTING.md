# Contributing to Rust WebAssembly TypeScript Starter

Thank you for your interest in contributing! This project is designed to help people learn Rust + WebAssembly development.

## Development Setup

1. **Prerequisites:**
   - [Rust](https://rustup.rs/) (latest stable)
   - [Node.js](https://nodejs.org/) (v18 or later)
   - [wasm-pack](https://rustwasm.github.io/wasm-pack/installer/)

2. **Clone and setup:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/rust-wasm-typescript-starter.git
   cd rust-wasm-typescript-starter
   npm install
   ```

3. **Build and run:**
   ```bash
   # Build Rust to WebAssembly
   ./build-wasm.sh
   
   # Start development server
   npm run dev
   ```

## Project Structure

- `rust-wasm/` - Rust source code that compiles to WebAssembly
- `src/` - TypeScript frontend code
- `pkg/` - Auto-generated WebAssembly output (don't edit manually)

## Making Changes

### Adding Rust Functions

1. Add your function in `rust-wasm/src/lib.rs` with `#[wasm_bindgen]` annotation
2. Rebuild WebAssembly: `./build-wasm.sh`
3. Update TypeScript code in `src/main.ts` to use the new function
4. Test your changes in the browser

### Modifying the Frontend

1. Update TypeScript code in `src/main.ts`
2. Modify styling in `src/style.css`
3. Update HTML structure in `index.html` if needed

## Code Style

- **Rust**: Follow standard Rust formatting (`cargo fmt`)
- **TypeScript**: Use meaningful variable names and proper types
- **Comments**: Add comments for complex logic, especially in Rust functions

## Submitting Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Make your changes and test them
4. Commit with descriptive messages
5. Push to your fork and create a Pull Request

## Ideas for Contributions

### Beginner-Friendly
- Add more math functions (factorial, power, etc.)
- Implement additional string processing functions
- Add input validation and error handling
- Improve UI styling and responsiveness

### Intermediate
- Add image processing examples
- Implement data structure examples (vectors, hashmaps)
- Add performance benchmarking tools
- Create more complex DOM manipulation examples

### Advanced
- Add Web Workers integration
- Implement multi-threading examples
- Add API communication from Rust
- Create advanced memory management examples

## Questions?

Feel free to open an issue for questions, suggestions, or bug reports!

## Learning Resources

- [Rust and WebAssembly Book](https://rustwasm.github.io/docs/book/)
- [wasm-bindgen Guide](https://rustwasm.github.io/wasm-bindgen/)
- [web-sys Documentation](https://rustwasm.github.io/wasm-bindgen/web-sys/index.html)
