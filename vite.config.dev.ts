import { defineConfig } from 'vite'

export default defineConfig({
  base: './',
  server: {
    fs: {
      allow: ['..']
    }
  },
  optimizeDeps: {
    exclude: ['../pkg/rust_wasm.js']
  }
})
