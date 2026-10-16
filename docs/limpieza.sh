#!/usr/bin/env bash
# Borra los restos de iteraciones anteriores (los 59 archivos de ARCHIVOS-A-BORRAR.txt, PERF-CAMBIOS.md y LEEME-CAMBIOS.txt).
# Probado: tras borrarlos, `npm run build` regenera index/reserva/privacidad/404 idénticos y `npm test` queda en verde.
# Uso, desde la raíz del repo:  bash docs/limpieza.sh
set -euo pipefail
cd "$(dirname "$0")/.."
ARCHIVOS=(
  ARCHIVOS-A-BORRAR.txt
  LEEME-CAMBIOS.txt
  PERF-CAMBIOS.md
  css/comparador.css
  css/donde.css
  css/header-tint.css
  css/horarios.css
  css/horizonte-perf.css
  css/horizonte-perf2.css
  css/horizonte-v54.css
  css/horizonte-v55.css
  css/horizonte-v56.css
  css/horizonte-v57.css
  css/horizonte-v58.css
  css/horizonte-v59.css
  css/horizonte-v60.css
  css/horizonte-v61.css
  css/horizonte-v62.css
  css/horizonte-v63.css
  css/horizonte-v66.css
  css/horizonte-v67.css
  css/horizonte-v72.css
  css/identidad.css
  css/lugar.css
  css/quieto.css
  css/resenas-compra.css
  css/secciones.css
  css/site.css
  data/autos.json
  fonts/LICENSE.txt
  fonts/bricolage-grotesque-latin.woff2
  fonts/cormorant-garamond-latin-400.woff2
  fonts/dm-serif-display-latin.woff2
  fonts/instrument-sans-latin.woff2
  images/og-horizonte.jpg
  js/app.js
  js/clips.js
  js/fondos.js
  js/header-tint.js
  js/hero-rail.js
  js/horizonte-v58.js
  js/identidad.js
  js/lugar.js
  js/perf-diag.js
  js/recorrido.js
  js/reserva-embed.js
  scripts/aplicar-demo.mjs
  scripts/aplicar-pendientes.mjs
  scripts/build.mjs
  scripts/check-all.mjs
  scripts/debug-anchors.mjs
  scripts/debug-ficha.mjs
  scripts/golive.mjs
  scripts/perf-baseline.mjs
  scripts/prerender.mjs
  scripts/quickwins.mjs
  scripts/quickwins2.mjs
  scripts/rebrand.mjs
  scripts/validate.mjs
)
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then git rm -q --ignore-unmatch -- "${ARCHIVOS[@]}"; else rm -f -- "${ARCHIVOS[@]}"; fi
echo "Borrados: ${#ARCHIVOS[@]} archivos (los que existían)."
npm run build && npm test
