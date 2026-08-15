# github-portfolio

Personal portfolio repository for showcasing projects, resume, and contact information. This repo is intended to be deployed as a static site (GitHub Pages or other static host).

Purpose / Use case
- Central place to list and demo your projects with links, screenshots, and short descriptions.
- Provide a public resume, contact information and ways to connect (email / LinkedIn / Twitter / GitHub).
- Serve as a canonical URL to share in applications or profiles.

What’s included
- index.html (main portfolio page)
- assets/ (images, screenshots, icons)
- projects/ (project pages or demos)
- styles/ (CSS)
- scripts/ (optional JavaScript enhancements)

How to preview locally
1. Clone the repo:
   git clone https://github.com/Wolf234-ux/github-portfolio.git
   cd github-portfolio

2. Quick preview (Python simple server):
   python3 -m http.server 8000
   Open http://localhost:8000 in your browser.

3. Or use a static dev server (npm):
   npm install -g serve
   serve .

Deploy (GitHub Pages)
1. Push the repo to GitHub (owner: Wolf234-ux).
2. In the repository Settings → Pages, set the source branch to `main` (or `gh-pages`) and the folder to `/ (root)` or `/docs` depending on where your built site lives.
3. GitHub will publish at: https://Wolf234-ux.github.io/github-portfolio/

Customizing the site
- Update index.html with your name, bio, profile image, and social links.
- Edit projects/ to add markdown or HTML pages for individual projects (include README, screenshots, demo links).
- Replace placeholder images in assets/.

Suggested structure
- index.html
- projects/
  - project-1/
    - index.html
    - screenshot.png
    - README.md
- assets/
  - profile.jpg
  - screenshots/
- styles/
  - main.css

Good practices
- Keep project pages concise: description, tech stack, live demo link (if any), repo link, and one screenshot.
- Add meta tags for SEO and OpenGraph for nicer previews on social platforms.
- Add a LICENSE file if you want to allow reuse of content.

Optional enhancements
- Use a static site generator (Jekyll, Hugo, 11ty, Next.js) for easier templating and content management.
- Add a contact form connected to a serverless function or email provider (Netlify Functions, Formspree).
- Add analytics (self-hosted or privacy-respecting) to track visitors.

License & credits
- Content (text & images) — choose a license (e.g., CC-BY-SA for content).
- Code (any theme or template) — respect original license and include attribution.

Contact
- Replace placeholders in the site with your preferred email and social links.
