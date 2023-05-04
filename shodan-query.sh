#!/bin/bash

# Prompt the user for a Shodan search query
read -p "Enter your Shodan search query: " SEARCH_QUERY

# Replace spaces with underscores in the search query
SEARCH_QUERY_FILENAME="${SEARCH_QUERY// /_}"

# Download the search results from Shodan and save them to a file
shodan download "$SEARCH_QUERY_FILENAME.json.gz" "$SEARCH_QUERY" --limit 1000

# Parse the search results to extract the IP addresses and ports, and save them to the output file
shodan parse --fields ip_str,port --separator : "$SEARCH_QUERY_FILENAME.json.gz" > "$SEARCH_QUERY_FILENAME.txt"

echo "Search results saved to $SEARCH_QUERY_FILENAME.txt."
