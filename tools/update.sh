#!/bin/zsh
# ==============================================================================
# SonnerStudio Project Updater: Formula ex Machina
# Synchronisiert, baut, prüft und aktualisiert Formula ex Machina
# Kompatibel mit der SonnerStudio SternenMeister/Zeitmeister24 Updatemethode
# ==============================================================================

set -euo pipefail
here=${0:A:h:h}
cd "$here"

echo "=========================================================="
echo "  SonnerStudio Formula ex Machina – Update-Manager"
echo "=========================================================="

# 1. Lokalen Status prüfen
if [[ -n $(git status --porcelain) ]]; then
  echo "[1/5] Uncommitted Änderungen erkannt. Erstelle Sicherheits-Snapshot..."
  git add -A
  git commit -m "chore(snapshot): Automatischer Sicherheits-Snapshot vor Update $(date +%Y-%m-%d_%H-%M-%S)" || true
fi

# 2. Remote-Synchronisation (GitHub & SonnerStudio Central Git)
echo "[2/5] Prüfe auf Aktualisierungen in den Git-Remotes..."
git fetch central 2>/dev/null || true
git fetch origin 2>/dev/null || true
if git remote | grep -q "^github$"; then
  echo "       Hole Aktualisierungen von GitHub..."
  git fetch github 2>/dev/null || true
  git merge --ff-only github/main 2>/dev/null || git merge github/main --no-edit || true
fi

# Lokale Zweige mit central/origin abgleichen
git merge --ff-only central/main 2>/dev/null || true

current_rev=$(git rev-parse --short HEAD)
echo "       Aktueller Revisionsstand: $current_rev"

# 3. Test-Suite ausführen
echo "[3/5] Führe Verifikations- und Unit-Tests aus..."
swift test --scratch-path /tmp/FormulaExMachina-build

# 4. App neu kompilieren und installieren
echo "[4/5] Kompiliere Release-Build und installiere nach ~/Applications/..."
./build.sh

# 5. App-Neustart bei Bedarf
if [[ " $* " == *" --restart "* || " $* " == *" --open "* ]]; then
  echo "[5/5] Starte Formula ex Machina neu..."
  osascript -e 'quit app "FormulaExMachina"' 2>/dev/null || true
  sleep 0.8
  open "$HOME/Applications/FormulaExMachina.app"
else
  echo "[5/5] Update erfolgreich abgeschlossen! (Revision: $current_rev)"
fi

echo "=========================================================="
echo "  Formula ex Machina ist auf dem neuesten Stand."
echo "=========================================================="
