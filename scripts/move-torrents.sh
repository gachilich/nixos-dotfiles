#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
WATCH=false
for arg in "$@"; do
    case "$arg" in
        --watch) WATCH=true ;;
        --) shift; break ;;
        -*) echo "Using: $0 [--watch] [directory]" >&2; exit 2 ;;
        *) BASE_DIR="$(cd -- "$arg" && pwd)" ;;
    esac
done
TARGET_DIR="$BASE_DIR/torrents"
mkdir -p -- "$TARGET_DIR"

move_torrents() {

    while IFS= read -r -d '' file; do
        name="$(basename -- "$file")"
        destination="$TARGET_DIR/$name"

        if [[ -e "$destination" ]]; then
            stem="${name%.torrent}"
            n=1
            while [[ -e "$TARGET_DIR/${stem}_$n.torrent" ]]; do ((n++)); done
            destination="$TARGET_DIR/${stem}_$n.torrent"
        fi
        mv -- "$file" "$destination"
        printf 'Moved: %s -> %s\n' "$file" "$destination"
    done < <(find "$BASE_DIR" -path "$TARGET_DIR" -prune -o -type f -iname '*.torrent' -print0)
}

move_torrents

if $WATCH; then
    while sleep 5; do move_torrents; done
fi
