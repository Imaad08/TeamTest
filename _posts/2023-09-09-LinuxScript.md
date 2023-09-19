---
toc: true
comments: false
layout: post
title: Linux Script
description: Simple Linux script for file actions such as copying, moving, deleting, and organizing files
courses: { compsci: { week: 3 } }
type: hacks
---

```bash
#!/bin/bash

# Function to copy files/directories
copy_files() {
    source="$1"
    destination="$2"

    if [ -e "$source" ]; then
        cp -r "$source" "$destination"
        echo "Copied $source to $destination"
    else
        echo "Source file/directory does not exist."
    fi
}

# Function to move files/directories
move_files() {
    source="$1"
    destination="$2"

    if [ -e "$source" ]; then
        mv "$source" "$destination"
        echo "Moved $source to $destination"
    else
        echo "Source file/directory does not exist."
    fi
}

# Function to delete files/directories
delete_files() {
    target="$1"

    if [ -e "$target" ]; then
        rm -r "$target"
        echo "Deleted $target"
    else
        echo "Target file/directory does not exist."
    fi
}

# Function to organize files into directories by file type
organize_files() {
    source_directory="$1"

    if [ -d "$source_directory" ]; then
        # Create directories for different file types (e.g., images, documents)
        mkdir -p "$source_directory/images" "$source_directory/documents"

        # Move files to the appropriate directories based on their type
        find "$source_directory" -type f -exec bash -c '
            file="$0"
            if [[ "$file" == *\.jpg ]] || [[ "$file" == *\.png ]]; then
                mv "$file" "$1/images"
            elif [[ "$file" == *\.pdf ]] || [[ "$file" == *\.doc ]]; then
                mv "$file" "$1/documents"
            fi
        ' {} "$source_directory" \;

        echo "Organized files in $source_directory"
    else
        echo "Source directory does not exist."
    fi
}

# Main menu
echo "File Management Script"
echo "1. Copy files/directories"
echo "2. Move files/directories"
echo "3. Delete files/directories"
echo "4. Organize files by type"
echo "5. Exit"

read -p "Select an option (1/2/3/4/5): " option

case "$option" in
    1)
        read -p "Enter source path: " source_path
        read -p "Enter destination path: " destination_path
        copy_files "$source_path" "$destination_path"
        ;;
    2)
        read -p "Enter source path: " source_path
        read -p "Enter destination path: " destination_path
        move_files "$source_path" "$destination_path"
        ;;
    3)
        read -p "Enter target path: " target_path
        delete_files "$target_path"
        ;;
    4)
        read -p "Enter source directory: " source_dir
        organize_files "$source_dir"
        ;;
    5)
        echo "Exiting script."
        exit 0
        ;;
    *)
        echo "Invalid option."
        ;;
esac
```

<script src="https://utteranc.es/client.js"
        repo="student2"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
