# 🚀 My collection of `Linux/bash` scripts

A collection of some useful `Linux/bash` scripts that I use on a regular basis for doing different things.

<p align="center">
    <img src="artwork.png" alt="90s Computing Illustration" width="333"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Bash-5.x-brightgreen?logo=gnu-bash&logoColor=white" alt="Bash"/>
  <img src="https://img.shields.io/badge/Linux-Friendly-blue?logo=linux"/>
  <img src="https://img.shields.io/badge/Scripts-Collection-orange"/>
</p>

---

## 📜 List of Scripts

Here is an alphabetically ordered list of the scripts:

- 📝 **`capitalize-words.sh`**: Capitalizes all words in a given text.<br>
  <sub>Example: `capitalize-words.sh "WORD1 WORD2" "word1 word2" "word1 WORD2"`</sub>
- 🔍 **`check-line-endings.sh`**: Checks line endings and shows if they are Windows or Linux.
- 🧹 **`clean-trailing-spaces.sh`**: Removes trailing spaces from a list of given files. With the `-b` option, also creates a backup.<br>
  <sub>Example: `clean-trailing-spaces.sh -b file1.txt file2.java`</sub>
- 🏗️ **`create-script-skeleton.sh`**: Creates a skeleton for a bash script with argument parsing and checking, following good practices.
- 📄 **`count_pdf_pages.sh </path/to/dir>`**: Takes a directory and produces a table of all PDFs in it, with page counts and sizes.
- 🆚 **`diff-head-sh`**: Applies the `diff` command just on the head of the files. The number of head lines can be passed as a third argument.<br>
  <sub>Example: `diff-head a.txt b.txt 4`</sub>
- ↔️ **`expand.sh`**: Applies the `expand` command to the specified file by modifying it (outputs to standard output).<br>
  <sub>Example: `expand.sh file.txt` (if no additional arguments are passed, `-t 2` is used)</sub>
- 🔗 **`install-script.sh`**: Creates a link to a script at `/usr/local/bin` (can be changed via `DEFAULT_INST_DIR`).<br>
  <sub>Example: `install-script.sh launch-aibench.sh`</sub>
- 🧠 **`launch-aibench.sh`**: Starts an [AIBench](http://www.aibench.org/), with options (`-c/--compile` or `-cc/--clean-compile`) to build it before.
- 🗑️ **`remove-blank-lines.sh <file>`**: Edits the input `<file>` to remove all empty lines (lines without any characters or only spaces).
- 📑 **`repeat-pdfs <file> <times>`**: Repeats a PDF file multiple times using `pdftk` via Docker.
- 🔄 **`rename-reverse.sh </path/to/dir> [--dry-run]`**: Renames files starting with `<number>_` to invert all numbers. Use `--dry-run` to preview changes.<br>
  <sub>Example: `1_A.txt`, `2_B.txt`, `3_C.txt` → `1_C.txt`, `2_B.txt`, `3_A.txt`</sub>
- ➕ **`rename-increase.sh </path/to/dir> [increment] [--dry-run]`**: Renames files starting with `<number>_` to increase all numbers (default +1). Use `--dry-run` to preview.<br>
  <sub>Example: `1_A.txt`, `2_B.txt` → `2_A.txt`, `3_B.txt`</sub>

---

## 🛠️ Requirements

- Bash 4.x/5.x
- Standard Linux utilities (sed, awk, etc.)
- Some scripts may require additional tools (see script headers)

---

## 🤝 Contributing

Pull requests and suggestions are welcome! Feel free to open an issue or submit a PR.

---

<p align="center">
  <sub>Made with ❤️ by hlfernandez</sub>
</p>