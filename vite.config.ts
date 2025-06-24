import { defineConfig } from 'vite'

export default defineConfig(({ command }) => ({
  // serve (dev/preview) uses relative paths; build (GitHub Pages) uses repo subpath
  base: command === 'build'
    ? '/rust-wasm-typescript-starter/'
    : './',
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
}))
