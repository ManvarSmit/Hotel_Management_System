#!/bin/bash

# simple-interest.sh
# A simple shell script utility to calculate Simple Interest.
# NOTE: For a production HMS, this calculation should be handled by the core application logic (e.g., Python, Java).

## Function to calculate simple interest
calculate_interest() {
    # P = Principal Amount
    # R = Annual Rate of Interest (as a percentage)
    # T = Time (in years)
    # Simple Interest (SI) = (P * R * T) / 100

    local P=$1
    local R=$2
    local T=$3

    # Use 'bc' (basic calculator) for floating point arithmetic, as standard shell arithmetic (let, $()) is integer-only.
    local SI=$(echo "scale=2; ($P * $R * $T) / 100" | bc)
    
    echo "----------------------------------------"
    echo "Calculation Details:"
    echo "Principal (P): $P"
    echo "Rate (R): $R%"
    echo "Time (T): $T years"
    echo "----------------------------------------"
    echo "Simple Interest (SI): $SI"
    echo "Total Amount (P + SI): $(echo "scale=2; $P + $SI" | bc)"
    echo "----------------------------------------"
}

## Main execution block
echo "Simple Interest Calculator Utility"
echo "----------------------------------------"

# 1. Get Principal Amount
read -p "Enter Principal Amount (e.g., 1000): " principal
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Principal must be a valid number."
    exit 1
fi

# 2. Get Annual Interest Rate
read -p "Enter Annual Rate of Interest (e.g., 5.5): " rate
if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Rate must be a valid number."
    exit 1
fi

# 3. Get Time Period
read -p "Enter Time Period in Years (e.g., 2): " time
if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Time must be a valid number."
    exit 1
fi

# Perform the calculation
calculate_interest "$principal" "$rate" "$time"

exit 0
