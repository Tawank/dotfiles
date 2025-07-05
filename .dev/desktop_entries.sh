#!/bin/bash

# Locations to search for .desktop files
DIRS=(
    "$HOME/.local/share/applications"
    "/usr/share/applications"
)

echo -e "ILE\t\t\tNAME\t\t\tHIDDEN\tNODISPLAY"

for dir in "${DIRS[@]}"; do
    find "$dir" -type f -name "*.desktop" 2>/dev/null | while read -r file; do
        name=$(grep -m1 '^Name=' "$file" | cut -d'=' -f2-)
        hidden=$(grep -m1 '^Hidden=true' "$file" >/dev/null && echo "yes" || echo "no")
        nodisplay=$(grep -m1 '^NoDisplay=true' "$file" >/dev/null && echo "yes" || echo "no")
        printf "%s\t%s\t%s\t%s\n" "$file" "$name" "$hidden" "$nodisplay"
    done
done
