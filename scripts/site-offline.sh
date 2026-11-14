#!/usr/bin/env bash
set -e

echo "🛑 Spegnimento sito (rimozione branch gh-pages su GitHub)..."
git push https://github.com/PtrTella/FerroCalendar.git --delete gh-pages || true

echo "✅ SITO OFFLINE! GitHub Pages non è più raggiungibile (404)."
