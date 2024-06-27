#!/bin/bash

# Root README title and subtitle
echo "# CIS 623 Assured Programming and Formal Methods" > README.md
echo "## Table of Contents" >> README.md

# Titles for each week
titles=(
  "Week 1 Introduction"
  "Week 2 Beginning Steps"
  "Week 3 Programming Paradigms Part 1"
  "Week 4 Formal Methods and Programming"
  "Week 5 Applying Formal Methods Part 1"
  "Week 6 Applying Formal Methods Part 2"
  "Week 7 Programming Paradigms Part 2"
  "Week 8 Applying Formal Methods Part 3"
  "Week 9 Applying Formal Methods Part 4"
  "Week 10 Applying Formal Methods Part 5"
)

# Loop from 1 to 10 for folders and READMEs
for week in {1..10}; do
  # Create the folder name
  folder="week$week"
  
  # Make the directory
  mkdir -p "$folder"
  
  # Create the README.md file with the title and table of contents
  echo "# ${titles[$week-1]}" > "$folder/README.md"
  
  echo "## Table of Contents" >> "$folder/README.md"

  for i in {1..10}; do
    if [ $i -eq $week ]; then
      echo "- **&rarr;[${titles[$i-1]}](README.md)**" >> "$folder/README.md"**
      continue
    fi
    echo "- [${titles[$i-1]}](../week$i/README.md)" >> "$folder/README.md"
  done

  # Add hyperlink to the root README.md
  echo "- [${titles[$week-1]}](./$folder/README.md)" >> README.md
done