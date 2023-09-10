#!/usr/bin/bash

# Usage message function
usage() {
    echo "Usage: $0 -s <script_name>"
    echo "Options:"
    echo "  -s <script_name>  Specify the script to run (script1, script2, script3, etc.)"
    exit 1
}

# Parse command-line options
while getopts ":s:" opt; do
    case $opt in
        s)
            script_name="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            usage
            ;;
    esac
done

# Check if the script_name is provided
if [ -z "$script_name" ]; then
    echo "Please specify a script using the -s option."
    usage
fi

# Define the directory where the scripts are located
scripts_directory="lib"

# Check if the specified script exists
script_path="${scripts_directory}/${script_name}.sh"
if [ ! -e "$script_path" ]; then
    echo "Script '$script_name' not found in $scripts_directory."
    exit 1
fi

# Execute the specified script
echo "Running '$script_name' script..."
bash "$script_path"

