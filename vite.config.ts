import { defineConfig } from 'vite'

export default defineConfig({
  server: {
    fs: {
      allow: ['..']
    }
  },
  optimizeDeps: {
    exclude: ['../pkg/rust_wasm.js']
  }
})
