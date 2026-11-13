import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  base: './', // Relative base for GitHub Pages and static deployments
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    sourcemap: false
  }
});
