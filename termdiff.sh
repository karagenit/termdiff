#!/usr/bin/env bash

# Configs
save="true"
output="false"
diff="true"
errors="false"
global="false"

# Set Configs by command line args
while [[ $1 == -* ]]; do
    case $1 in
        "-t" | "--temporary")
            save="false"
            ;;
        "-o" | "--output")
            output="true"
            ;;
        "-s" | "--silent")
            diff="false"
            ;;
        "-e" | "--errors")
            errors="true"
            ;;
        "-g" | "--global")
            global="true"
            ;;
        *)
            echo "Unknown Argument: $1"
            exit
    esac
    shift
done

# Make sure we were given some command
if [[ ! $1 ]]
then
    echo "Must provide some command to termdiff!"
    exit
fi

# Determine where to save output
if [[ "$global" == "true" ]]
then
    dir="/tmp/termdiff/1"
else
    # PPID is PID of Parent i.e. terminal that called the script
    dir="/tmp/termdiff/$PPID"
fi

# Create temporary dir
mkdir -p "$dir"

# Run command passed as args, store/display output/errors
if [[ "$output" == "true" && "$errors" == "true" ]]
then
    $@ |& tee "$dir/new"
elif [[ "$output" == "true" ]] # Errors is false
then
    $@ | tee "$dir/new"
elif [[ "$errors" == "true" ]] # Output is false
then
    $@ &> "$dir/new"
else # Both are False
    $@ > "$dir/new"
fi

# If there's a previously stored output, and we want a diff
if [[ -f "$dir/old" && "$diff" == "true" ]]
then
    # Diff outputs
    diff -u --color=always "$dir/old" "$dir/new"
fi

# If we want to save the current output for later diffing
if [[ "$save" == "true" ]]
then
    # Store last output
    mv "$dir/new" "$dir/old"
fi
