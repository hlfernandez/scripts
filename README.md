# My collection of `Linux/bash` scripts

A collection of some useful `Linux/bash` scripts that I use on a regular basis for doing different things.

<p align="center">
    <img src="artwork.png" alt="90s Computing Illustration" width="333"/>
</p>

## List of scripts
Here is a alphabetically ordered list of the scripts:
- `capitalize-words.sh`: this script capitalizes all words in a given text. Example: `capitalize-words.sh "WORD1 WORD2" "word1 word2" "word1 WORD2"`.
- `check-line-endings.sh`: this script checks line endings and shows if they are Windows or Linux.
- `clean-trailing-spaces.sh`: this script removes the trailing spaces of a list of given files passed as arguments. Moreover, with option `-b` it also creates a backup of the original file. Example: `clean-trailing-spaces.sh -b file1.txt file2.java`.
- `create-script-skeleton.sh`: this script creates an skeleton for a bash script with arguments parsing and checking following good practices.
- `diff-head-sh`: applies the `diff` command just on the head of the files. The number of head lines to consider can be passed as third argument. Example: `diff-head a.txt b.txt 4`.
- `expand.sh`: this script applies the `expand` command to the specified file by modifying it (the `expand` command produces the output in the standard output). Example: `expand.sh file.txt` (if no additional arguments are passed, `-t 2` is used).
- `install-script.sh`: makes a link to a script to it at `/usr/local/bin` (this path can be changed by editing the `DEFAULT_INST_DIR` variable in the script). For example, `install-script.sh launch-aibench.sh` will create a link to `launch-aibench.sh` at `/usr/local/bin/launch-aibench`. By default, the name of the link is the name of the script without the extension although it can be specified as second parameter.
- `launch-aibench.sh`: this script starts an [AIBench](http://www.aibench.org/), with options (`-c/--compile` or `-cc/--clean-compile`) to build it before.
- `remove-blank-lines.sh <file>`: this script edits the input `<file>` to remove all empty lines (lines without any characters at all or containing only space characters).
- `repeat-pdfs <file> <times>`: this script repeats a PDF file multiple times. To do so, it uses `pdftk` through a Docker image.
