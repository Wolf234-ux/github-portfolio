# Saurav Dodiya — AI Product Manager Portfolio

Ultra-luxury, editorial portfolio for **Saurav Dodiya — AI Product Manager** featuring interactive 3D WebGL core, 5-phase ADLC pipeline stepper, 4-layer AI Product Metrics scorecard, and privacy-first architectures.

---

## 🚀 Quick Start & Local Preview

### Option 1: Simple Local Server
```bash
# Python Simple Server
python -m http.server 8000
# Open http://localhost:8000 in your browser
```

### Option 2: Docker Container (Local Test)
```bash
# Build the Docker image
docker build -t saurav-dodiya-ai-product-manager .

# Run the container
docker run -p 8080:80 saurav-dodiya-ai-product-manager
# Open http://localhost:8080
```

---

## ☁️ Auto-Deployment on Render

This repository is pre-configured with a production-ready `Dockerfile` and `render.yaml` for zero-config automated deployment on [Render](https://render.com).

### Method 1: 1-Click Render Blueprint (Recommended)
1. Go to your [Render Dashboard](https://dashboard.render.com/).
2. Click **New +** → **Blueprint**.
3. Connect your GitHub repository: `https://github.com/Wolf234-ux/github-portfolio`.
4. Select the branch (e.g. `main` or `feature/ai-portfolio`).
5. Click **Apply**. Render will automatically build the Docker container and deploy your live URL.
6. **Continuous Deployment:** Every `git push` to your branch will automatically trigger a new deployment.

### Method 2: Manual Web Service on Render
1. Go to **New +** → **Web Service**.
2. Select `Wolf234-ux/github-portfolio`.
3. Set **Runtime** to `Docker`.
4. Set **Health Check Path** to `/healthz`.
5. Click **Create Web Service**.

---

## 📂 Repository Structure

- `index.html` — Main portfolio page (3D Three.js core, ADLC stepper, metrics matrix, case studies, experience)
- `styles.css` — Nabil Issa-inspired luxury dark obsidian design system, capsule rolling buttons, and animations
- `projects.json` — Quantified case studies, 4-layer metrics scorecard, and 5-phase ADLC data
- `Dockerfile` — Production Nginx Alpine container optimized for Render `$PORT` dynamic binding
- `nginx.conf.template` — Gzip compression, security headers, caching, and healthcheck
- `entrypoint.sh` — Dynamic port substitution script
- `render.yaml` — Render Blueprint specification
