#!/usr/bin/env bash
set -e

echo "🔨 Compilazione sito..."
npm run build

echo "📦 Preparazione branch gh-pages..."
touch dist/.nojekyll
cp dist/index.html dist/404.html

cd dist
rm -rf .git
git init
git checkout -b gh-pages
git add -A
git commit -m "deploy: site online"

echo "🚀 Pubblicazione online su GitHub Pages..."
git push -f https://github.com/PtrTella/FerroCalendar.git gh-pages:gh-pages
rm -rf .git

echo "✅ SITO ONLINE! Visita: https://ptrtella.github.io/FerroCalendar/"
