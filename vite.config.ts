import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      "/api/ai/ollama": {
        target: "https://ollama.com",
        changeOrigin: true,
        secure: true,
        rewrite: path => path.replace(/^\/api\/ai\/ollama/, "/api"),
      },
    },
  },
});
