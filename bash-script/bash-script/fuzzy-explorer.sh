#!/bin/bash


# requires bat/batcat aliased to bat https://github.com/sharkdp/bat?tab=readme-ov-file#installation
# requires fzf
# requires kitty terminal

# Path to the transparent image
transparent_image="~/Downloads/wallapapers/transparent.png"

# Function to preview files based on their extension
preview_file() {
    local file="$1"
    local extension="${file##*.}"

    # Debugging: Print the detected extension
    # echo "Detected extension: $extension"

    case "$extension" in
        txt|md) # text extensions, add as you wish
            # Display a transparent image before showing text
            kitty icat --clear --transfer-mode=memory --stdin=no --place="${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0" "$transparent_image"
            cat "$file"
            ;;
        png|webp|jpg)#image extensions
            kitty icat --clear --transfer-mode=memory --stdin=no --place="${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0" "$file"
            ;;
        py|sh|c|js|html|css)#code extensions, used with bat
            kitty icat --clear --transfer-mode=memory --stdin=no --place="${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0" "$transparent_image"
            batcat --color=always "$file"
            ;;


        *)
            # Handle unsupported file types (optional)
            echo "$extension is not setup, using text"
             # Display a transparent image before showing text
            kitty icat --clear --transfer-mode=memory --stdin=no --place="${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0" "$transparent_image"
            cat "$file"
            ;;
    esac
}

# Export the function so it's available in the subshell
export -f preview_file
directory="${1:-.}"
cd $directory
# Run fzf with the custom preview function
fzf --ansi --preview-window=up:60%:cycle --preview 'bash -c "preview_file {}"' | xargs echo 

