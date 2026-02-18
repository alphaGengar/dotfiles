#!/bin/bash
# Max number of characters so it fits nicely to the right of the notch
# MAY NOT WORK WITH NON-ENGLISH CHARACTERS
MAX_LENGTH=28
HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))
SPOTIFY_JSON="$INFO"
COVER_PATH="/tmp/cover.jpg"
PREVIOUS_COVER=""

TITLE_ITEM="spotify.title"
PLAY_ITEM="spotify.play"
PLAY_ICON=""

# Function to update album cover art
update_cover_art() {
    COVER=$(osascript -e 'tell application "Spotify" to get artwork url of current track')
    if [ "$COVER" != "$PREVIOUS_COVER" ] && [ -n "$COVER" ]; then
        PREVIOUS_COVER="$COVER"
        (
            curl -s --max-time 200 "$COVER" -o "$COVER_PATH.tmp" && \
            if [ -f "$COVER_PATH.tmp" ]; then
                mv "$COVER_PATH.tmp" "$COVER_PATH"
                sketchybar --set cover \
                    background.image="$COVER_PATH" \
                    background.image.scale=0.040 \
                    background.image.corner_radius=7 \
                    background.image.padding_left=18
            fi
        ) &
    fi
}

format_label() {
    local track="$1"
    local artist="$2"

    local track_length=${#track}
    local artist_length=${#artist}

    if [ $((track_length + artist_length)) -gt $MAX_LENGTH ]; then
        if [ $track_length -gt $HALF_LENGTH ] && [ $artist_length -gt $HALF_LENGTH ]; then
            track="${track:0:$((MAX_LENGTH % 2 == 0 ? HALF_LENGTH - 2 : HALF_LENGTH - 1))}…"
            artist="${artist:0:$((HALF_LENGTH - 2))}…"
        elif [ $track_length -gt $HALF_LENGTH ]; then
            track="${track:0:$((MAX_LENGTH - artist_length - 1))}…"
        elif [ $artist_length -gt $HALF_LENGTH ]; then
            artist="${artist:0:$((MAX_LENGTH - track_length - 1))}…"
        fi
    fi

    if [ -n "$artist" ]; then
        printf '%s  %s' "$track" "$artist"
    else
        printf '%s' "$track"
    fi
}

update_state() {
    if [[ -z $SPOTIFY_JSON ]]; then
        sketchybar --set "$TITLE_ITEM" label.drawing=off icon.color=0xffeed49f
        sketchybar --set "$PLAY_ITEM" icon="$PLAY_ICON" icon.color=0xffeed49f
        return
    fi

    PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '."Player State"')
    TRACK=$(echo "$SPOTIFY_JSON" | jq -r .Name)
    ARTIST=$(echo "$SPOTIFY_JSON" | jq -r .Artist)

    LABEL=""
    if [ -n "$TRACK" ] || [ -n "$ARTIST" ]; then
        LABEL=$(format_label "$TRACK" "$ARTIST")
    fi

    case "$PLAYER_STATE" in
    "Playing")
        ICON_COLOR=0xffa6da95
        LABEL_DRAWING=on
        update_cover_art
        ;;
    "Paused")
        ICON_COLOR=0xffeed49f
        LABEL_DRAWING=on
        ;;
    "Stopped")
        ICON_COLOR=0xffeed49f
        LABEL_DRAWING=off
        ;;
    *)
        ICON_COLOR=0xffeed49f
        LABEL_DRAWING=off
        ;;
    esac

    if [ -n "$LABEL" ] && [ "$LABEL_DRAWING" = "on" ]; then
        sketchybar --set "$TITLE_ITEM" label="$LABEL" label.drawing=on icon.color=$ICON_COLOR
    else
        sketchybar --set "$TITLE_ITEM" label.drawing=off icon.color=$ICON_COLOR
    fi

    sketchybar --set "$PLAY_ITEM" icon="$PLAY_ICON" icon.color=$ICON_COLOR
}

update_state
