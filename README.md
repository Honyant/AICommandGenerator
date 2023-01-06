# AI Command Generator

This script uses the GPT-3 davinci-code-002 api with zsh to convert natural language commands to bash commands (or really any POSIX-compliant shell).
Note: Only works with Linux and MacOS, and the user to have [homebrew](https://brew.sh/), [python3](https://www.python.org/downloads/), and [the openai package](https://pypi.org/project/openai/) to be installed locally.

## Installation

1. Clone the repo
2. Ensure that you have [homebrew](https://brew.sh/) (or apt on linux), [python3](https://www.python.org/downloads/), and [the openai package](https://pypi.org/project/openai/) (`pip install openai`) installed.
3. Run `./install.sh` to install the script.

## Usage

![sample](https://i.imgur.com/TrB8sCh.gif)
Press ctrl+R (on mac) once you have typed in a command in natural language. The script will then convert it to a bash command, and you can press enter to run it.