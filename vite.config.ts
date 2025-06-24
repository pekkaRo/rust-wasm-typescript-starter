import { defineConfig } from 'vite'

export default defineConfig({
  base: '/rust-wasm-typescript-starter/',
  server: {
    fs: {
      allow: ['..']
    }
  },
  optimizeDeps: {
    exclude: ['../pkg/rust_wasm.js']
  },
  build: {
    assetsDir: 'assets',
    rollupOptions: {
      output: {
        manualChunks: undefined
      }
    }
  }
})
