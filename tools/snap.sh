#!/bin/zsh
# Snapshots of every page in light and dark, with seed data, on a fresh test store.
# Usage: tools/snap.sh            all pages
#        APP_SNAPSHOT_PAGES=all,settings tools/snap.sh
#        tools/snap.sh -AppleShowScrollBars Always     see the scroll bars as people with a mouse see them
set -u
app=~/Applications/FormulaExMachina.app/Contents/MacOS/FormulaExMachina
store=/tmp/FormulaExMachina-test.store
shots=/tmp/FormulaExMachina-shots
# A crashed run leaves saved window state, and the next launch would wait on a "reopen windows?" alert.
rm -rf ~/Library/Saved\ Application\ State/net.sonnerstudio.formulaexmachina.savedState
# Seed data only fills an empty store, so start from nothing.
rm -f $store $store-shm $store-wal
rm -rf $shots
APP_STORE=$store APP_SEED=1 APP_SNAPSHOT=$shots $app "$@"
