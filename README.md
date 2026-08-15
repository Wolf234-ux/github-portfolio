# AI-focused portfolio — guide

This branch (feature/ai-portfolio) adds a single-page portfolio site focused on AI product case studies and ADLC-style project explanations.

Preview locally:
1. Clone this repo and checkout the branch:
   git clone https://github.com/Wolf234-ux/github-portfolio.git
   cd github-portfolio
   git checkout feature/ai-portfolio

2. Serve locally (simple server):
   python3 -m http.server 8000
   Open http://localhost:8000

Files added:
- index.html        — homepage, hero, and project grid
- styles.css        — responsive styles
- projects.json     — generated project metadata and ADLC summaries for each repo
- assets/*.svg      — placeholder thumbnails (auto-generated)

Next steps if you want changes:
- Provide screenshots to replace placeholders (put them in assets/ and update filenames to match project ids).
- Edit copy in projects.json to add metrics, links, or more detailed case study content.
- I can open a PR comment with suggestions or iterate on changes before merging to main.

