#!/usr/bin/env bash
set -euo pipefail

# As I am using beets to fetch song lyrics now, beets injects the lyrics into the song metadata.
# However, RMPC does not support reading lyrics directly from the song file and explicitly
# requires a .lrc file for each song. See https://github.com/mierak/rmpc/issues/287

if [ $# -ne 1 ]; then
    echo "Usage: $0 \"/path/to/Artist/Album\""
    exit 1
fi

# e.g., 'Rauw\ Alejandro/Saturno'
ALBUM_DIR="$1"
if [ ! -d "$ALBUM_DIR" ]; then
    echo "Error: '$ALBUM_DIR' is not a directory."
    exit 1
fi

ARTIST="$(basename "$(dirname "$ALBUM_DIR")")"
ALBUM="$(basename "$ALBUM_DIR")"

# All my music albums contain either FLAC or MP3 files, they are not mixed.
# Therefore, running a loop for both file formats is safe.
music_files=()
for f in "$ALBUM_DIR"/*.flac "$ALBUM_DIR"/*.mp3; do
    if [ -f "$f" ]; then
        music_files+=("$f")
    fi
done

if [ "${#music_files[@]}" -eq 0 ]; then
    echo "Error: No music files (FLAC or MP3) found in '$ALBUM_DIR'."
    exit 1
fi

_first_file="${music_files[0]}"
FILE_FORMAT="${_first_file##*.}"

# Arguments:
#   $1 = ARTIST
#   $2 = ALBUM
#   $3 = TITLE_RAW
#   $4 = OUTPUT_LRC_FILE (full path, e.g. /.../Song.lrc)
extract_lyrics() {
    local artist="$1"
    local album="$2"
    local title="$3"
    local out_lrc="$4"

    # We grep here because beet adds a final line for the lrclib source URL
    local lyrics="$(beet lyrics "$artist" "$album" "$title" -p 2>/dev/null | grep "\[.*\]")"

    if [ -z "$lyrics" ]; then
        echo " No synced lyrics for: \"$title\""
        return 1
    fi

    echo "$lyrics" | sed -E '/^\[(ar|al|ti):/d' > "$out_lrc"
    echo " Saved lyrics: $(basename "$out_lrc")"
    return 0
}

echo " Fetching lyrics for all .$FILE_FORMAT in: $ALBUM_DIR"
echo "  Artist: $ARTIST"
echo "  Album:  $ALBUM"
echo

shopt -s nullglob
for file in "$ALBUM_DIR"/*."$FILE_FORMAT"; do
    TITLE_RAW="$(echo "$(basename "$file" ."$FILE_FORMAT")" | sed "s/[0-9]*\s//")"
    LRC_FILE="${file%.$FILE_FORMAT}.lrc"

    if [ -f "$LRC_FILE" ]; then
        echo "– Skipping \"$TITLE_RAW\" (already have .lrc)"
        continue
    fi

    if ! extract_lyrics "$ARTIST" "$ALBUM" "$TITLE_RAW" "$LRC_FILE"; then
        # a failure just prints the “No lyrics for…” message and moves on
        continue
    fi
done

echo
echo "Done."
