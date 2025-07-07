#!/bin/bash

# Directories to search
DIRS=(
    "$HOME/.local/share/applications"
    "/usr/share/applications"
)

# Print table header
printf "%-75s  %-35s  %-15s\n" "FILE" "NAME" "STATUS"
printf "%-75s  %-35s  %-15s\n" "----" "----" "------"

# Process .desktop files
for dir in "${DIRS[@]}"; do
    find "$dir" -type f -name "*.desktop" 2>/dev/null | while read -r file; do
        name=$(grep -m1 '^Name=' "$file" | cut -d'=' -f2-)
        hidden=$(grep -m1 '^Hidden=true' "$file" >/dev/null && echo "Hidden" || echo "")
        nodisplay=$(grep -m1 '^NoDisplay=true' "$file" >/dev/null && echo "NoDisplay" || echo "")

        # Combine status fields if needed
        status=""
        [[ -n "$hidden" ]] && status="$hidden"
        [[ -n "$nodisplay" ]] && status="${status:+$status,}$nodisplay"

        # Print each row
        printf "%-75s  %-35s  %-15s\n" "$file" "$name" "$status"
    done
done
