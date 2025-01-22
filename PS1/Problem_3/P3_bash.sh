#!/bin/bash
output_file="/root/Desktop/host/PS1/Problem_3/conversion_result.txt"
>"$output_file"
echo "Enter a number:"
read decimal
if ! [[ "$decimal" =~ ^[0-9]+$ ]]; then
  echo "Error: Input is not a number." | tee -a "$output_file"
  exit 1
fi
if (( decimal >= 100000 )); then
  echo "Error: The number is larger than 100000." | tee -a "$output_file"
  exit 1
fi
hexadecimal=$(printf "%X\n" "$decimal")
binary=""
num=$decimal
while (( num > 0 )); do
  binary=$(( num % 2 ))$binary
  num=$(( num / 2 ))
done
if [[ -z "$binary" ]]; then
  binary="0"
fi
echo "Decimal: $decimal"
echo "Hexadecimal: $hexadecimal"
echo "Binary: $binary"
echo "Decimal: $decimal" >> "$output_file"
echo "Hexadecimal: $hexadecimal" >> "$output_file"
echo "Binary: $binary" >> "$output_file"