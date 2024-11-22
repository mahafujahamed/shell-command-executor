#!/bin/bash

# Shell Command Executor with enhanced features

# Log file to store commands
LOG_FILE="command_log.txt"

# Function to log executed commands
log_command() {
    echo "$(date) - $1" >> $LOG_FILE
}

# Welcome message
echo "Welcome to the Enhanced Shell Command Executor!"
echo "Type your shell command below (or type 'exit' to quit, 'pc' to terminate all commands):"

# Start an infinite loop to accept commands
while true; do
    # Prompt user for command input
    read -p "$ " user_command  # Read the user input as a shell command

    # If the user types 'exit', break the loop and exit the script
    if [[ "$user_command" == "exit" ]]; then
        echo "Exiting the Shell Command Executor. Goodbye!"
        break
    fi

    # If the user types 'pc', terminate all running commands
    if [[ "$user_command" == "pc" ]]; then
        echo "Terminating all running commands..."
        pkill -P $$  # This kills all child processes of the current script (i.e., running commands)
        continue
    fi

    # Log the command
    log_command "$user_command"

    # Execute the user command and handle errors
    if ! eval "$user_command"; then
        echo "Error: Command failed or is invalid. Please try again."
    fi

    # Optional: Print an empty line for better readability between commands
    echo
done
