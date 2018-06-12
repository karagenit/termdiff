#!/usr/bin/env bash

# PPID is PID of Parent i.e. terminal that called the script
dir="/tmp/termdiff/$PPID"

# Create temp dir
mkdir -p "$dir"

# Run command passed as args, store output in temp dir
$@ > "$dir/new"

# If there's a previously stored output
if [ -f "$dir/old" ]
then
    # Diff outputs
    diff "$dir/old" "$dir/new"
fi

# Store last output
mv "$dir/new" "$dir/old"
