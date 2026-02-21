#!/bin/bash
# Bash syntax highlighting test for Islands Dark theme

# Comments should be gray (#7A7E85)
# This file tests various Bash syntax elements

# Shebang should be highlighted

set -euo pipefail  # Keywords should be orange (#CF8E6D)

# Variables - strings should be green (#6AAB73)
NAME="John Doe"
AGE=30                    # Numbers should be cyan (#2AACB8)
IS_ACTIVE=true           # Booleans/keywords orange
EMPTY=""

# Constants (convention - uppercase)
readonly API_URL="https://api.example.com"
readonly MAX_RETRIES=3
readonly TIMEOUT=5000

# Arrays
FRUITS=("apple" "banana" "cherry" "date")
NUMBERS=(1 2 3 4 5)
declare -a MIXED_ARRAY=("text" 123 "more text")

# Associative array
declare -A CONFIG=(
  [host]="localhost"
  [port]="8080"
  [enabled]="true"
)

# Command substitution
CURRENT_DATE=$(date +%Y-%m-%d)
CURRENT_USER=$(whoami)
FILE_COUNT=$(ls -1 | wc -l)

# Arithmetic expansion
SUM=$((5 + 3))
PRODUCT=$((10 * 20))
DIVISION=$((100 / 5))
MODULO=$((17 % 5))

# Parameter expansion
DEFAULT_VALUE="${UNDEFINED_VAR:-default}"
LENGTH=${#NAME}
UPPERCASE=${NAME^^}
LOWERCASE=${NAME,,}
SUBSTRING=${NAME:0:4}

# Function definitions - function names should be blue (#56A8F5)
function greet() {
  local name=$1
  echo "Hello, $name!"
}

# Alternative function syntax
say_goodbye() {
  local name="${1:-World}"
  echo "Goodbye, $name!"
}

# Function with multiple parameters
calculate_sum() {
  local a=$1
  local b=$2
  local result=$((a + b))
  echo "$result"
}

# Function with return value
is_even() {
  local num=$1
  if (( num % 2 == 0 )); then
    return 0  # Success
  else
    return 1  # Failure
  fi
}

# Conditional statements
check_file() {
  local filepath=$1
  
  # If statement with test command
  if [ -f "$filepath" ]; then
    echo "File exists: $filepath"
  elif [ -d "$filepath" ]; then
    echo "Directory exists: $filepath"
  else
    echo "Path does not exist: $filepath"
  fi
  
  # Modern test syntax
  if [[ -f "$filepath" && -r "$filepath" ]]; then
    echo "File is readable"
  fi
  
  # Numeric comparison
  if (( AGE >= 18 )); then
    echo "Adult"
  else
    echo "Minor"
  fi
}

# String comparisons
compare_strings() {
  local str1=$1
  local str2=$2
  
  if [[ "$str1" == "$str2" ]]; then
    echo "Strings are equal"
  elif [[ "$str1" < "$str2" ]]; then
    echo "str1 is less than str2"
  else
    echo "str1 is greater than str2"
  fi
  
  # Pattern matching
  if [[ "$str1" =~ ^[0-9]+$ ]]; then
    echo "String contains only digits"
  fi
}

# Loops
demonstrate_loops() {
  # For loop with range
  echo "For loop with range:"
  for i in {1..5}; do
    echo "  Iteration $i"
  done
  
  # For loop with array
  echo "For loop with array:"
  for fruit in "${FRUITS[@]}"; do
    echo "  Fruit: $fruit"
  done
  
  # For loop with C-style syntax
  echo "C-style for loop:"
  for ((i = 0; i < 5; i++)); do
    echo "  Index: $i"
  done
  
  # While loop
  echo "While loop:"
  local count=0
  while [ $count -lt 3 ]; do
    echo "  Count: $count"
    ((count++))
  done
  
  # Until loop
  echo "Until loop:"
  local num=5
  until [ $num -eq 0 ]; do
    echo "  Countdown: $num"
    ((num--))
  done
}

# Case statement
get_file_type() {
  local filename=$1
  
  case "$filename" in
    *.txt)
      echo "Text file"
      ;;
    *.jpg|*.jpeg|*.png)
      echo "Image file"
      ;;
    *.sh)
      echo "Shell script"
      ;;
    *.tar.gz|*.tgz)
      echo "Compressed archive"
      ;;
    *)
      echo "Unknown file type"
      ;;
  esac
}

# Error handling
safe_operation() {
  local file=$1
  
  # Check if file exists
  if [[ ! -f "$file" ]]; then
    echo "Error: File not found: $file" >&2
    return 1
  fi
  
  # Try to read file
  if ! cat "$file" > /dev/null 2>&1; then
    echo "Error: Cannot read file: $file" >&2
    return 1
  fi
  
  echo "Successfully processed: $file"
  return 0
}

# Trap for cleanup
cleanup() {
  echo "Cleaning up..."
  # Remove temporary files
  rm -f /tmp/temp_file_$$
}

trap cleanup EXIT

# Here document
generate_config() {
  cat <<EOF
# Configuration File
name = $NAME
age = $AGE
active = $IS_ACTIVE
date = $CURRENT_DATE
EOF
}

# Here string
process_input() {
  local input="Hello World"
  tr '[:lower:]' '[:upper:]' <<< "$input"
}

# Process substitution
compare_outputs() {
  diff <(ls /tmp) <(ls /var/tmp)
}

# Command chaining
chain_commands() {
  # AND operator - execute next if previous succeeds
  mkdir -p /tmp/test && cd /tmp/test && touch file.txt
  
  # OR operator - execute next if previous fails
  command_that_fails || echo "Command failed, but continuing"
  
  # Semicolon - execute regardless
  echo "First"; echo "Second"; echo "Third"
}

# Redirection
demonstrate_redirection() {
  # Redirect stdout to file
  echo "Output to file" > /tmp/output.txt
  
  # Append to file
  echo "Appended line" >> /tmp/output.txt
  
  # Redirect stderr
  command_that_errors 2> /tmp/errors.txt
  
  # Redirect both stdout and stderr
  some_command &> /tmp/all_output.txt
  
  # Redirect to null
  noisy_command > /dev/null 2>&1
}

# Pipes
process_with_pipes() {
  # Chain multiple commands
  cat /var/log/syslog | grep "error" | sort | uniq | wc -l
  
  # Complex pipeline
  ps aux | awk '{print $2, $11}' | sort -n | tail -10
  
  # Pipeline with tee
  echo "Log this" | tee -a /tmp/log.txt | wc -l
}

# Background jobs
run_background_job() {
  # Run in background
  long_running_command &
  local pid=$!
  
  echo "Started background job with PID: $pid"
  
  # Wait for specific job
  wait $pid
  echo "Job $pid completed"
}

# Subshell
use_subshell() {
  # Commands in subshell don't affect parent
  (
    cd /tmp
    echo "Current dir in subshell: $(pwd)"
  )
  echo "Current dir in parent: $(pwd)"
}

# Built-in commands should be highlighted (keywords - orange)
use_builtins() {
  # Read input
  read -p "Enter your name: " input_name
  
  # Echo with options
  echo -e "Line 1\nLine 2\nLine 3"
  echo -n "No newline"
  
  # Printf for formatted output
  printf "Name: %s, Age: %d\n" "$NAME" "$AGE"
  
  # Export variable
  export PATH="/usr/local/bin:$PATH"
  
  # Source another script
  # source ./other_script.sh
  
  # Eval (use with caution)
  local cmd="echo Hello"
  eval "$cmd"
}

# Arithmetic operations
demonstrate_arithmetic() {
  local a=10
  local b=5
  
  # Basic operations
  echo "Sum: $((a + b))"
  echo "Difference: $((a - b))"
  echo "Product: $((a * b))"
  echo "Quotient: $((a / b))"
  echo "Remainder: $((a % b))"
  echo "Power: $((a ** 2))"
  
  # Increment/decrement
  ((a++))
  ((b--))
  
  # Compound operations
  ((a += 5))
  ((b *= 2))
}

# Regular expressions
regex_matching() {
  local email="user@example.com"
  local pattern='^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
  
  if [[ $email =~ $pattern ]]; then
    echo "Valid email"
  else
    echo "Invalid email"
  fi
}

# Main execution
main() {
  echo "=== Bash Syntax Test ==="
  
  greet "Alice"
  say_goodbye "Bob"
  
  local sum=$(calculate_sum 10 20)
  echo "Sum: $sum"
  
  if is_even 4; then
    echo "4 is even"
  fi
  
  check_file "/etc/passwd"
  demonstrate_loops
  
  local file_type=$(get_file_type "script.sh")
  echo "File type: $file_type"
  
  echo "Current date: $CURRENT_DATE"
  echo "Current user: $CURRENT_USER"
}

# Run main if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi
