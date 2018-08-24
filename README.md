# My collection of `Linux/bash` scripts

A collection of some useful `Linux/bash` scripts that I use on a regular basis for doing different things.

## List of scripts
Here is a alphabetically ordered list of the scripts:
- `clean-trailing-spaces.sh`: this script removes the trailing spaces of a list of given files passed as arguments. Moreover, with option `-b` it also creates a backup of the original file. Example: `clean-trailing-spaces.sh -b file1.txt file2.java`.
- `expand.sh`: this script applies the `expand` command to the specified file by modifyng it (the `expand` comand produces the output in the standard output). Example: `expand.sh file.txt` (if no additional arguments are passed, `-t 2` is used).
- `diff-head-sh`: applies the `diff` command just on the head of the files. The number of head lines to consider can be passed as third argument. Example: `diff-head a.txt b.txt 4`.
- `install-script.sh`: makes a link to a script to it at `/usr/local/bin` (this path can be changed by editing the `DEFAULT_INST_DIR` variable in the script). For example, `install-script.sh launch-aibench.sh` will create a link to `launch-aibench.sh` at `/usr/local/bin/launch-aibench`. By default, the name of the link is the name of the script without the extension although it can be specified as second parameter.
- `launch-aibench.sh`: this script starts an [AIBench](http://www.aibench.org/), with options (`-c/--compile` or `-cc/--clean-compile`) to build it before.