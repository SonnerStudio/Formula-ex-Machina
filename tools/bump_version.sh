#!/bin/zsh
# ==============================================================================
# SonnerStudio Automatic Version Manager: Formula ex Machina
# Verwaltet, inkrementiert und synchronisiert die Versionsnummer automatisch
# ==============================================================================

set -euo pipefail
here=${0:A:h:h}
version_file="$here/VERSION"

if [[ ! -f "$version_file" ]]; then
  echo "1.1.0" > "$version_file"
fi

current_ver=$(cat "$version_file" | tr -d '[:space:]')
IFS='.' read -r major minor patch <<< "$current_ver"
major=${major:-1}
minor=${minor:-1}
patch=${patch:-0}

action="sync"
if [[ " $* " == *" --bump "* || " $* " == *" --bump-patch "* ]]; then
  action="bump_patch"
elif [[ " $* " == *" --bump-minor "* ]]; then
  action="bump_minor"
elif [[ " $* " == *" --bump-major "* ]]; then
  action="bump_major"
fi

if [[ "$action" == "bump_patch" ]]; then
  patch=$((patch + 1))
  new_ver="${major}.${minor}.${patch}"
  echo "$new_ver" > "$version_file"
  echo "Versionsnummer automatisch erhöht: $current_ver -> $new_ver"
elif [[ "$action" == "bump_minor" ]]; then
  minor=$((minor + 1))
  patch=0
  new_ver="${major}.${minor}.${patch}"
  echo "$new_ver" > "$version_file"
  echo "Minor-Version automatisch erhöht: $current_ver -> $new_ver"
elif [[ "$action" == "bump_major" ]]; then
  major=$((major + 1))
  minor=0
  patch=0
  new_ver="${major}.${minor}.${patch}"
  echo "$new_ver" > "$version_file"
  echo "Major-Version automatisch erhöht: $current_ver -> $new_ver"
else
  new_ver="$current_ver"
  echo "Synchronisiere Version: $new_ver"
fi

build_timestamp=$(date +%Y%m%d%H%M)
build_date=$(date "+%Y.%m")

# Swift AppVersion Generator
target_swift="$here/Sources/FormulaExMachinaKit/AppVersion.swift"
cat <<EOF > "$target_swift"
// Generated automatically by tools/bump_version.sh
// DO NOT EDIT MANUALLY
import Foundation

public enum AppVersion: Sendable {
    public static let version = "$new_ver"
    public static let build = "$build_timestamp"
    public static let buildMonth = "$build_date"
    
    public static var displayString: String {
        "v\(version)"
    }
    
    public static var fullDescription: String {
        "\(version) (SonnerStudio Build \(buildMonth))"
    }
}
EOF

echo "Generiert: $target_swift ($new_ver, Build: $build_timestamp)"
