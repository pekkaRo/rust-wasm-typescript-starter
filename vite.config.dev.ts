import { defineConfig } from 'vite'

export default defineConfig({
  // No base path for local development
  server: {
    fs: {
      allow: ['..']
    }
  },
  optimizeDeps: {
    exclude: ['../pkg/rust_wasm.js']
  }
})
