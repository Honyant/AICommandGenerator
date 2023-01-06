import sys
import openai
openai.api_key = "INSERT_KEY"
#credits for prompt: some guy on discord

response = openai.Completion.create(engine="code-davinci-002", prompt="""#!/bin/bash

# List of one-liner shell commands for Arch.
# Language: Bash
# Operating System: INSERT_OS_HERE

# Get my IP
dig +short myip.opendns.com @resolver1.opendns.com

# Print the current directory
pwd

# List files
ls -l

# Find every file that is not .mp3
find . -name '*' -type f -not -path '*.mp3'

# Change directory to /tmp
cd /tmp

# """ + " ".join(sys.argv[1:]) + "\n", max_tokens=100, temperature=0, stop="\n")
print(response.choices[0].text)